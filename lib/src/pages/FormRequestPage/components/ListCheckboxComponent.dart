import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/FormRequestBloc/FormRequestBloc.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';

class ListCheckboxComponent extends StatefulWidget {
  final String appBar;
  final FormRequestBloc bloc;


  ListCheckboxComponent({this.appBar, this.bloc});

  @override
  _ListCheckboxComponentState createState() => _ListCheckboxComponentState();
}

class _ListCheckboxComponentState extends State<ListCheckboxComponent> with BaseComponent {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(title: '${widget.appBar}', context: context),
      body: StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Container();
        }
      ),
    );
  }
}
