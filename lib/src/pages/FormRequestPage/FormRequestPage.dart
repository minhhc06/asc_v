import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/FormRequestBloc/FormRequestBloc.dart';

import 'package:vnu_app/src/pages/request_leave_page/components/RequestLeavePageComponent.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/CheckBoxFormRequestModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/FilesResponseModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/OptionLeaveModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/RequestApiUpdateModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/ThoiGianNghiPhepsModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonOfLeave.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/repository/components/dialog_component/DialogComponent.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class FormRequestPage extends StatefulWidget {
  final DetailPolicyPageModel detailPolicyPageModel;
  final FolderServerMedia folderServerMedia;
  FormRequestPage({this.detailPolicyPageModel, this.folderServerMedia});

  @override
  _FormRequestPageState createState() => _FormRequestPageState();
}

class _FormRequestPageState extends State<FormRequestPage> with BaseComponent {
  List<FilesResponseModel> listFiles = [];
  bool isRemove = false;
  RequestApiUpdateModel requestApiUpdateModel;
  TextEditingController titleController;
  TextEditingController noteController;
  FormRequestBloc bloc;

  String ngayNghiModel;
  int caNghiModel;
  List<OptionLeaveModel> listOption = [];
  bool isCheckCC = false;
  bool isCheckReasonList = false;
  String hint;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestApiUpdateModel = new RequestApiUpdateModel();
    titleController = new TextEditingController();
    noteController = new TextEditingController();

    bloc = new FormRequestBloc();

    Future.delayed(Duration.zero, () async {
      dialogProcessing(context: context);
    });

    bloc.fetchApiList(context: context, manHinh: 4);
    if(widget.folderServerMedia == FolderServerMedia.DON_XIN_NGHI_PHEP){
      bloc.fetchApiListReasonBloc(context: context);
    }

    listOption.add(OptionLeaveModel(id: 1, optionName: '${WordUtil.allDay}'));
    listOption.add(OptionLeaveModel(id: 2, optionName: '${WordUtil.morning}'));
    listOption.add(OptionLeaveModel(id: 3, optionName: '${WordUtil.afternoon}'));
    bloc.setListOptionLeave(listOption);

