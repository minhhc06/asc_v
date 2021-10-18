import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/notification_bloc/NotificationBloc.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

class ButtonAppBar extends StatelessWidget {
  const ButtonAppBar({
    Key key,
    this.textButton,
    this.notificationCount,
    this.bloc,
    this.function,
    this.buttonIndex,
  }) : super(key: key);
  final String textButton;
  final int buttonIndex;
  final int notificationCount;
  final Function function;
  final NotificationBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: StreamBuilder<int>(
            stream: bloc.subject,
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                Container(
              height: 32,
              decoration: BoxDecoration(
                  color: snapshot.data == buttonIndex
                      ? Colors.transparent
                      : MyHexColor(ColorUtil.colorLv4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  border: Border.all(
                      color: snapshot.data == buttonIndex
                          ? Colors.white
                          : Colors.transparent,
                      width: 1)),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.only(top: 3, bottom: 3),
                ),
                onPressed: () {
                  bloc.setIndex(buttonIndex);
                  function();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Align(
                    child: Text(
                      textButton,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: ConfigUnit.bold,
                        color: MyHexColor(ColorUtil.white),
                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: new BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(50),
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              '2',
              style: new TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
