import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/bloc/DetailPolicyPageBloc/DetailPolicyPageBloc.dart';
import 'package:vnu_app/src/pages/DetailPolicyPage/components/DetailPolicyPageComponents.dart';
import 'package:vnu_app/src/pages/ReviewFormPage/ReviewFormPage.dart';
import 'package:vnu_app/src/pages/request_leave_page/RequestLeavePage.dart';
import 'package:vnu_app/src/repository/api/model/DetailPolicyPageModel/DetailPolicyPageModel.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class DetailPolicyPage extends StatefulWidget {
  final int id;
  final int type;

  DetailPolicyPage(this.id, this.type);

  @override
  _DetailPolicyPageState createState() => _DetailPolicyPageState();
}

class _DetailPolicyPageState extends State<DetailPolicyPage>
    with BaseComponent, TickerProviderStateMixin {
  DetailPolicyPageBloc bloc;
  String url;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    print('id ${widget.id.toString()}');
    controller = new AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: 500,
        ));

    if (bloc == null) {
      bloc = new DetailPolicyPageBloc();

      showDialogProcessingUtil(context: context);
      bloc.fetchApiBloc(context: context, id: widget.id, type: widget.type);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DetailPolicyPageModel>(
        stream: bloc.getDetailPolicyPageModel,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return StreamBuilder<bool>(
                stream: bloc.getVisibleFloatButton,
                builder: (context, snapshotVisible) {
                  return Scaffold(
                    backgroundColor: MyHexColor(snapshotVisible.data == true
                        ? ColorUtil.grayColor
                        : ColorUtil.black),
                    appBar: appBarUtil(
                        title: '${snapshot.data.tenLoaiDon}',
                        context: context,
                        iconDataBack: Icons.arrow_back_ios),
                    body: AnimatedOpacity(
                      opacity: snapshotVisible.data == true ? 1.0 : 0.2,
                      duration: Duration(milliseconds: 500),
                      child: GestureDetector(
                        onTap: () {
                          bloc.setVisibleFloatButton(true);
                          controller.reverse();
                        },
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(DoubleUtil.padding16),
                            child: Column(
                              children: [
                                /// title request
                                DetailPolicyPageComponents()
                                    .buildTitle(snapshot.data),

                                /// kính gửi
                                DetailPolicyPageComponents().buildContent(
                                    title: WordUtil.dear,
                                    value: widget.type != 2
                                        ? '${snapshot.data?.hoDemNhanSuTao} ${snapshot.data?.tenNhanSuTao}'
                                        : '${snapshot.data?.hoDemNhanSuNhan} ${snapshot.data?.tenNhanSuNhan}'),

                                /// họ tên người duyệt
                                snapshot.data?.hoDemNhanSuDuyet != ''
                                    ? DetailPolicyPageComponents().buildContent(
                                        title: WordUtil.nguoiDuyet,
                                        value:
                                            '${snapshot.data?.hoDemNhanSuDuyet} ${snapshot.data?.tenNhanSuDuyet}',
                                        titleRight: WordUtil.positionText,
                                        valueRight:
                                            snapshot.data?.tenChucVuNhanSuDuyet)
                                    : Container(),

                                /// thông tin người tạo
                                if (snapshot.data?.hoDemNhanSuTao != null &&
                                    snapshot.data?.thoiGianNghiPheps == null)
                                  DetailPolicyPageComponents().buildContent(
                                    title: WordUtil.creator,
                                    value:
                                        '${snapshot.data?.hoDemNhanSuTao} ${snapshot.data?.tenNhanSuTao}',
                                  ),

                                /// thông tin người nghỉ hưu
                                if (snapshot.data?.hoDemNhanSuNghiHuu != null &&
                                    snapshot.data.hoDemNhanSuNghiHuu.length > 0)
                                  DetailPolicyPageComponents().buildContentList(
                                    left: {
                                      '${WordUtil.fullName}':
                                          '${snapshot.data?.hoDemNhanSuNghiHuu} ${snapshot.data?.tenNhanSuNghiHuu}',
                                      '${WordUtil.workUtil}':
                                          '${snapshot.data?.tenCoQuanNhanSuNghiHuu}',
                                      '${WordUtil.phone}':
                                          '${snapshot.data?.soDienThoaiNhanSuNghiHuu}',
                                    },
                                    right: {
                                      '${WordUtil.birthDay}': formatDay(
                                          snapshot.data?.ngaySinhNhanSuNghiHuu),
                                      '${WordUtil.positionNow}':
                                          '${snapshot.data?.tenChucVuNhanSuNghiHuu}',
                                      '${WordUtil.positionWorkUtil}':
                                          '${snapshot.data?.chucDanhNgheNghiepNhanSuNghiHuu}',
                                    },
                                  ),

                                /// thông tin người nghỉ phép
                                if (snapshot.data?.tenNhanSuTao != null &&
                                    snapshot.data?.thoiGianNghiPheps != null &&
                                    snapshot.data.thoiGianNghiPheps.length > 0)
                                  DetailPolicyPageComponents().buildContentList(
                                    left: {
                                      '${WordUtil.fullName}':
                                          '${snapshot.data?.hoDemNhanSuTao} ${snapshot.data?.tenNhanSuTao}',
                                      '${WordUtil.workUtil}':
                                          '${snapshot.data?.tenCoQuanNhanSuTao}',
                                      '${WordUtil.phone}':
                                          '${snapshot.data?.soDienThoaiNhanSuTao}',
                                    },
                                    right: {
                                      '${WordUtil.birthDay}': formatDay(
                                          snapshot.data?.ngaySinhNhanSuTao),
                                      '${WordUtil.positionNow}':
                                          '${snapshot.data?.tenChucVuNhanSuTao}',
                                      '${WordUtil.positionWorkUtil}':
                                          '${snapshot.data?.tenChucVuNhanSuTao}',
                                    },
                                  ),

                                /// thời gian nghỉ việc
                                snapshot.data?.thoiGian != ''
                                    ? DetailPolicyPageComponents().buildContent(
                                        title: '${WordUtil.duration}',
                                        value:
                                            formatDay(snapshot.data?.thoiGian))
                                    : Container(),

                                /// thông tin người tạo đơn
                                if (snapshot.data?.thoiGian != null &&
                                    snapshot.data.thoiGian.length > 0)
                                  DetailPolicyPageComponents().buildContentList(
                                    left: {
                                      '${WordUtil.fullName}':
                                          '${snapshot.data?.hoDemNhanSuTao} ${snapshot.data?.tenNhanSuTao}',
                                      '${WordUtil.workUtil}':
                                          '${snapshot.data?.tenCoQuanNhanSuTao}',
                                      '${WordUtil.based}':
                                          '${snapshot.data?.tenLoaiHopDong}',
                                      '${WordUtil.phone}':
                                          '${snapshot.data?.soDienThoaiNhanSuTao}',
                                      '${WordUtil.timeStart}':
                                          '${formatDay(snapshot.data?.hdTuNgay)}',
                                      ' ': ' ',
                                    },
                                    right: {
                                      '${WordUtil.birthDay}': formatDay(
                                          snapshot.data?.ngaySinhNhanSuTao),
                                      '${WordUtil.positionNow}':
                                          '${snapshot.data?.tenChucVuNhanSuTao}',
                                      '${WordUtil.positionWorkUtil}':
                                          '${snapshot.data?.tenChucVuNhanSuTao}',
                                      '${WordUtil.contractCode}':
                                          '${snapshot.data?.soHopDong}',
                                      '${WordUtil.timeEnd}':
                                          '${formatDay(snapshot.data?.hdDenNgay)}',
                                      '${WordUtil.signDay}':
                                          '${formatDay(snapshot.data?.ngayKy)}'
                                    },
                                  ),

                                /// chưa viết
                                snapshot.data?.hdTuNgay != '' &&
                                        snapshot.data?.hoDemNhanSuNghiHuu ==
                                            null
                                    ? DetailPolicyPageComponents().buildContent(
                                        title: '${WordUtil.timeStart}',
                                        value:
                                            '${formatDay(snapshot.data?.hdTuNgay)}',
                                        titleRight: '${WordUtil.timeEnd}',
                                        valueRight:
                                            formatDay(snapshot.data?.hdDenNgay))
                                    : Container(),

                                /// chưa biết
                                snapshot.data?.ngayKy != ''
                                    ? DetailPolicyPageComponents().buildContent(
                                        title: '${WordUtil.signDay}',
                                        value: '${snapshot.data?.ngayKy}')
                                    : Container(),

                                /// nội dung nghỉ hưu
                                if (snapshot.data?.noiDung != null &&
                                    snapshot.data?.hoDemNhanSuNghiHuu != null &&
                                    snapshot.data.hoDemNhanSuNghiHuu.length > 0)
                                  DetailPolicyPageComponents().buildContent(
                                      title: '${WordUtil.content}',
                                      value: '${WordUtil.contentLine1}' +
                                          '${WordUtil.contentLine2}' +
                                          '${WordUtil.contentLine3}' +
                                          '${WordUtil.contentLine4}' +
                                          '${WordUtil.contentLine5}' +
                                          '${WordUtil.contentLine6_1} ${formatDay(snapshot.data?.thoiGianNghiHuu)} ${WordUtil.contentLine6_2}' +
                                          '\t${WordUtil.contentLine7}\n' +
                                          '\t${WordUtil.contentLine8}'),

                                /// nơi nhận nghỉ hưu
                                if (snapshot.data?.noiNhan != null &&
                                    snapshot.data?.thoiGianNghiPheps == null)
                                  DetailPolicyPageComponents().buildContent(
                                      title: '${WordUtil.noiLuu}',
                                      value: '${snapshot.data?.noiNhan}'),

                                /// ý kiến người duyệt
                                snapshot.data?.lyDoDuyet != ''
                                    ? DetailPolicyPageComponents().buildContent(
                                        title: '${WordUtil.opinionReviewer}',
                                        value: '${snapshot.data?.lyDoDuyet}')
                                    : Container(),

                                /// thời gian nghỉ phép
                                snapshot.data?.thoiGianNghiPheps != null
                                    ? DetailPolicyPageComponents()
                                        .buildListView(
                                            list: snapshot
                                                .data?.thoiGianNghiPheps)
                                    : Container(),

                                /// nội dung nghỉ việc, nghỉ phép
                                snapshot.data?.hoDemNhanSuNhanBanGiao != ''
                                    ? DetailPolicyPageComponents()
                                        .buildContentLeave(
                                            model: snapshot.data,
                                            type: widget.type)
                                    : Container(),

                                /// list file đính kèm
                                snapshot.data?.fileDinhKems?.length != null &&
                                        snapshot.data.fileDinhKems.length > 0
                                    ? DetailPolicyPageComponents()
                                        .handleFileComponent(
                                            model: snapshot.data,
                                            context: context)
                                    : Container()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    floatingActionButton: snapshot.data.isDuyet == true
                        ? floatingComponent(
                            icons: [
                                Icon(
                                  Icons.edit,
                                  color: MyHexColor(ColorUtil.green),
                                ),
                                SvgPicture.asset(
                                    AssetUnit.assetsLeaveOfAbsenceForm),
                              ],
                            functions: [
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RequestLeavePage(
                                        detailPolicyPageModel: snapshot.data,
                                        folderServerMedia:
                                            FolderServerMedia.DON_XIN_CHAM_DUT,
                                      ),
                                    ),
                                  );
                                },
                                () async {
                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReviewFormPage(
                                              bloc: bloc,
                                            )),
                                  );

                                  if (result == true) {
                                    bloc.setVisibleFloatButton(true);
                                    controller.reverse();
                                  }
                                },
                              ],
                            textIcons: [
                                WordUtil.editForm,
                              ],
                            controller: controller,
                            onPressFloatButton: () {
                              if (controller.isDismissed) {
                                bloc.setVisibleFloatButton(false);
                                controller.forward();
                              } else {
                                bloc.setVisibleFloatButton(true);
                                controller.reverse();
                              }
                            })
                        : floatingComponent(
                            icons: [
                                Icon(
                                  Icons.edit,
                                  color: MyHexColor(ColorUtil.green),
                                ),
                              ],
                            functions: [
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RequestLeavePage(
                                        detailPolicyPageModel: snapshot.data,
                                        folderServerMedia:
                                            FolderServerMedia.DON_XIN_CHAM_DUT,
                                      ),
                                    ),
                                  );
                                },
                              ],
                            textIcons: [
                                WordUtil.editForm,
                                WordUtil.acceptOrReject,
                              ],
                            controller: controller,
                            onPressFloatButton: () {
                              if (controller.isDismissed) {
                                bloc.setVisibleFloatButton(false);
                                controller.forward();
                              } else {
                                bloc.setVisibleFloatButton(true);
                                controller.reverse();
                              }
                            }),
                  );
                });
          }
          return Scaffold(
              appBar: appBarUtil(
                  title: '${WordUtil.policy}',
                  context: context,
                  iconDataBack: Icons.arrow_back_ios),
              body: Container(
                color: Colors.white,
              ));
        });
  }
}
