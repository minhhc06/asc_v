import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBlocV2.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/RequestLeavePageComponent.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/InfoUserRetirement.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/MediaModelResponse.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserDetailModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/repository/api/provider/request_leave_provider/RequestLeaveProvider.dart';
import 'package:vnu_app/src/repository/api/provider/user_provider/UserProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class RequestRetirementComponent extends BaseComponent {
  Widget handleInput({
    @required RequestLeaveBlocV2 requestLeaveBloc,
    @required TextEditingController titleController,
    @required TextEditingController noteController,
    @required FolderServerMedia folderServerMedia,
    BuildContext context,
  }) {
    return StreamBuilder<RequestRetirementModelState>(
      stream: requestLeaveBloc.requestRetirementModelStateStream,
      builder: (_, modelState) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<UserModel>>(
            stream: requestLeaveBloc.subjectListReceiver.stream,
            builder: (ctx, listReason) {
              if (listReason.data == null)
                return Container();
              else
                return RequestLeavePageComponent().buildDrodDown<UserModel>(
                  hintText: WordUtil.select,
                  list: listReason.data,
                  value: modelState.data?.handOver,
                  function: (handOber) async {
                    InfoUserRetirement infoUserRetirement =
                        await RequestLeaveProvider().getInfoUserRetirement(
                      context: context,
                      idNhanSu: handOber?.nhanSuId,
                    );
                    requestLeaveBloc.setRequestRetirementModelState(
                      RequestRetirementModelState.cloneAndUpdate(
                        modelClone: modelState.data,
                        modelUpdate: RequestRetirementModelState(
                          handOver: handOber,
                          infoUserRetirementHandOver: infoUserRetirement,
                        ),
                      ),
                    );
                  },
                  context: context,
                  label: folderServerMedia.receivedJod,
                );
            },
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.positionText,
            hintText: WordUtil.enterTitle,
            value:
                modelState.data?.infoUserRetirementHandOver?.tenChucVu ?? ' ',
            context: context,
          ),
          StreamBuilder<List<UserModel>>(
            stream: requestLeaveBloc.subjectListHandOver.stream,
            builder: (ctx, listReceiver) {
              if (listReceiver.data == null)
                return Container();
              else
                return RequestLeavePageComponent().buildDrodDown<UserModel>(
                  hintText: WordUtil.enterReveiver,
                  list: listReceiver.data,
                  value: modelState.data?.receiver,
                  function: (UserModel user) async {
                    UserDetailModel userDetailModel =
                        await UserProvider().buildGetUserById(
                      userId: user?.nhanSuId,
                      context: context,
                    );
                    InfoUserRetirement infoUserRetirement =
                        await RequestLeaveProvider().getInfoUserRetirement(
                      context: context,
                      idNhanSu: user?.nhanSuId,
                    );
                    requestLeaveBloc.setRequestRetirementModelState(
                      RequestRetirementModelState.cloneAndUpdate(
                        modelClone: modelState.data,
                        modelUpdate: RequestRetirementModelState(
                          receiver: user,
                          endDay:
                              DateTime.parse(infoUserRetirement.thoiGianNghiHuu)
                                  .toUtc(),
                          infoUserRetirementReceiver: infoUserRetirement,
                          userDetailModelReceiver: userDetailModel,
                          retirementChange:
                              '${infoUserRetirement?.tuoiNghiHuuTheoQuyDinh}${infoUserRetirement.ngayNghiHuuTheoQuyDinh} ngày',
                        ),
                      ),
                    );
                  },
                  context: context,
                  label: WordUtil.dear,
                );
            },
          ),
          RequestLeavePageComponent().buildInputFromTextFromField(
            label: WordUtil.title,
            hintText: WordUtil.enterTitle,
            controller: titleController,
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.birthDay,
            hintText: WordUtil.enterTitle,
            value: modelState.data?.infoUserRetirementReceiver?.ngaySinh != null
                ? '${DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().day < 10 ? "0${DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().day}" : DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().day}-${DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().month < 10 ? "0${DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().month}" : DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().month}-${DateTime.parse(modelState.data?.infoUserRetirementReceiver?.ngaySinh).toUtc().year}'
                : ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.gender,
            hintText: WordUtil.enterTitle,
            value:
                modelState.data?.infoUserRetirementReceiver?.tenGioiTinh ?? ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.positionText,
            hintText: '',
            value:
                modelState.data?.infoUserRetirementReceiver?.tenChucVu ?? ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.position,
            hintText: WordUtil.enterTitle,
            value: modelState.data?.userDetailModelReceiver?.tenNgachCongChuc ??
                ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.workUnit,
            hintText: WordUtil.enterTitle,
            value: modelState.data?.userDetailModelReceiver?.tenCoQuan ?? ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildDrodDownDate(
            label: folderServerMedia.dateName,
            value: modelState.data?.endDay,
            hintText: folderServerMedia.hintDateName,
            context: context,
            initialDate:
                modelState.data?.infoUserRetirementReceiver?.thoiGianNghiHuu !=
                        null
                    ? DateTime.parse(modelState
                            .data?.infoUserRetirementReceiver?.thoiGianNghiHuu)
                        .toUtc()
                    : DateTime.now(),
            firstDate:
                modelState.data?.infoUserRetirementReceiver?.thoiGianNghiHuu !=
                        null
                    ? DateTime(DateTime.parse(modelState
                            .data?.infoUserRetirementReceiver?.thoiGianNghiHuu)
                        .toUtc()
                        .year)
                    : DateTime(DateTime.now().year - 2),
            lastDate:
                modelState.data?.infoUserRetirementReceiver?.thoiGianNghiHuu !=
                        null
                    ? DateTime(DateTime.parse(modelState.data
                                ?.infoUserRetirementReceiver?.thoiGianNghiHuu)
                            .toUtc()
                            .year +
                        1)
                    : DateTime(DateTime.now().year + 1),
            onTap: (DateTime date) {
              if (date == null) return;
              DateTime dateEnd = DateTime.parse(modelState
                      .data?.infoUserRetirementReceiver?.thoiGianNghiHuu)
                  .toUtc();
              int yearRetirement = date.year - dateEnd.year;
              int monthRetirement = date.month - dateEnd.month;
              if (monthRetirement < 0) {
                monthRetirement += 12;
                yearRetirement -= 1;
              }
              if (yearRetirement < 0 || monthRetirement < 0) {
                BaseComponent().dialogWarning(
                    context: context,
                    isWarning: true,
                    buttonTitle: WordUtil.close,
                    description: WordUtil.datetimeErr,
                    function: () => Navigator.pop(context),
                    title: WordUtil.wanning);
                return;
              }
              int year = (modelState.data?.infoUserRetirementReceiver
                          ?.namNghiHuuTheoQuyDinh ??
                      0) +
                  yearRetirement;
              int month = (modelState.data?.infoUserRetirementReceiver
                          ?.thangNghiHuuTheoQuyDinh ??
                      0) +
                  monthRetirement;
              if (month > 12) {
                year += 1;
                month -= 12;
              }
              requestLeaveBloc.setRequestRetirementModelState(
                RequestRetirementModelState.cloneAndUpdate(
                  modelClone: modelState.data,
                  modelUpdate: RequestRetirementModelState(
                      endDay: date,
                      retirementChange: '$year tuổi $month tháng 1 ngày'),
                ),
              );
            },
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.nghiHuuTB,
            hintText: WordUtil.enterTitle,
            value: modelState.data?.retirementChange ?? ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromFieldView(
            label: WordUtil.nghiHuuQD,
            hintText: WordUtil.enterTitle,
            value: modelState
                    .data?.infoUserRetirementReceiver?.tuoiNghiHuuTheoQuyDinh ??
                ' ',
            context: context,
          ),
          RequestLeavePageComponent().buildInputFromTextFromField(
            label: folderServerMedia.titleName,
            hintText: folderServerMedia.hintTitleName,
            controller: noteController,
            context: context,
            maxLines: 30,
            minLines: 3,
          ),
          if (modelState.data?.files != null)
            ...modelState.data.files.map(
              (file) => RequestLeavePageComponent().buildButtonShowFileChoose(
                files: modelState.data.files,
                file: file,
                function: () {
                  final List<File> listFileCopy = modelState.data.files;
                  listFileCopy.remove(file);
                  requestLeaveBloc.setRequestRetirementModelState(
                    RequestRetirementModelState.cloneAndUpdate(
                      modelClone: modelState.data,
                      modelUpdate: RequestRetirementModelState(
                        files: listFileCopy,
                      ),
                    ),
                  );
                },
              ),
            ),
          Padding(
            padding: EdgeInsets.all(5),
            child: RequestLeavePageComponent().buildButtonUpload(
              icon: Icons.add,
              fileName: '',
              function: () async {
                FilePickerResult result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  final List<File> listFile = modelState.data.files ?? [];
                  listFile.add(File(result.files.single.path));
                  requestLeaveBloc.setRequestRetirementModelState(
                    RequestRetirementModelState.cloneAndUpdate(
                      modelClone: modelState.data,
                      modelUpdate: RequestRetirementModelState(
                        files: listFile,
                      ),
                    ),
                  );
                }
              },
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
                    child: buildTextButton(
                      context: context,
                      text: WordUtil.send,
                      textColor: Colors.white,
                      buttonColor: MyHexColor(ColorUtil.green),
                      onPressed: () async {
                        List<MediaModelResponse> listFiles =
                            await RequestLeaveProvider().buildUploadMedias(
                          context: context,
                          files: modelState.data?.files,
                          folderServerMedia: folderServerMedia,
                        );
                        bool isSuccess = await RequestLeaveProvider()
                            .buildCreateRequestRetirement(
                          context: context,
                          listFiles: listFiles,
                          noteController: noteController,
                          modelState: modelState.data,
                          titleController: titleController,
                        );
                        if (isSuccess) {
                          dialogWarning(
                            context: context,
                            isWarning: false,
                            title: WordUtil.notification,
                            description:
                                '${folderServerMedia.name} ${WordUtil.success}!',
                            buttonTitle: WordUtil.confirm,
                            function: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                          );
                        } else
                          dialogWarning(
                            context: context,
                            isWarning: false,
                            title: WordUtil.notification,
                            description:
                                '${folderServerMedia.name} ${WordUtil.fail}',
                            buttonTitle: WordUtil.confirm,
                            function: () => Navigator.pop(context),
                          );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
