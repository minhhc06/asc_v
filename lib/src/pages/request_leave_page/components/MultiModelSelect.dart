import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/MultiSelectModelBloc.dart';

class MultiModelSelect<T> extends StatefulWidget {
  const MultiModelSelect({
    Key key,
    this.children,
    this.listData,
    this.function,
    this.values,
  }) : super(key: key);
  final List<Widget> children;
  final List<T> listData;
  final Function function;
  final List<T> values;
  @override
  _MultiModelSelectState createState() => _MultiModelSelectState();
}

class _MultiModelSelectState<T> extends State<MultiModelSelect> {
  MultiSelectModelBloc<T> multiSelectModelBloc;
  @override
  void initState() {
    super.initState();
    multiSelectModelBloc =
        new MultiSelectModelBloc<T>(listData: widget.values ?? []);
  }

  List<Widget> buildListWidget({List<T> listData}) {
    List<Widget> listWidget = [];
    for (var i = 0; i < widget.children.length; i++) {
      listWidget.add(Row(
        children: [
          Checkbox(
            value: listData.contains(widget.listData[i]),
            onChanged: (e) {
              e
                  ? listData.add(widget.listData[i])
                  : listData.remove(widget.listData[i]);
              multiSelectModelBloc.setListData(listData);
              widget.function(listData);
            },
          ),
          Expanded(child: widget.children[i]),
        ],
      ));
    }
    return listWidget;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: StreamBuilder<List<T>>(
        stream: multiSelectModelBloc.listDataStream,
        builder: (_, snapshot) {
          if (snapshot.data == null)
            return LinearProgressIndicator();
          else
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [...buildListWidget(listData: snapshot.data)],
            );
        },
      ),
    );
  }
}
