import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/bloc/policy_bloc/PolicyBloc.dart';
import 'package:vnu_app/src/pages/DetailPolicyPage/DetailPolicyPage.dart';
import 'package:vnu_app/src/pages/FormRequestPage/FormRequestPage.dart';
import 'package:vnu_app/src/pages/policy_page/components/ModalBottomPolicy.dart';
import 'package:vnu_app/src/pages/policy_page/components/MyGlobals.dart';
import 'package:vnu_app/src/pages/request_leave_page/RequestLeavePage.dart';
import 'package:vnu_app/src/repository/api/provider/policy_provider/PolicyProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/model/ListItemsModelUtil.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordErrorUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({Key key}) : super(key: key);

  @override
  _PolicyPageState createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage>
    with BaseComponent, TickerProviderStateMixin {
  PolicyBloc policyBloc;
  AnimationController animationController;
  ScrollController scrollController;
  List<ListItemsModelUtil> listItemsModelUtil = [];
  int page = 1;
  String url = ConfigUnit.receivedListPolicy;

  final listStatus = [
    TrangThai.Duyet,
    TrangThai.BanHanhQuyetDinh,
    TrangThai.BanHanhThongBao,
    TrangThai.TaoQuyetDinh,
    TrangThai.KhongDuyet,
  ];

  MyGlobals _scaffoldKey = MyGlobals();

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 500,
        ));

    scrollController = new ScrollController()..addListener(_scrollListener);
  }

  _scrollListener() {
    print(scrollController.position.extentAfter);
    if (scrollController.position.extentAfter <= 0) {
      page++;
      print('page $page');
      showDialogProcessingUtil(context: context);

      PolicyProvider().buildListPolicy(
          context: context, policyBloc: policyBloc, page: page, url: url);
    }
  }

  @override
  void dispose() {
    super.dispose();
    policyBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (policyBloc == null) {
      policyBloc = new PolicyBloc(
        title: '${WordUtil.policy}',
        listPolicy: [],
      );

      showDialogProcessingUtil(context: context);

      PolicyProvider().buildListPolicy(
          context: context, policyBloc: policyBloc, page: page, url: url);
    }

    return StreamBuilder<bool>(
        stream: policyBloc.getVisibleFloatButton,
        builder: (context, snapshotVisible) {
          if (snapshotVisible.data != null) {
            return Scaffold(
              key: _scaffoldKey.scaffoldKey,
              backgroundColor:
                  snapshotVisible.data == true ? Colors.white : Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                flexibleSpace: Image.asset(
                  AssetUnit.assetsImageTopDark,
                  fit: BoxFit.fill,
                  height: double.infinity,
                ),
                title: StreamBuilder<String>(
                  stream: policyBloc.titleStream,
                  builder: (ctx, title) => Align(
                    alignment: Alignment.center,
                    child: Text(
                      title.data ?? WordUtil.policy,
                    ),
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.tune_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () => showBottomDialog(
                      context,
                      ModalBottomPolicy(
                        listStatus: listStatus,
                        policyBloc: policyBloc,
                        scaffoldKey: _scaffoldKey.scaffoldKey.currentContext,
                        functionReceive: () {
                          url = ConfigUnit.receivedListPolicy;
                          listItemsModelUtil = [];
                          Navigator.pop(context);
                          showDialogProcessingUtil(context: context);
                          policyBloc.setTitle(WordUtil.receivedApplication);
                          PolicyProvider().buildListPolicy(
                              context: context,
                              policyBloc: policyBloc,
                              page: 1,
                              url: ConfigUnit.receivedListPolicy);
                        },
                        functionSent: () {
                          url = ConfigUnit.sentListPolicy;
                          listItemsModelUtil = [];
                          Navigator.pop(context);
                          showDialogProcessingUtil(context: context);
                          policyBloc.setTitle(WordUtil.receivedApplication);
                          PolicyProvider().buildListPolicy(
                              context: context,
                              policyBloc: policyBloc,
                              page: 1,
                              url: ConfigUnit.sentListPolicy);
                        },
                        functionApproved: () {
                          url = ConfigUnit.approvedListPolicy;
                          listItemsModelUtil = [];
                          Navigator.pop(context);
                          showDialogProcessingUtil(context: context);
                          policyBloc.setTitle(WordUtil.receivedApplication);
                          PolicyProvider().buildListPolicy(
                              context: context,
                              policyBloc: policyBloc,
                              page: 1,
                              url: ConfigUnit.approvedListPolicy);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              body: AnimatedOpacity(
                opacity: snapshotVisible.data == true ? 1.0 : 0.2,
                duration: Duration(milliseconds: 500),
                child: StreamBuilder<List<ListItemsModelUtil>>(
                    stream: policyBloc.listPolicyStream,
                    builder: (context, snapshot) {
                      if (snapshot.data != null) {
                        listItemsModelUtil.addAll(snapshot.data);
                        return RefreshIndicator(
                          onRefresh: handleRefresh,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: listItemsModelUtil.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return listItemsUtil(
                                      context: context,
                                      items: listItemsModelUtil[index],
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPolicyPage(
                                                      listItemsModelUtil[index]
                                                          .id,
                                                      listItemsModelUtil[index]
                                                          .loaiDon)),
                                        );
                                      });
                                }),
                          ),
                        );
                      }
                      return Container();
                    }),
              ),
              floatingActionButton: floatingComponent(
                  icons: [
                    SvgPicture.asset(AssetUnit.assestRetirementApplication),
                    SvgPicture.asset(AssetUnit.assetsResignationApplication),
                    SvgPicture.asset(AssetUnit.assetsLeaveOfAbsenceForm),
                  ],
                  functions: [
                    () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RequestLeavePage(
                              folderServerMedia:
                                  FolderServerMedia.THONG_BAO_NGHI_HUU,
                            ),
                          ),
                        ),
                    //

                    () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormRequestPage(
                            folderServerMedia:
                                FolderServerMedia.DON_XIN_CHAM_DUT,
                          ),
                        ),
                      );
                      if (result == true) {
                        policyBloc.setVisibleFloatButton(true);
                        animationController.reverse();
                        dialogWarning(
                          context: context,
                          isWarning: false,
                          title: '${WordError.warning}',
                          description: '${WordUtil.success}',
                          buttonTitle: WordUtil.confirm,
                          function: () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                    // () => Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => RequestLeavePage(
                    //           folderServerMedia:
                    //               FolderServerMedia.DON_XIN_NGHI_PHEP,
                    //         ),
                    //       ),
                    //     ),
                    () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FormRequestPage(
                            folderServerMedia:
                                FolderServerMedia.DON_XIN_NGHI_PHEP,
                          ),
                        ),
                      );
                      if (result == true) {
                        policyBloc.setVisibleFloatButton(true);
                        animationController.reverse();
                        dialogWarning(
                          context: context,
                          isWarning: false,
                          title: '${WordError.warning}',
                          description: '${WordUtil.success}',
                          buttonTitle: WordUtil.confirm,
                          function: () {
                            Navigator.pop(context);
                          },
                        );
                      }
                    },
                  ],
                  textIcons: [
                    WordUtil.retirementApplication,
                    WordUtil.resignationApplication,
                    WordUtil.leaveOfAbsenceForm,
                  ],
                  controller: animationController,
                  onPressFloatButton: () {
                    if (animationController.isDismissed) {
                      policyBloc.setVisibleFloatButton(false);
                      animationController.forward();
                    } else {
                      policyBloc.setVisibleFloatButton(true);
                      animationController.reverse();
                    }
                  }),
            );
          }
          return Container();
        });
  }

  Future<void> handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 50));
    page = 1;
    listItemsModelUtil = [];
    showDialogProcessingUtil(context: context);
    PolicyProvider().buildListPolicy(
        context: context, policyBloc: policyBloc, page: page, url: url);
  }
}
