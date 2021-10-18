import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';

class ButtonNotification extends StatelessWidget {
  const ButtonNotification({
    Key key,
    this.imagePath,
    this.buttonName,
    this.count,
    this.borderBottom = false,
    this.borderCount = false,
    this.function,
  }) : super(key: key);
  final String imagePath;
  final String buttonName;
  final String count;
  final bool borderBottom;
  final bool borderCount;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: function,
        child: Row(
          children: [
            SvgPicture.asset(
              imagePath,
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 1.0,
                          color: borderBottom ? Colors.black12 : Colors.white),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          buttonName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: ConfigUnit.roboto,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: borderCount ? 3 : 0,
                            horizontal: borderCount ? 6 : 0),
                        decoration: BoxDecoration(
                            color: borderCount ? Colors.red : Colors.white,
                            borderRadius: BorderRadius.all(
                                Radius.circular(borderCount ? 50 : 0))),
                        child: Text(
                          count,
                          style: TextStyle(
                            fontSize: borderCount ? 12 : 16,
                            color: borderCount ? Colors.white : Colors.black45,
                            fontFamily: ConfigUnit.roboto,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