    if (widget.detailPolicyPageModel != null) {
      requestApiUpdateModel.id = widget.detailPolicyPageModel.id;
      requestApiUpdateModel.thoiGian = widget.detailPolicyPageModel.thoiGian;
      requestApiUpdateModel.ngayNhanBanGiao = widget.detailPolicyPageModel.ngayNhanBanGiao;
      requestApiUpdateModel.idNhanSuNhan = widget.detailPolicyPageModel.idNhanSuNhan;
      requestApiUpdateModel.idNhanSuNhanBanGiao = widget.detailPolicyPageModel.idNhanSuNhanBanGiao;
      requestApiUpdateModel.idsFileDinhKem = [];
      requestApiUpdateModel.lyDoNghiPheps = [];
      requestApiUpdateModel.idsNhanSuCC = [];

      if(widget.detailPolicyPageModel.listFiles.length > 0 && widget.detailPolicyPageModel.listFiles != null){
        widget.detailPolicyPageModel.listFiles.forEach((element) {
          requestApiUpdateModel.idsFileDinhKem.add(element.fileId);
        });
        bloc.setListFiles(widget.detailPolicyPageModel.listFiles);
      }

      if(widget.detailPolicyPageModel.nhanSuCCs.length > 0 && widget.detailPolicyPageModel.nhanSuCCs != null){
        widget.detailPolicyPageModel.nhanSuCCs.forEach((element) {
          requestApiUpdateModel.idsNhanSuCC.add(element.id);
        });

      }

      if(widget.detailPolicyPageModel.lyDoNghiPheps.length > 0 && widget.detailPolicyPageModel.lyDoNghiPheps != null){
        widget.detailPolicyPageModel.lyDoNghiPheps.forEach((element) {
          requestApiUpdateModel.lyDoNghiPheps.add(new ReasonOfLeave(idLyDoNghiPhep: element));
        });

      }

      if(widget.detailPolicyPageModel.thoiGianNghiPheps.length > 0 && widget.detailPolicyPageModel.thoiGianNghiPheps != null){
        widget.detailPolicyPageModel.thoiGianNghiPheps.forEach((element) {
          switch(element.caNghi){
            case 1:
              hint = '${WordUtil.allDay}';
              break;
            case 2:
              hint = '${WordUtil.morning}';
              break;
            case 3:
              hint = '${WordUtil.afternoon}';
              break;
          }

          bloc.setDateLeave(DateTime.parse(element.ngayNghi));

        });
      }


      titleController.text = widget.detailPolicyPageModel.tieuDe;

      if(widget.detailPolicyPageModel.thoiGian != '')
        bloc.setDate(DateTime.parse(widget.detailPolicyPageModel.thoiGian));
      if (widget.detailPolicyPageModel.ngayNhanBanGiao != null &&
          widget.detailPolicyPageModel.ngayNhanBanGiao != '') {
        bloc.setDateTwo(
            DateTime.parse(widget.detailPolicyPageModel.ngayNhanBanGiao));
      }
      noteController.text = widget.detailPolicyPageModel.noiDung;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(title: widget.folderServerMedia.name, context: context, iconDataBack: Icons.arrow_back_ios),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(DoubleUtil.padding16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder<List<UserModel>>(
                  stream: bloc.listReceiverStream,
                  builder: (ctx, listReceiver) {
                    if (listReceiver.data == null)
                      return Container();
                    else if (widget.detailPolicyPageModel != null) {
                      if(widget.detailPolicyPageModel.idNhanSuNhan != null){
                        for (UserModel user in listReceiver.data) {
                          if (user.nhanSuId == widget.detailPolicyPageModel.idNhanSuNhan) {
                            bloc.setReceiver(user);
                          }
                        }
                      }

                    }

                    ///sender
                    return RequestLeavePageComponent().buildDropDownList<UserModel>(
                      hintText: WordUtil.enterReveiver,
                      list: listReceiver.data,
                      stream: bloc.receiverStream,
                      function: (UserModel user) {
                        if(widget.detailPolicyPageModel != null){
                          requestApiUpdateModel?.idNhanSuNhan = user.nhanSuId;
                        }else{
                          print(requestApiUpdateModel.idNhanSuNhan.toString());
                          requestApiUpdateModel?.idsNhanSuNhan?.add(user.nhanSuId);

                        }
                        bloc.setReceiver(user);

                      },
                      context: context,
                      label: WordUtil.dear,
                    );
                  },
                ),

                ///cc
                widget.folderServerMedia == FolderServerMedia.DON_XIN_NGHI_PHEP ? StreamBuilder<List<UserModel>>(
                    stream: bloc.getListCC,
                    builder: (context, snapshot) {
                      if(snapshot.data == null){
                        return Container();
                      }
                      List<UserModel> listCc = [];
                      if (widget.detailPolicyPageModel != null) {
                        if(isCheckCC == false){
                          isCheckCC = true;

                          bloc.updateCcCheckBoxUpdate(listId: requestApiUpdateModel.idsNhanSuCC);
                        }else{
                          requestApiUpdateModel.idsNhanSuCC = [];
                          for(var object in snapshot.data ){
                            if(object.isCheck == true){
                              listCc.add(object);
                              requestApiUpdateModel.idsNhanSuCC.add(object.nhanSuId);

                            }
                          }
                        }
                      }else{
                        requestApiUpdateModel.idsNhanSuCC = [];
                        for(var object in snapshot.data ){
                          if(object.isCheck == true){
                            listCc.add(object);
                            requestApiUpdateModel.idsNhanSuCC.add(object.nhanSuId);
                          }
                        }

                      }



                      return RequestLeavePageComponent().buildListCcCheckboxComponent(listItems: listCc,
                          title:'${WordUtil.cc}', context: context,  onShowDialog: (){
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0)), //this right here
                                    child: RequestLeavePageComponent().buildListCcDialog(bloc: bloc),
                                  );
                                });
                          }, onRemove: (UserModel model){
                            bloc.updateCcCheckBoxRemove(userModel: model);
                          });
                    }
                ) : Container(),

                SizedBox(height: DoubleUtil.padding8,),
                ///title
                RequestLeavePageComponent().buildInputFromTextFromField(
                  label: WordUtil.title,
                  hintText: WordUtil.enterTitle,
                  controller: titleController,
                  context: context,
                ),

                SizedBox(height: DoubleUtil.padding8,),

                ///reason list
                widget.folderServerMedia == FolderServerMedia.DON_XIN_NGHI_PHEP ? StreamBuilder<List<ReasonModel>>(
                  stream: bloc.getListReason,
                  builder: (context, snapshot) {
                    if(snapshot.data == null){
                      return Container();
                    }
                    List<ReasonModel> listItems = [];

                    if (widget.detailPolicyPageModel != null) {
                      if(isCheckReasonList == false){
                        isCheckReasonList = true;
                        bloc.updateReasonCheckBoxUpdate(listId: requestApiUpdateModel.lyDoNghiPheps);


                      }else{
                        requestApiUpdateModel.lyDoNghiPheps = [];
                        for(ReasonModel object in snapshot.data ){
                          if(object.isCheck == true){
                            listItems.add(object);
                            ReasonOfLeave reason = new ReasonOfLeave(idLyDoNghiPhep: object.id);
                            requestApiUpdateModel.lyDoNghiPheps.add(reason);
                          }
                        }
                      }
                    }else{
                      requestApiUpdateModel.lyDoNghiPheps = [];
                      for(ReasonModel object in snapshot.data ){
                        if(object.isCheck == true){
                          listItems.add(object);
                          ReasonOfLeave reason = new ReasonOfLeave(idLyDoNghiPhep: object.id);
                          requestApiUpdateModel.lyDoNghiPheps.add(reason);
                        }
                      }

                    }

                    return RequestLeavePageComponent().buildListReasonCheckboxComponent(listItems: listItems,
                        title:'${WordUtil.reasonLeave}', context: context,  onShowDialog: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)), //this right here
                              child: RequestLeavePageComponent().buildListReasonDialog(bloc: bloc),
                            );
                          });
                    }, onRemove: (ReasonModel model){
                          bloc.updateReasonCheckBoxRemove(reasonModel: model);
                        });
                  }
                ) : Container(),

                widget.folderServerMedia == FolderServerMedia.DON_XIN_NGHI_PHEP ? SizedBox(height: DoubleUtil.padding8,) : Container(),

                /// choose day leave

                widget.folderServerMedia == FolderServerMedia.DON_XIN_NGHI_PHEP ? Card(
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
                                stream: bloc.getDateLeave,
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
                                         '${WordUtil.selectDate}',
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
                                          hintText: '${WordUtil.selectDate}',
                                          hintStyle: TextStyle(color: Colors.grey),
                                          alignLabelWithHint: true,
                                          suffixIcon: Icon(
                                            Icons.date_range_outlined,
                                          ),
                                        ),

                                        onTap: () async {
                                                final DateTime picked = await showDatePicker(
                                                  context: context,
                                                  initialDate:  DateTime.now(),
                                                  firstDate: DateTime(DateTime.now().year - 10),
                                                  lastDate: DateTime(DateTime.now().year + 10),
                                                  locale: Localizations.localeOf(context),
                                                );

                                                ngayNghiModel = picked.toIso8601String();

                                                bloc.setDateLeave(picked);
                                        },

                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),

                          ///dropdown option leave
                          Expanded(
                              flex: 2,
                              child: Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(''),
                                    RequestLeavePageComponent().buildDropDownListChooseDayLeave<OptionLeaveModel>(
                                      hintText: hint,
                                      list: listOption,
                                      stream: bloc.getOptionLeaveModel,
                                      function: (OptionLeaveModel model) {
                                              caNghiModel = model.id;
                                              bloc.setOptionLeaveModel(model);
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
                ) : Container(),


                widget.folderServerMedia == FolderServerMedia.DON_XIN_NGHI_PHEP ? SizedBox(height: DoubleUtil.padding8,) : Container(),

                ///reason
                RequestLeavePageComponent().buildInputFromTextFromField(
                  label: widget.folderServerMedia.titleName,
                  hintText: widget.folderServerMedia.hintTitleName,
                  controller: noteController,
                  context: context,
                  maxLines: 30,
                  minLines: 3,
                ),

                SizedBox(height: DoubleUtil.padding8,),

                /// calendar first option
                widget.folderServerMedia == FolderServerMedia.DON_XIN_CHAM_DUT ? Container(
                  child:  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        flex: 3,
                        child: buildTextFieldWithCalendar(
                          stream: bloc.dateStream,
                          label: widget.folderServerMedia.dateName,
                          hintText: widget.folderServerMedia.hintDateName,
                          context: context,
                          initialDate: widget.detailPolicyPageModel != null ? widget.detailPolicyPageModel.thoiGian != '' &&  widget.detailPolicyPageModel.thoiGian != null
                              ? DateTime.parse(widget.detailPolicyPageModel.thoiGian)
                              : null : null,
                          onTap: () async {
                            final DateTime picked = await showDatePicker(
                              context: context,
                              initialDate:  DateTime.now(),
                              firstDate: DateTime(DateTime.now().year - 10),
                              lastDate: DateTime(DateTime.now().year + 10),
                              locale: Localizations.localeOf(context),
                            );

                            requestApiUpdateModel?.thoiGian = picked.toIso8601String();
                            bloc.setDate(picked);
                          },
                        ),
                      ),
                    ],
                  ),
                ) : Container(),
                SizedBox(height: DoubleUtil.padding8,),
                /// dropdown second option
                StreamBuilder<List<UserModel>>(
                  stream: bloc.listHandOverStream,
                  builder: (ctx, listReason) {
                    if (listReason.data == null)
                      return Container();
                    else if(widget.detailPolicyPageModel != null){
                      if (widget.detailPolicyPageModel.idNhanSuNhanBanGiao != null ||
                          widget.detailPolicyPageModel.idNhanSuNhanBanGiao != -1) {
                        for (UserModel user in listReason.data) {
                          if (user.nhanSuId == widget.detailPolicyPageModel.idNhanSuNhanBanGiao) {
                            bloc.setHandOver(user);
                          }
                        }
                      }

                    }

                    /// drop down option 2
                    return RequestLeavePageComponent().buildDropDownList<UserModel>(
                      hintText: WordUtil.handover,
                      list: listReason.data,
                      stream: bloc.handOverStream,
                      function: (UserModel handOver) {
                        requestApiUpdateModel.idNhanSuNhanBanGiao = handOver.nhanSuId;
                        bloc.setHandOver(handOver);
                      },
                      context: context,
                      label: widget.folderServerMedia.dateName,
                    );
                  },
                ),

                SizedBox(height: DoubleUtil.padding8,),

                ///calendar second option
                buildTextFieldWithCalendar(
                  stream: bloc.dateTwoStream,
                  label: WordUtil.receivedDate,
                  hintText: WordUtil.select,
                  initialDate: widget.detailPolicyPageModel != null ? widget.detailPolicyPageModel.ngayNhanBanGiao != '' &&  widget.detailPolicyPageModel.ngayNhanBanGiao != null
                      ? DateTime.parse(widget.detailPolicyPageModel.ngayNhanBanGiao)
                      : null : null,
                  onTap: () async {
                    final DateTime picked = await showDatePicker(
                      context: context,
                      initialDate:  DateTime.now(),
                      firstDate: DateTime(DateTime.now().year - 10),
                      lastDate: DateTime(DateTime.now().year + 10),
                      locale: Localizations.localeOf(context),
                    );

                    requestApiUpdateModel.ngayNhanBanGiao = picked.toIso8601String();
                    bloc.setDateTwo(picked);
                  } ,
                  context: context,
                ),

              ///list files
              Padding(
                padding: EdgeInsets.all(DoubleUtil.padding8),
                child: Column(
                  children: [
                    StreamBuilder<List<FilesResponseModel>>(
                        stream: bloc.getListFiles,
                        builder: (context, snapshot) {
                          if(snapshot.data != null){
                            if(isRemove == false){
                              isRemove = true;
                              listFiles.addAll(snapshot.data);
                            }
                            return RequestLeavePageComponent().buildListFiles(listFiles: listFiles, onRemove: (int index){
                              setState(() {
                                listFiles.removeAt(index);
                                isRemove = true;
                              });
                            });
                          }
                          return Container();
                        }
                    ),

                    SizedBox(height: DoubleUtil.padding8,),
                    RequestLeavePageComponent().buildButtonUpload(
                      icon: Icons.add,
                      fileName: '',
                      function: () async {
                        FilePickerResult result =
                        await FilePicker.platform.pickFiles();
                        if (result != null) {
                          isRemove = false;
                          dialogProcessing(context: context);
                          File file = File(result.files.single.path);
                          bloc.updateFileBloc(context: context, file: file, folderServerMedia: FolderServerMedia.DON_XIN_CHAM_DUT);
                        }
                      },
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: buildTextButton(
                          context: context,
                          text: WordUtil.close,
                          textColor: Colors.black,
                          buttonColor: Colors.white,
                          borderColor: Colors.black,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child:
                        buildTextButton(
                          context: context,
                          text: WordUtil.send,
                          textColor: Colors.white,
                          buttonColor: MyHexColor(ColorUtil.green),
                          onPressed: () async {
                            dialogProcessing(context: context);
                            requestApiUpdateModel.tieuDe = titleController.text;
                            requestApiUpdateModel.noiDung = noteController.text;

                            ThoiGianNghiPhepsModel thoiGianNghiPhepsModel =
                            new ThoiGianNghiPhepsModel(ngayNghi: ngayNghiModel, caNghi: caNghiModel);

                            if(requestApiUpdateModel.thoiGianNghiPheps == null){
                              requestApiUpdateModel.thoiGianNghiPheps = [];
                            }

                            requestApiUpdateModel?.thoiGianNghiPheps.add(thoiGianNghiPhepsModel);

                            ///update
                            if(widget.detailPolicyPageModel != null){
                              if(listFiles.length > 0){
                                requestApiUpdateModel.idsFileDinhKem = [];
                              }
                              listFiles.forEach((element) {
                                requestApiUpdateModel.idsFileDinhKem.add(element.fileId);
                              });

                              bloc.updateFormApiBloc(context: context,
                                  typeFormName: TypeFormName.DON_XIN_CHAM_DUT,
                                  requestApiUpdateModel: requestApiUpdateModel);

                            }else{
                              if(listFiles.length > 0){
                                requestApiUpdateModel.idsFileDinhKem = [];
                              }
                              listFiles.forEach((element) {
                                requestApiUpdateModel.idsFileDinhKem?.add(element.fileId);
                              });
                              ///request api
                              print(requestApiUpdateModel);
                              bloc.createFormApiBloc(context: context, requestApiUpdateModel: requestApiUpdateModel,
                                  folderServerMedial: widget.folderServerMedia);

                            }

                          },
                        )
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
