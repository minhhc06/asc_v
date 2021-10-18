import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBloc.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBlocV2.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveState.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/RequestLeavePageComponent.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/FilesResponseModel.dart';
import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/RequestApiUpdateModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/MediaModelResponse.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ResignationReaquestModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/repository/api/provider/request_leave_provider/RequestLeaveProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ResignPage extends StatefulWidget {
  final RequestLeaveBloc requestLeaveBloc;
  final FolderServerMedia folderServerMedia;
  final DetailPolicyPageModel detailPolicyPageModel;
  final BuildContext buildContext;

  ResignPage(
      {this.requestLeaveBloc,
      this.folderServerMedia,
      this.buildContext,
      this.detailPolicyPageModel});

  @override
  _ResignPageState createState() => _ResignPageState();
}

class _ResignPageState extends State<ResignPage> with BaseComponent {
  List<FilesResponseModel> listFiles = [];
  bool isRemove = false;
  RequestApiUpdateModel requestApiUpdateModel;
  TextEditingController titleController;
  TextEditingController noteController;
  // ResignationReaquestModel createModel;
  @override
  void initState() {
    super.initState();
    requestApiUpdateModel = new RequestApiUpdateModel();
    titleController = new TextEditingController();
    noteController = new TextEditingController();
    // createModel = new ResignationReaquestModel();
    Future.delayed(Duration.zero, () async {
      dialogProcessing(context: context);
    });

    widget.requestLeaveBloc.fetchApiList(context: context, manHinh: 4);

    if (widget.detailPolicyPageModel != null) {
      requestApiUpdateModel.id = widget.detailPolicyPageModel.id;
      requestApiUpdateModel.thoiGian = widget.detailPolicyPageModel.thoiGian;
      requestApiUpdateModel.ngayNhanBanGiao =
          widget.detailPolicyPageModel.ngayNhanBanGiao;
      requestApiUpdateModel.idNhanSuNhan =
          widget.detailPolicyPageModel.idNhanSuNhan;
      requestApiUpdateModel.idNhanSuNhanBanGiao =
          widget.detailPolicyPageModel.idNhanSuNhanBanGiao;
      requestApiUpdateModel.idsFileDinhKem = [];

      if (widget.detailPolicyPageModel.listFiles.length > 0 &&
          widget.detailPolicyPageModel.listFiles != null) {
        widget.detailPolicyPageModel.listFiles.forEach((element) {
          requestApiUpdateModel.idsFileDinhKem.add(element.fileId);
        });
        widget.requestLeaveBloc
            .setListFiles(widget.detailPolicyPageModel.listFiles);
      }

      titleController.text = widget.detailPolicyPageModel.tieuDe;

      if (widget.detailPolicyPageModel.thoiGian != '')
        widget.requestLeaveBloc
            .setDate(DateTime.parse(widget.detailPolicyPageModel.thoiGian));
      if (widget.detailPolicyPageModel.ngayNhanBanGiao != null &&
          widget.detailPolicyPageModel.ngayNhanBanGiao != '') {
        widget.requestLeaveBloc.setDateTwo(
            DateTime.parse(widget.detailPolicyPageModel.ngayNhanBanGiao));
      }
      noteController.text = widget.detailPolicyPageModel.noiDung;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DoubleUtil.padding16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<UserModel>>(
            stream: widget.requestLeaveBloc.listReceiverStream,
            builder: (ctx, listReceiver) {
              if (listReceiver.data == null)
                return Container();
              else if (widget.detailPolicyPageModel != null) {
                if (widget.detailPolicyPageModel.idNhanSuNhan != null) {
                  for (UserModel user in listReceiver.data) {
                    if (user.nhanSuId ==
                        widget.detailPolicyPageModel.idNhanSuNhan) {
                      widget.requestLeaveBloc.setReceiver(user);
                    }
                  }
                }
              }

              ///senter
              return RequestLeavePageComponent().handleDropDownList(
                hintText: WordUtil.enterReveiver,
                list: listReceiver.data,
                stream: widget.requestLeaveBloc.receiverStream,
                function: (UserModel user) {
                  if (widget.detailPolicyPageModel != null) {
                    requestApiUpdateModel?.idNhanSuNhan = user.nhanSuId;
                  } else {
                    print(requestApiUpdateModel.idNhanSuNhan.toString());
                    requestApiUpdateModel?.idsNhanSuNhan?.add(user.nhanSuId);
                  }
                  widget.requestLeaveBloc.setReceiver(user);
                },
                context: context,
                label: WordUtil.dear,
              );
            },
          ),

          ///title
          RequestLeavePageComponent().buildInputFromTextFromField(
            label: WordUtil.title,
            hintText: WordUtil.enterTitle,
            controller: titleController,
            context: context,
          ),

          ///reason
          RequestLeavePageComponent().buildInputFromTextFromField(
            label: widget.folderServerMedia.titleName,
            hintText: widget.folderServerMedia.hintTitleName,
            controller: noteController,
            context: context,
            maxLines: 30,
            minLines: 3,
          ),

          /// calendar first option
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: buildTextFieldWithCalendar(
                    stream: widget.requestLeaveBloc.dateStream,
                    label: widget.folderServerMedia.dateName,
                    hintText: widget.folderServerMedia.hintDateName,
                    context: context,
                    initialDate: widget.detailPolicyPageModel != null
                        ? widget.detailPolicyPageModel.thoiGian != '' &&
                                widget.detailPolicyPageModel.thoiGian != null
                            ? DateTime.parse(
                                widget.detailPolicyPageModel.thoiGian)
                            : null
                        : null,
                    onTap: (date) {
                      requestApiUpdateModel?.thoiGian = date.toIso8601String();
                      // createModel?.thoiGian = date.toIso8601String();
                      widget.requestLeaveBloc.setDate(date);
                    },
                  ),
                ),
              ],
            ),
          ),

          /// dropdown second option
          StreamBuilder<List<UserModel>>(
            stream: widget.requestLeaveBloc.listHandOverStream,
            builder: (ctx, listReason) {
              if (listReason.data == null)
                return Container();
              else if (widget.detailPolicyPageModel != null) {
                if (widget.detailPolicyPageModel.idNhanSuNhanBanGiao != null ||
                    widget.detailPolicyPageModel.idNhanSuNhanBanGiao != -1) {
                  for (UserModel user in listReason.data) {
                    if (user.nhanSuId ==
                        widget.detailPolicyPageModel.idNhanSuNhanBanGiao) {
                      widget.requestLeaveBloc.setHandOver(user);
                    }
                  }
                }
              }

              return RequestLeavePageComponent().handleDropDownList(
                hintText: WordUtil.handover,
                list: listReason.data,
                stream: widget.requestLeaveBloc.handOverStream,
                function: (UserModel handOver) {
                  if (widget.detailPolicyPageModel != null) {
                    requestApiUpdateModel.idNhanSuNhanBanGiao =
                        handOver.nhanSuId;
                  } else {
                    requestApiUpdateModel.idsNhanSuNhan = [];
                    requestApiUpdateModel.idsNhanSuNhan.add(handOver.nhanSuId);
                  }

                  widget.requestLeaveBloc.setHandOver(handOver);
                },
                context: context,
                label: widget.folderServerMedia.receivedJod,
              );
            },
          ),

          ///calendar second option
          buildTextFieldWithCalendar(
            stream: widget.requestLeaveBloc.dateTwoStream,
            label: WordUtil.receivedDate,
            hintText: WordUtil.select,
            initialDate: widget.detailPolicyPageModel != null
                ? widget.detailPolicyPageModel.ngayNhanBanGiao != '' &&
                        widget.detailPolicyPageModel.ngayNhanBanGiao != null
                    ? DateTime.parse(
                        widget.detailPolicyPageModel.ngayNhanBanGiao)
                    : null
                : null,
            onTap: (date) {
              requestApiUpdateModel.ngayNhanBanGiao = date.toIso8601String();
              // createModel.ngayNhanBanGiao = date.toIso8601String();
              widget.requestLeaveBloc.setDateTwo(date);
            },
            context: context,
          ),

          ///list files
          Padding(
            padding: EdgeInsets.all(DoubleUtil.padding8),
            child: Column(
              children: [
                StreamBuilder<List<FilesResponseModel>>(
                    stream: widget.requestLeaveBloc.getListFiles,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        if (isRemove == false) {
                          listFiles.addAll(snapshot.data);
                        }
                        return RequestLeavePageComponent().buildListFiles(
                            listFiles: listFiles,
                            onRemove: (int index) {
                              setState(() {
                                listFiles.removeAt(index);
                                isRemove = true;
                              });
                            });
                      }
                      return Container();
                    }),
                RequestLeavePageComponent().buildButtonUpload(
                  icon: Icons.add,
                  fileName: '',
                  function: () async {
                    FilePickerResult result =
                        await FilePicker.platform.pickFiles();
                    if (result != null) {
                      dialogProcessing(context: context);
                      File file = File(result.files.single.path);
                      widget.requestLeaveBloc.updateFileBloc(
                          context: context,
                          file: file,
                          folderServerMedia:
                              FolderServerMedia.DON_XIN_CHAM_DUT);
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
                    child: StreamBuilder<RequestLeaveState>(
                      stream: widget.requestLeaveBloc
                          .requestRequestResignationStateStream,
                      builder: (_, requestLeaveState) {
                        return buildTextButton(
                          context: context,
                          text: WordUtil.send,
                          textColor: Colors.white,
                          buttonColor: MyHexColor(ColorUtil.green),
                          onPressed: () async {
                            requestApiUpdateModel.tieuDe = titleController.text;
                            requestApiUpdateModel.noiDung = noteController.text;
                            if (widget.detailPolicyPageModel != null) {
                              showDialogProcessingUtil(context: context);
                              // requestApiUpdateModel.tieuDe = widget.titleController.text;
                              // requestApiUpdateModel.noiDung = widget.noteController.text;
                              if (listFiles.length > 0) {
                                requestApiUpdateModel.idsFileDinhKem = [];
                              }
                              listFiles.forEach((element) {
                                requestApiUpdateModel.idsFileDinhKem
                                    .add(element.fileId);
                              });

                              widget.requestLeaveBloc.updateFormApiBloc(
                                  context: context,
                                  typeFormName: TypeFormName.DON_XIN_CHAM_DUT,
                                  requestApiUpdateModel: requestApiUpdateModel);

                              widget.requestLeaveBloc.updateFormApiBloc(
                                  context: context,
                                  typeFormName: TypeFormName.DON_XIN_CHAM_DUT,
                                  requestApiUpdateModel: requestApiUpdateModel);
                            } else {
                              // List<MediaModelResponse> listFiles =
                              // await RequestLeaveProvider().buildUploadMedias(
                              //   context: context,
                              //   requestLeaveBloc: widget.requestLeaveBloc,
                              //   files: requestLeaveState.data?.files,
                              //   folderServerMedia: widget.folderServerMedia,
                              // );

                              // createModel.tieuDe = widget.titleController.text;
                              // createModel.noiDung = widget.noteController.text;
                              if (listFiles.length > 0) {
                                requestApiUpdateModel.idsFileDinhKem = [];
                              }
                              listFiles.forEach((element) {
                                requestApiUpdateModel.idsFileDinhKem
                                    ?.add(element.fileId);
                              });

                              // createModel = ResignationReaquestModel(
                              //   idNhanSuNhanBanGiao: modelState?.handOver?.nhanSuId,
                              //   idsFileDinhKem: listFiles?.map((e) => e.fileId)?.toList(),
                              //   idsNhanSuNhan: [modelState?.receiver?.nhanSuId ?? 0],
                              //   // ngayNhanBanGiao: _formatISOTime(date: modelState?.endDay),
                              //   ngayNhanBanGiao: _formatISOTime(date: modelState?.endDay),
                              //   noiDung: noteController.text,
                              //   thoiGian: _formatISOTime(date: modelState?.finishDay),
                              //   tieuDe: titleController.text,
                              //   id: 0,
                              //   idNhanSuNhan: null,
                              //   loaiDon: 1,
                              //   ngayDuyet: null,
                              //   trangThai: null,
                              // );

                              print(requestApiUpdateModel);
                              dialogProcessing(context: context);
                              widget.requestLeaveBloc.createFormApiBloc(
                                  context: context,
                                  requestApiUpdateModel: requestApiUpdateModel);

                              // bool isSuccess = await RequestLeaveProvider().buildCreateRequestResignation(
                              //   context: context,
                              //   noteController: widget.noteController,
                              //   titleController: widget.titleController,
                              // );
                              // if (isSuccess) {
                              //   dialogWarning(
                              //     context: context,
                              //     isWarning: false,
                              //     title: 'Thành công',
                              //     description:
                              //     '${widget.folderServerMedia.name} thành công!',
                              //     buttonTitle: 'Xác nhận',
                              //     function: () {
                              //       Navigator.pop(context);
                              //       Navigator.pop(context);
                              //     },
                              //   );
                              // } else
                              //   dialogWarning(
                              //     context: context,
                              //     isWarning: false,
                              //     title: 'Thông báo',
                              //     description:
                              //     '${widget.folderServerMedia.name} thất bại',
                              //     buttonTitle: 'Xác nhận',
                              //     function: () => Navigator.pop(context),
                              //   );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
