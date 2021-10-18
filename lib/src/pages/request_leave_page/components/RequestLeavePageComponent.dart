import 'dart:io';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/FormRequestBloc/FormRequestBloc.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/MultiModelSelect.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/MyPainter2.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/FilesResponseModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/OptionLeaveModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';

import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class RequestLeavePageComponent extends BaseComponent {
  Widget buildButtonUpload({
    @required Function function,
    Color color = Colors.blue,
    double size = 70,
    double width = 70,
    IconData icon,
    String fileName = '',
  }) {
    return Column(
      children: [
        InkWell(
          onTap: function,
          child: Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CustomPaint(
                  painter: MyPainter2(
                    size: Size(60, 60),
                  ),
                  child: Center(
                    child: Icon(icon),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1),
          child: Text(
            fileName.split('/')[fileName.split('/').length - 1],
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        )
      ],
    );
  }

  Widget buildListFiles(
      {List<FilesResponseModel> listFiles, Function(int index) onRemove}) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listFiles.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 9,
                    child: Text(
                      '${listFiles[index].name}',
                      maxLines: 2,
                      style: TextStyle(color: Colors.blue),
                    )),
                Expanded(
                    flex: 1,
                    child: InkWell(
                        onTap: () {
                          onRemove(index);
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )))
              ],
            ),
            Container(
              color: Colors.grey,
              height: 1,
              width: double.infinity,
            )
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  Widget buildDropDownListChooseDayLeave<T>({
    List<T> list,
    Stream stream,
    String hintText,
    String label,
    BuildContext context,
    Function(T) function,
    IconData icon = Icons.keyboard_arrow_down,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Container(),
        StreamBuilder<T>(
            stream: stream,
            builder: (context, snapshot) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  hintText: hintText,
                ),
                isEmpty: snapshot.data == null,
                child: DropdownButton<T>(
                  isExpanded: true,
                  value: snapshot.data,
                  isDense: true,
                  icon: Icon(icon),
                  onChanged: (T newValue) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    function(newValue);
                  },
                  items: list.map((T value) {
                    return DropdownMenuItem<T>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              );
            }),
      ],
    );
  }

  Widget buildDropDownList<T>({
    List<T> list,
    Stream stream,
    String hintText,
    String label,
    BuildContext context,
    Function(T) function,
    IconData icon = Icons.keyboard_arrow_down,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null
            ? Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            : Container(),
        StreamBuilder<T>(
            stream: stream,
            builder: (context, snapshot) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: false,
                  border: InputBorder.none,
                  hintText: hintText,
                ),
                isEmpty: snapshot.data == null,
                child: DropdownButton<T>(
                  isExpanded: true,
                  value: snapshot.data,
                  isDense: true,
                  icon: Icon(icon),
                  onChanged: (T newValue) {
                    FocusScope.of(context).requestFocus(new FocusNode());
                    function(newValue);
                  },
                  items: list.map((T value) {
                    return DropdownMenuItem<T>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              );
            }),
      ],
    );
  }

  Widget handleDropDownList<T>({
    List<T> list,
    Stream stream,
    String hintText,
    String label,
    BuildContext context,
    Function function,
    IconData icon = Icons.keyboard_arrow_down,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              label ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: ConfigUnit.bold,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: StreamBuilder<T>(
                stream: stream,
                builder: (ctx, snapshot) => DropdownButtonHideUnderline(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      InputDecorator(
                        decoration: InputDecoration(
                          filled: false,
                          border: InputBorder.none,
                          hintText: hintText,
                        ),
                        isEmpty: snapshot.data == null,
                        child: DropdownButton<T>(
                          value: snapshot.data,
                          isDense: true,
                          icon: Icon(icon),
                          onChanged: (T newValue) {
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                            function(newValue);
                          },
                          items: list.map((T value) {
                            return DropdownMenuItem<T>(
                              value: value,
                              child: Text(value.toString()),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrodDown<T>({
    List<T> list,
    T value,
    String hintText,
    String label,
    BuildContext context,
    Function function,
    IconData icon = Icons.keyboard_arrow_down,
  }) {
    return Container(
      child: Column(
        children: [
          if (label != null)
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: ConfigUnit.bold,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DropdownButtonHideUnderline(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InputDecorator(
                      decoration: InputDecoration(
                        filled: false,
                        border: InputBorder.none,
                        hintText: hintText,
                      ),
                      isEmpty: value == null,
                      child: DropdownButton<T>(
                        value: value,
                        isDense: true,
                        icon: Icon(icon),
                        onChanged: (T newValue) => function(newValue),
                        items: list.map((T valueItem) {
                          return DropdownMenuItem<T>(
                            value: valueItem,
                            child: Text(valueItem.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrodDownV2<T>({
    List<T> values,
    String hintText,
    List<Widget> children,
    List<T> listData,
    String label,
    BuildContext context,
    Function function,
    Function onDeleteItem,
    IconData icon = Icons.keyboard_arrow_down,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              label ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: ConfigUnit.bold,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Visibility(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 14,
                        ),
                        child: Text(
                          hintText,
                          style: TextStyle(
                            fontSize: 17,
                            color: MyHexColor(
                              ColorUtil.colorLv6,
                            ),
                          ),
                        ),
                      ),
                      replacement: Wrap(
                        children: [
                          if (values != null)
                            ...values
                                .map(
                                  (item) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1),
                                    child: Chip(
                                      deleteIcon: Icon(Icons.close),
                                      onDeleted: () {
                                        values.remove(item);
                                        onDeleteItem(values);
                                      },
                                      label: Text(
                                        item.toString(),
                                      ),
                                    ),
                                  ),
                                )
                                .toList()
                        ],
                      ),
                      visible: values == null || values.length == 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (listData != null) {
                        showDialog(
                          context: context,
                          builder: (builder) => AlertDialog(
                            content: MultiModelSelect<T>(
                              children: children,
                              function: function,
                              listData: listData,
                              values: values,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text(WordUtil.close),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    child: Icon(icon),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDrodDownDate({
    @required String hintText,
    String label,
    @required BuildContext context,
    @required Function onTap,
    @required DateTime value,
    DateTime firstDate,
    DateTime lastDate,
    DateTime initialDate,
  }) {
    final TextEditingController _controller = new TextEditingController(
        text: value != null
            ? '${value.day < 10 ? "0${value.day}" : value.day}-${value.month < 10 ? "0${value.month}" : value.month}-${value.year}'
            : '');
    return Container(
      child: Column(
        children: [
          if (label != null)
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: ConfigUnit.bold,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: FocusScope(
                node: FocusScopeNode(canRequestFocus: false),
                child: TextFormField(
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
                  onTap: () async => onTap(
                    await showDatePicker(
                      context: context,
                      initialDate: initialDate ?? DateTime.now(),
                      firstDate: firstDate ?? DateTime(DateTime.now().year - 2),
                      lastDate: lastDate ?? DateTime(DateTime.now().year + 1),
                      locale: Localizations.localeOf(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildListDateLeave(
      {FormRequestBloc bloc,
      BuildContext context,
      FolderServerMedia folderServerMedia}) {
    List<OptionLeaveModel> listOption = [];
    listOption.add(OptionLeaveModel(id: 1, optionName: '${WordUtil.allDay}'));
    listOption.add(OptionLeaveModel(id: 2, optionName: '${WordUtil.morning}'));
    listOption
        .add(OptionLeaveModel(id: 3, optionName: '${WordUtil.afternoon}'));

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: buildTextFieldWithCalendar(
                    stream: bloc.dateStream,
                    label: folderServerMedia.dateName,
                    hintText: folderServerMedia.hintDateName,
                    context: context,
                    onTap: () async {
                      final DateTime picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(DateTime.now().year - 10),
                        lastDate: DateTime(DateTime.now().year + 10),
                        locale: Localizations.localeOf(context),
                      );

                      // requestApiUpdateModel?.thoiGian = picked.toIso8601String();
                      bloc.setDateLeave(picked);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildWithCalendarAndDropDown(
      {@required String hintText,
      @required String label,
      @required BuildContext context,
      @required Function onTapCalendar,
      @required Function(OptionLeaveModel) onTapDropdown,
      @required Stream stream,
      @required Stream streamDropdown,
      @required DateTime initialDate}) {
    List<OptionLeaveModel> listOption = [];
    listOption.add(OptionLeaveModel(id: 1, optionName: '${WordUtil.allDay}'));
    listOption.add(OptionLeaveModel(id: 2, optionName: '${WordUtil.morning}'));
    listOption
        .add(OptionLeaveModel(id: 3, optionName: '${WordUtil.afternoon}'));
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
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
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                              ),
                              hintText: hintText,
                              hintStyle: TextStyle(color: Colors.grey),
                              alignLabelWithHint: true,
                              suffixIcon: Icon(
                                Icons.date_range_outlined,
                              ),
                            ),
                            onTap: () {
                              onTapCalendar();
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(''),
                        RequestLeavePageComponent()
                            .buildDropDownListChooseDayLeave<OptionLeaveModel>(
                          hintText: WordUtil.chooseOption,
                          list: listOption,
                          stream: streamDropdown,
                          function: (OptionLeaveModel model) {
                            onTapDropdown(model);
                          },
                          context: context,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInputFromTextFromField({
    @required String label,
    @required String hintText,
    @required TextEditingController controller,
    String warningText,
    @required BuildContext context,
    int minLines = 1,
    int maxLines = 1,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: ConfigUnit.bold,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          Card(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                controller: controller,
                minLines: minLines,
                maxLines: maxLines,
                validator: (value) {
                  if (value.length == 0) return '$warningText';
                  return null;
                },
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildListReasonCheckboxComponent(
      {String title,
      BuildContext context,
      List<ReasonModel> listItems,
      Function onShowDialog,
      Function(ReasonModel) onRemove}) {
    var size = MediaQuery.of(context).size;
    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    double itemWidth = size.width / 0.3;

    return Card(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              '$title',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (listItems.length > 0)
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  onPressed: () {
                    onShowDialog();
                  })
          ],
        ),
        listItems.length > 0
            ? GridView.count(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                childAspectRatio: (itemWidth / itemHeight),
                scrollDirection: Axis.vertical,
                children: listItems.map((ReasonModel value) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: DoubleUtil.padding16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Center(
                              child: Text(
                                '${value.ten}',
                              ),
                            ),
                          ),
                          Expanded(
                              child: InkWell(
                                  onTap: () {
                                    onRemove(value);
                                  },
                                  child: Icon(Icons.clear)))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(WordUtil.selectLeaveReasion,
                      style: TextStyle(color: Colors.grey, fontSize: 17)),
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        onShowDialog();
                      })
                ],
              ),
      ],
    ));
  }

  buildListCcCheckboxComponent(
      {String title,
      BuildContext context,
      List<UserModel> listItems,
      Function onShowDialog,
      Function(UserModel) onRemove}) {
    // List<UserModel> listItems = [];
    // if(list == null){
    //   list = [];
    // }
    var size = MediaQuery.of(context).size;
    double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    double itemWidth = size.width / 0.3;

    // for(UserModel object in list){
    //   if(object.isCheck == true){
    //     listItems.add(object);
    //
    //   }
    // }

    return Card(
        child: Column(
      children: [
        Row(
          children: [
            Text(
              '$title ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (listItems.length > 0)
              IconButton(
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                  onPressed: () {
                    onShowDialog();
                  })
          ],
        ),
        listItems.length > 0
            ? GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 7 / 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 0.1),
                itemCount: listItems.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: DoubleUtil.padding16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Center(
                              child: Text(
                                '${listItems[index].hoDem + ' ' + listItems[index].ten}',
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  print(listItems[index].ten);
                                  onRemove(listItems[index]);
                                },
                                child: Icon(Icons.clear)),
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(WordUtil.selectLeaveReasion,
                      style: TextStyle(color: Colors.grey, fontSize: 17)),
                  IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        onShowDialog();
                      })
                ],
              ),
      ],
    ));
  }

  buildListCcDialog({FormRequestBloc bloc}) {
    return StreamBuilder<List<UserModel>>(
        stream: bloc.getListCC,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: MyHexColor(ColorUtil.green),
                        value: snapshot.data[index].isCheck,
                        onChanged: (bool value) {
                          bloc.updateCcCheckBox(isCheck: value, index: index);
                        },
                      ),
                      Text(
                          '${snapshot.data[index].hoDem + ' ' + snapshot.data[index].ten}'),
                    ],
                  ),
                );
              });
        });
  }

  buildListReasonDialog({FormRequestBloc bloc}) {
    return StreamBuilder<List<ReasonModel>>(
        stream: bloc.getListReason,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return Container();
          }
          return ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        activeColor: MyHexColor(ColorUtil.green),
                        value: snapshot.data[index].isCheck,
                        onChanged: (bool value) {
                          bloc.updateReasonCheckBox(
                              isCheck: value, index: index);
                        },
                      ),
                      Text(snapshot.data[index].ten),
                    ],
                  ),
                );
              });
        });
  }

  Widget buildInputFromTextFromFieldView({
    @required String label,
    @required String hintText,
    @required String value,
    String warningText,
    @required BuildContext context,
    int minLines = 1,
    int maxLines = 1,
  }) {
    final controller = new TextEditingController(text: value);
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: ConfigUnit.bold,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          FocusScope(
            canRequestFocus: false,
            node: FocusScopeNode(),
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextFormField(
                  controller: controller,
                  minLines: minLines,
                  maxLines: maxLines,
                  enableInteractiveSelection: false,
                  validator: (value) {
                    if (value.length == 0) return '$warningText';
                    return null;
                  },
                  style: TextStyle(
                    fontSize: 18,
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
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonShowFileChoose({
    List<File> files,
    File file,
    Function function,
  }) {
    return InkWell(
      onTap: function,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.black38,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(3),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(file.path.split('/')[file.path.split('/').length - 1]),
                Icon(Icons.close),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
