import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({Key key, this.height = 1.2, this.text}) : super(key: key);
  final String text;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        left: 5,
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black,
                fontFamily: ConfigUnit.italic,
                decoration: TextDecoration.none,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1.2,
              decoration: BoxDecoration(
                color: Colors.black26,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
