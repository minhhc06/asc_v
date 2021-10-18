import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/DetailPolicyPageBloc/DetailPolicyPageBloc.dart';
import 'package:vnu_app/src/pages/ReviewFormPage/components/ReviewFormPageComponents.dart';
import 'package:vnu_app/src/pages/ReviewFormPage/components/ReviewFormPageRadioComponent.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/model/ReviewFormPageModelRequest/ReviewFormPageModelRequest.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/IntUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ReviewFormPage extends StatefulWidget {
  // final String title;
  DetailPolicyPageBloc bloc;

  ReviewFormPage({this.bloc});

  @override
  _ReviewFormPageState createState() => _ReviewFormPageState();
}

class _ReviewFormPageState extends State<ReviewFormPage> with BaseComponent {
  ReviewFormPageModelRequest modelRequest = new ReviewFormPageModelRequest();
  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerContent = new TextEditingController();

  @override
  void initState() {
    super.initState();
    // widget.bloc.setDateTime(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(
          title: WordUtil.acceptOrReject,
          context: context,
          iconDataBack: Icons.arrow_back_ios),
      body: StreamBuilder<DetailPolicyPageModel>(
          stream: widget.bloc.getDetailPolicyPageModel,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              modelRequest.id = snapshot.data.id;
              modelRequest.loaiDon = snapshot.data.loaiDon;
              snapshot.data.ngayHuongBHXH != ''
                  ? widget.bloc
                      .setDateTime(DateTime.parse(snapshot.data.ngayHuongBHXH))
                  : widget.bloc.setDateTime(DateTime.now());
              if (snapshot.data.ngayHuongBHXH != '') {
                widget.bloc
                    .setDateTime(DateTime.parse(snapshot.data.ngayHuongBHXH));
                modelRequest.thoiGian = snapshot.data.ngayHuongBHXH;
              } else {
                widget.bloc.setDateTime(DateTime.now());
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(DoubleUtil.padding16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        buildContent(
                            title: '${WordUtil.title}:',
                            value: '${snapshot.data.tieuDe}'),
                        SizedBox(
                          height: DoubleUtil.padding8,
                        ),
                        ReviewFormPageRadioComponent(
                          modelRequest: modelRequest,
                        ),
                        SizedBox(
                          height: DoubleUtil.padding8,
                        ),
                        snapshot.data.loaiDon != IntUnit.annualLeaveStatus
                            ? buildTextFieldWithCalendar(
                                hintText: WordUtil.selectDate,
                                label: WordUtil.selectDate,
                                context: context,
                                stream: widget.bloc.getDateTime,
                                initialDate: snapshot.data.ngayHuongBHXH != ''
                                    ? DateTime.parse(
                                        snapshot.data.ngayHuongBHXH)
                                    : null,
                                onTap: (date) {
                                  modelRequest.thoiGian =
                                      date.toIso8601String();
                                  widget.bloc.setDateTime(date);
                                },
                              )
                            : Container(),
                        ReviewFormPageComponents().buildInputContent(
                            controller: controllerContent,
                            validate: (String value) {
                              if (value == null || value.isEmpty) {
                                return WordUtil.inputContent;
                              }
                              return null;
                            }),
                        SizedBox(
                          height: DoubleUtil.padding8,
                        ),
                        buildButton(
                            title: WordUtil.sendDecision,
                            function: () {
                              if (_formKey.currentState.validate()) {
                                modelRequest.lyDoDuyet =
                                    controllerContent.value.text;
                                showDialogProcessingUtil(context: context);
                                widget.bloc.fetchApiReview(
                                    context: context,
                                    modelRequest: modelRequest);
                              }
                            })
                      ],
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
    );
  }
}
