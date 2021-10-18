import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBlocV2.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/RequestLeavePageComponent.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class MultiList extends StatefulWidget {
  const MultiList(
      {Key key,
      this.listReasonTime,
      this.title,
      this.hintDateName,
      this.requestLeaveModelState,
      this.requestLeaveBloc})
      : super(key: key);
  final List<ReasonTime> listReasonTime;
  final RequestLeaveBlocV2 requestLeaveBloc;
  final String title;
  final String hintDateName;
  final RequestLeaveModelState requestLeaveModelState;
  @override
  _MultiListState createState() => _MultiListState();
}

class _MultiListState extends State<MultiList> {
  void addItem() {
    List<ReasonTime> list = widget.listReasonTime ?? [];
    list.add(ReasonTime());
    widget.requestLeaveBloc.setRequestLeaveModelState(
      RequestLeaveModelState.cloneAndUpdate(
        requestLeaveModelState: widget.requestLeaveModelState,
        requestLeaveModelStateUpdate: RequestLeaveModelState(
          listReasonTime: list,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.listReasonTime == null) addItem();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width,
          child: Text(
            widget.title,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: ConfigUnit.bold,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        ...widget.listReasonTime.map<Widget>(
          (item) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 3,
                child: RequestLeavePageComponent().buildDrodDownDate(
                  value: item?.time,
                  hintText: widget.hintDateName,
                  context: context,
                  onTap: (date) {
                    if (date == null) return;
                    widget.listReasonTime[widget.listReasonTime.indexOf(item)] =
                        ReasonTime(
                      time: date,
                      session: item?.session,
                    );
                    widget.requestLeaveBloc.setRequestLeaveModelState(
                      RequestLeaveModelState.cloneAndUpdate(
                        requestLeaveModelState: widget.requestLeaveModelState,
                        requestLeaveModelStateUpdate:
                            new RequestLeaveModelState(
                          listReasonTime: widget.listReasonTime,
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: RequestLeavePageComponent().buildDrodDown<String>(
                    hintText: WordUtil.selectSession,
                    context: context,
                    list: [
                      Session.FullTime.values,
                      Session.Morning.values,
                      Session.Afternoon.values
                    ],
                    value: item?.session?.values,
                    function: (String text) {
                      Session session = text == Session.FullTime.values
                          ? Session.FullTime
                          : text == Session.Morning.values
                              ? Session.Afternoon
                              : Session.Morning;
                      widget.listReasonTime[
                          widget.listReasonTime.indexOf(item)] = ReasonTime(
                        time: item?.time,
                        session: session,
                      );
                      widget.requestLeaveBloc.setRequestLeaveModelState(
                        RequestLeaveModelState.cloneAndUpdate(
                          requestLeaveModelState: widget.requestLeaveModelState,
                          requestLeaveModelStateUpdate:
                              new RequestLeaveModelState(
                            listReasonTime: widget.listReasonTime,
                          ),
                        ),
                      );
                    }),
              ),
              if (widget.listReasonTime.length > 1 && item.isEmpty())
                Center(
                  child: InkWell(
                    onTap: () {
                      List<ReasonTime> list = widget.listReasonTime;
                      list.remove(item);
                      widget.requestLeaveBloc.setRequestLeaveModelState(
                        RequestLeaveModelState.cloneAndUpdate(
                          requestLeaveModelState: widget.requestLeaveModelState,
                          requestLeaveModelStateUpdate: RequestLeaveModelState(
                            listReasonTime: list,
                          ),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (widget.listReasonTime
                .where((element) => element.isEmpty() == false)
                .length ==
            0)
          InkWell(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black54,
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
            ),
            onTap: () => addItem(),
          )
      ],
    );
  }
}
