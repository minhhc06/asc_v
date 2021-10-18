import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

import '../../../utils/word/WordUtil.dart';

class TitleWellcome extends StatelessWidget {
  const TitleWellcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
        bottom: 12,
      ),
      child: Text(
        WordUtil.selectLoginWellcom,
        style: TextStyle(
          color: MyHexColor(ColorUtil.black),
          decoration: TextDecoration.none,
          fontSize: 14,
          fontFamily: ConfigUnit.italic,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
