import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/repository/components/dialog_component/DialogComponent.dart';
import 'package:vnu_app/src/utils/IconsPathUtil.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/model/ListItemsModelUtil.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

import 'dart:math' as math;

class BaseComponent {
  AppBar appBarUtil(
      {@required title,
      @required BuildContext context,
      IconData iconDataBack,
      Function onPressLeading,
      IconData iconDataAction,
      Function onPressActions,
      PreferredSizeWidget bottom}) {
    return AppBar(
      centerTitle: true,
      title: Text('$title'),
      flexibleSpace: Image.asset(
        '$backgroundAppBar',
        fit: BoxFit.fill,
        height: double.infinity,
      ),
      leading: iconDataBack != null
          ? IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                onPressLeading != null
                    ? onPressLeading()
                    : Navigator.pop(context);
              },
            )
          : Container(),
      actions: [
        iconDataAction != null
            ? IconButton(
                icon: Icon(
                  iconDataAction,
                  color: Colors.white,
                ),
                onPressed: onPressActions)
            : Container()
      ],
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: bottom),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(0.0),
              child: Container(),
            ),
    );
  }

  showDialogProcessingUtil({BuildContext context}) async {
    await Future.delayed(Duration(milliseconds: 50));
    dialogProcessing(context: context);
  }

  dialogProcessingUtilApi({
    BuildContext context,
  }) {}

  Future<InternetStatus> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('example.com')
          .timeout(const Duration(seconds: DoubleUtil.TIME_OUT), onTimeout: () {
        throw 'Request Time Out';
      });
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return InternetStatus.connected;
      } else {
        return InternetStatus.notconnected;
      }
    } on SocketException catch (_) {
      return InternetStatus.notconnected;
    }
  }

  Widget emptyData() {
    return Center(
        child: SvgPicture.asset('${IconsPathUtil.iconEmptyData}',
            height: 300, width: 300));
  }

  Widget buildButton(
      {@required String title,
      Color backgroundColor,
      Color titleColor,
      Function function}) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        decoration: myBoxDecoration(backgroundColor: backgroundColor),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  color: titleColor != null ? titleColor : Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget panelLogoUniversity(
      {@required BuildContext context,
      String pathAsset = '${AssetUnit.imageBackgroundTop}'}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft:
              Radius.elliptical(MediaQuery.of(context).size.width / .5, 60),
          bottomRight:
              Radius.elliptical(MediaQuery.of(context).size.width / .5, 60),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft:
              Radius.elliptical(MediaQuery.of(context).size.width / .5, 60),
          bottomRight:
              Radius.elliptical(MediaQuery.of(context).size.width / .5, 60),
        ),
        child: Image.asset(
          '$pathAsset',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget buildTextButton({
    @required String text,
    Color textColor = Colors.black,
    Color buttonColor = Colors.cyanAccent,
    Color borderColor = Colors.white,
    @required Function onPressed,
    @required BuildContext context,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontFamily: ConfigUnit.italic, fontSize: 16),
          ),
        ),
      ),
      style: TextButton.styleFrom(
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
        backgroundColor: buttonColor,
        primary: textColor,
        padding: EdgeInsets.only(
          top: 13,
          bottom: 13,
        ),
      ),
    );
  }

  BoxDecoration myBoxDecoration(
      {double border = DoubleUtil.borderMyBoxDecoration3,
      double borderRadius = DoubleUtil.borderRadiusMyBoxDecoration5,
      Color backgroundColor}) {
    return BoxDecoration(
      color: backgroundColor != null
          ? backgroundColor
          : MyHexColor(ColorUtil.green),
      border: Border.all(
          color: backgroundColor != null
              ? backgroundColor
              : MyHexColor(ColorUtil.green),
          width: border),
      borderRadius: BorderRadius.all(Radius.circular(
              borderRadius) //                 <--- border radius here
          ),
    );
  }

  dialogWarning(
      {@required BuildContext context,
      @required bool isWarning,
      String title,
      String description,
      String buttonTitle,
      Function function}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)), //this right here
            child: DialogComponent().buildLayoutDialog(
                title: title,
                description: description,
                textButton: buttonTitle,
                function: function),
          );
        });
  }

  void dialogProcessing(
      {@required BuildContext context,
      Color backgroundColor,
      bool barrierDismissible = false}) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: barrierDismissible,
      barrierColor:
          Colors.black.withOpacity(DoubleUtil.opacityDialogProcessing),
      // transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Center(
            child: Container(
              height: DoubleUtil.heightDialogProcessing,
              width: DoubleUtil.widthDialogProcessing,
              child: SizedBox.expand(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                backgroundColor:
                    backgroundColor != null ? backgroundColor : Colors.green,
              )),
              margin: EdgeInsets.only(
                  bottom: DoubleUtil.widthDialogProcessing,
                  left: DoubleUtil.leftRightMarginDialogProcessing,
                  right: DoubleUtil.leftRightMarginDialogProcessing),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                    DoubleUtil.borderRadiusDialogProcessing),
              ),
            ),
          ),
        );
      },
      // transitionBuilder: (_, anim, __, child) {
      //   return SlideTransition(
      //     position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
      //     child: child,
      //   );
      // },
    );
  }

  floatingComponent({
    @required List<Widget> icons,
    List<String> textIcons,
    @required List<Function> functions,
    @required AnimationController controller,
    Color backgroundColor = Colors.white,
    @required Function onPressFloatButton,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: new List.generate(icons.length, (int index) {
        Widget child = new Container(
          height: DoubleUtil.heightContainerFloatingComponent,
          // width: DoubleUtil.widthContainerFloatingComponent,
          alignment: FractionalOffset.topCenter,
          child: new ScaleTransition(
            scale: new CurvedAnimation(
              parent: controller,
              curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
                  curve: Curves.easeOut),
            ),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: textIcons != null
                            ? Colors.black54
                            : Colors.transparent),
                    child: Text(
                      textIcons != null ? textIcons[index] : '',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                      heroTag: null,
                      backgroundColor: backgroundColor,
                      mini: true,
                      child: icons[index],
                      onPressed: functions[index]),
                ],
              ),
            ),
          ),
        );
        return child;
      }).toList()
        ..add(
          new FloatingActionButton(
            backgroundColor: Colors.white,
            heroTag: null,
            child: new AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return new Transform(
                  transform:
                      new Matrix4.rotationZ(controller.value * 0.5 * math.pi),
                  alignment: FractionalOffset.center,
                  child: new Icon(
                    controller.isDismissed ? Icons.add : Icons.close,
                    color: Colors.green,
                  ),
                );
              },
            ),
            // onPressed: () {
            //   if (controller.isDismissed) {
            //     controller.forward();
            //   } else {
            //     controller.reverse();
            //   }
            // },
            onPressed: onPressFloatButton,
          ),
        ),
    );
  }

  showBottomDialog(BuildContext context, Widget widget, {double height = .75}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext ctx) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: MediaQuery.of(ctx).size.height * height,
        child: Column(children: [
          Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: 2,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: widget),
        ]),
      ),
    );
  }

  Widget buildInputUtil({String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        textFormFieldUtil()
      ],
    );
  }

  Widget textFormFieldUtil() {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: 'Vui lòng nhập',
      ),
      onSaved: (String value) {
        // This optional block of code can be used to run
        // code when the user saves the form.
      },
      validator: (String value) {
        return (value != null && value.contains('@'))
            ? 'Do not use the @ char.'
            : null;
      },
    );
  }

  Widget listItemsUtil(
      {BuildContext context, ListItemsModelUtil items, Function onTap}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        // color: isVisibleFloatButton == true ? Colors.white :  Colors.black,
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 5,
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyHexColor(ColorUtil.colorLv5),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: SvgPicture.asset(
                            TrangThai.values[items.trangThai].icon),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              items.tenNguoiTao,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: ConfigUnit.bold,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  formatDay(items.ngayTao),
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: ConfigUnit.bold,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black45,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            items.tieuDe,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: ConfigUnit.bold,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: 3, bottom: 3, left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: MyHexColor(
                                      TrangThai.values[items.trangThai].color),
                                  borderRadius: BorderRadius.circular(50)),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                TrangThai.values[items.trangThai].name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: ConfigUnit.bold,
                                  fontWeight: FontWeight.w100,
                                  color: MyHexColor(TrangThai
                                      .values[items.trangThai].colorText),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String formatDay(String date) {
    if (date == null || date.length < 1) return '';
    final dateGet = DateTime.parse(date).toUtc();
    return '${dateGet.day < 10 ? '0${dateGet.day}' : dateGet.day}/${dateGet.month < 10 ? '0${dateGet.month}' : dateGet.month}/${dateGet.year}';
  }

  Widget buildContent(
      {String title, String value, String titleRight, String valueRight}) {
    return Card(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('$title'),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      '$value',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                ),
              ),
              valueRight != null
                  ? Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('$titleRight'),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            '$valueRight',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCalendar(
      {@required String hintText,
      @required String label,
      @required BuildContext context,
      @required Function onTap,
      @required Stream stream,
      @required DateTime initialDate}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Text(
            '$label',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          StreamBuilder<DateTime>(
              stream: stream,
              builder: (context, snapshot) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(snapshot.data != null
                        ? formatDay(snapshot.data.toString())
                        : '$hintText'),
                    Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    )
                  ],
                );
              })
        ],
      ),
    );
  }

  Widget buildTextFieldWithCalendar(
      {@required String hintText,
      @required String label,
      @required BuildContext context,
      @required Function onTap,
      @required Stream stream,
      @required DateTime initialDate}) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            child: FocusScope(
              node: FocusScopeNode(canRequestFocus: false),
              child: StreamBuilder<DateTime>(
                stream: stream,
                builder: (_, data) {
                  final TextEditingController _controller =
                      new TextEditingController(
                          text: data.data != null
                              ? '${data.data.day < 10 ? "0${data.data.day}" : data.data.day}-${data.data.month < 10 ? "0${data.data.month}" : data.data.month}-${data.data.year}'
                              : '');
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label != null ? label : '',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      TextFormField(
                        controller: _controller,
                        enableInteractiveSelection: false,
                        style: TextStyle(
                          fontSize: DoubleUtil.fontSizeLogin,
                          decoration: TextDecoration.none,
                        ),
                        autocorrect: false,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintText: hintText,
                          hintStyle: TextStyle(color: Colors.grey),
                          alignLabelWithHint: true,
                          suffixIcon: Icon(
                            Icons.date_range_outlined,
                          ),
                        ),
                        onTap: () {
                          onTap();
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
