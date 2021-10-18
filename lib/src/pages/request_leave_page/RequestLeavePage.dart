import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBloc.dart';
import 'package:vnu_app/src/bloc/request_leave_bloc/RequestLeaveBlocV2.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/RequestLeaveComponent.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/ResignationComponent.dart';
import 'package:vnu_app/src/pages/request_leave_page/components/RequestRetirementComponent.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/repository/api/provider/request_leave_provider/RequestLeaveProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class RequestLeavePage extends StatefulWidget {
  final FolderServerMedia folderServerMedia;
  final DetailPolicyPageModel detailPolicyPageModel;
  const RequestLeavePage({
    Key key,
    this.detailPolicyPageModel,
    @required this.folderServerMedia,
  }) : super(key: key);

  @override
  _RequestLeavePageState createState() => _RequestLeavePageState();
}

class _RequestLeavePageState extends State<RequestLeavePage>
    with BaseComponent {
  TextEditingController titleController;
  TextEditingController noteController;
  RequestLeaveBlocV2 requestLeaveBlocV2;
  RequestLeaveBloc requestLeaveBloc;

  @override
  void initState() {
    super.initState();
    titleController = new TextEditingController();
    noteController = new TextEditingController();
    requestLeaveBlocV2 = new RequestLeaveBlocV2();
    requestLeaveBloc = new RequestLeaveBloc();
    buildData(context);
  }

  Future<void> buildData(BuildContext context) async {
    BaseComponent().showDialogProcessingUtil(
      context: context,
    );
    await RequestLeaveProvider().buildReceiverList(
      context: context,
      requestLeaveBloc: requestLeaveBlocV2,
      manHinh: 4,
    );
    await RequestLeaveProvider().buildHandOverList(
      context: context,
      requestLeaveBloc: requestLeaveBlocV2,
    );
    await RequestLeaveProvider().buildReasonList(
        context: context, requestLeaveBloc: requestLeaveBlocV2);
    Navigator.pop(context);
  }

  Widget createBodyRequest() {
    switch (widget.folderServerMedia) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return ResignPage(
          detailPolicyPageModel: widget.detailPolicyPageModel,
          requestLeaveBloc: requestLeaveBloc,
          buildContext: context,
          folderServerMedia: widget.folderServerMedia,
        );
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return RequestLeaveComponent().handleInput(
          requestLeaveBloc: requestLeaveBlocV2,
          titleController: titleController,
          noteController: noteController,
          folderServerMedia: widget.folderServerMedia,
          context: context,
        );
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return RequestRetirementComponent().handleInput(
          requestLeaveBloc: requestLeaveBlocV2,
          titleController: titleController,
          noteController: noteController,
          folderServerMedia: widget.folderServerMedia,
          context: context,
        );
        break;
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        flexibleSpace: Image.asset(
          AssetUnit.assetsImageTopDark,
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        title: Align(
          alignment: Alignment.center,
          child: Text(widget.folderServerMedia.name),
        ),
        leading: SizedBox(
          width: 24,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.white,
              size: 24,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: createBodyRequest(),
      ),
    );
  }
}
