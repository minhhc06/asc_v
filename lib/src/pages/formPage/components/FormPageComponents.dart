import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class FormPageComponents extends BaseComponent {
  Widget buildFeature({@required title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: DoubleUtil.padding8),
      child: Row(
        children: [
          Expanded(flex: 1, child: Icon(Icons.assignment_outlined)),
          Expanded(flex: 8, child: Text('$title')),
          Expanded(
            flex: 2,
            child: Container(
              decoration:
                  myBoxDecoration(backgroundColor: MyHexColor(ColorUtil.green)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      '$iconForm',
                      color: Colors.white,
                    ),
                    Text(
                      WordUtil.export,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
