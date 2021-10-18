import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBlocV2.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/MultiList.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/RequestLeavePageComponent.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/MediaModelResponse.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonModel.dart';
import 'package:vnu_app/src/repository/api/model/user_model/UserModel.dart';
import 'package:vnu_app/src/repository/api/provider/request_leave_provider/RequestLeaveProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class RequestLeaveComponent extends BaseComponent {
  Widget handleInput({
    @required RequestLeaveBlocV2 requestLeaveBloc,
    @required TextEditingController titleController,
    @required TextEditingController noteController,
    @required FolderServerMedia folderServerMedia,
    BuildContext context,
  }) {
    return StreamBuilder<RequestLeaveModelState>(
      stream: requestLeaveBloc.requestLeaveModelStateStream,
      builder: (_, requestLeaveModelState) => Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreamBuilder<List<UserModel>>(
            stream: requestLeaveBloc.subjectListReceiver.stream,
            builder: (ctx, listReceiver) {
              if (listReceiver.data == null)
                return Container();
              else
                return RequestLeavePageComponent().buildDrodDown<UserModel>(
                  hintText: WordUtil.enterReveiver,
                  list: listReceiver.data,
                  value: requestLeaveModelState.data?.receiver,
                  function: (UserModel user) {
                    requestLeaveBloc.setRequestLeaveModelState(
                      new RequestLeaveModelState.cloneAndUpdate(
                        requestLeaveModelState: requestLeaveModelState.data,
                        requestLeaveModelStateUpdate:
                            new RequestLeaveModelState(receiver: user),
                      ),
                    );
                  },
                  context: context,
                  label: WordUtil.dear,
                );
            },
          ),
          StreamBuilder<List<UserModel>>(
            stream: requestLeaveBloc.subjectListReceiver.stream,
            builder: (ctx, listReceiver) {
              if (listReceiver.data == null)
                return Container();
              else
                return RequestLeavePageComponent().buildDrodDownV2<UserModel>(
                  hintText: WordUtil.enterReveiver,
                  children: listReceiver.data
                      .map(
                        (item) => Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            title: Text('${item.hoDem} ${item.ten}'),
                            subtitle: Text(item.tenChucVu),
                          ),
                        ),
                      )
                      .toList(),
                  listData: listReceiver.data,
                  values: requestLeaveModelState.data?.listReceipientCarbonCopy,
                  onDeleteItem: (list) =>
                      requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate: new RequestLeaveModelState(
                          listReceipientCarbonCopy: list),
                    ),
                  ),
                  function: (List<dynamic> users) =>
                      requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate: new RequestLeaveModelState(
                          listReceipientCarbonCopy:
                              users.map((e) => e as UserModel).toList()),
                    ),
                  ),
                  context: context,
                  label: WordUtil.cc,
                );
            },
          ),
          RequestLeavePageComponent().buildInputFromTextFromField(
            label: WordUtil.title,
            hintText: WordUtil.enterTitle,
            controller: titleController,
            context: context,
          ),
          StreamBuilder<List<ReasonModel>>(
            stream: requestLeaveBloc.subjectListReason,
            builder: (ctx, listReason) {
              if (listReason.data == null)
                return Container();
              else
                return RequestLeavePageComponent().buildDrodDownV2<ReasonModel>(
                  hintText: WordUtil.select,
                  listData: listReason.data,
                  children: listReason.data
                      .map(
                        (item) => Container(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity:
                                VisualDensity(horizontal: -4, vertical: -4),
                            title: Text(item.ten),
                          ),
                        ),
                      )
                      .toList(),
                  values: requestLeaveModelState.data?.listReasonModel,
                  onDeleteItem: (list) =>
                      requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate:
                          new RequestLeaveModelState(listReasonModel: list),
                    ),
                  ),
                  function: (List<dynamic> reasons) =>
                      requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate: new RequestLeaveModelState(
                        listReasonModel:
                            reasons.map((e) => e as ReasonModel).toList(),
                      ),
                    ),
                  ),
                  context: context,
                  label: WordUtil.reason,
                );
            },
          ),
          MultiList(
            listReasonTime: requestLeaveModelState.data?.listReasonTime,
            title: folderServerMedia.dateName,
            hintDateName: folderServerMedia.hintDateName,
            requestLeaveBloc: requestLeaveBloc,
          ),
          StreamBuilder<List<UserModel>>(
            stream: requestLeaveBloc.subjectListHandOver.stream,
            builder: (ctx, listReason) {
              if (listReason.data == null)
                return Container();
              else
                return RequestLeavePageComponent().buildDrodDown<UserModel>(
                  hintText: WordUtil.select,
                  list: listReason.data,
                  value: requestLeaveModelState.data?.handOver,
                  function: (handOber) =>
                      requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate: new RequestLeaveModelState(
                        handOver: handOber,
                      ),
                    ),
                  ),
                  context: context,
                  label: folderServerMedia.receivedJod,
                );
            },
          ),
          RequestLeavePageComponent().buildInputFromTextFromField(
            label: folderServerMedia.titleName,
            hintText: folderServerMedia.hintTitleName,
            controller: noteController,
            context: context,
            maxLines: 30,
            minLines: 3,
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            child: Text(
              WordUtil.attach,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: ConfigUnit.bold,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          if (requestLeaveModelState.data?.files != null)
            ...requestLeaveModelState.data.files.map(
              (file) => RequestLeavePageComponent().buildButtonShowFileChoose(
                files: requestLeaveModelState.data.files,
                file: file,
                function: () {
                  final List<File> listFileCopy =
                      requestLeaveModelState.data.files;
                  listFileCopy.remove(file);
                  requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate: new RequestLeaveModelState(
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
                  final List<File> listFile = [];
                  if (requestLeaveModelState.data.files != null)
                    listFile.addAll(requestLeaveModelState.data.files);
                  listFile.add(File(result.files.single.path));
                  requestLeaveBloc.setRequestLeaveModelState(
                    RequestLeaveModelState.cloneAndUpdate(
                      requestLeaveModelState: requestLeaveModelState.data,
                      requestLeaveModelStateUpdate: new RequestLeaveModelState(
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
                          files: requestLeaveModelState.data?.files,
                          folderServerMedia: folderServerMedia,
                        );
                        await RequestLeaveProvider()
                            .buildCreateRequestLeave(
                          context: context,
                          listFiles: listFiles,
                          noteController: noteController,
                          requestLeaveState: requestLeaveModelState.data,
                          titleController: titleController,
                        )
                            .then((value) {
                          if (value) {
                            dialogWarning(
                              context: context,
                              isWarning: false,
                              title: WordUtil.notification,
                              description:
                                  '${folderServerMedia.name} ${WordUtil.success.toLowerCase()}!',
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
                        });
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
