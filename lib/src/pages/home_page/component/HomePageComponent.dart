import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vnu_app/src/bloc/HomePageBloc/HomePageBloc.dart';
import 'package:vnu_app/src/pages/NewsDetailPage/NewsDetailPage.dart';
import 'package:vnu_app/src/pages/home_page/model/ListItemsNewsHomePageModel.dart';
import 'package:vnu_app/src/pages/notification_page/NotificationPage.dart';
import 'package:vnu_app/src/pages/policy_page/PolicyPage.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class HomePageComponent extends BaseComponent {
  Widget buildHomePage(BuildContext context, HomePageBloc bloc) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          ///information user
          HomePageComponent().informationUser(context: context, bloc: bloc),
          Positioned(
            top: 140,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                /// feature
                HomePageComponent().buildFeature(
                    context: context,
                    pathSvg: '$iconNotificationFeature',
                    backgroundIcon: MyHexColor(ColorUtil.green),
                    title: WordUtil.notification,
                    description:
                        'Cung cấp những thông tin cụ thể từ phía cơ quan',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationPage()),
                      );
                    }),

                HomePageComponent().buildFeature(
                    context: context,
                    pathSvg: '$iconPolicyFeature',
                    backgroundIcon: MyHexColor(ColorUtil.blueColor),
                    title: WordUtil.policy,
                    description: 'Tạo đơn xin nghỉ phép, nghỉ việc và nghỉ hưu',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PolicyPage()),
                      );
                    }),

                HomePageComponent().buildFeature(
                    context: context,
                    pathSvg: '$iconScienceFeature',
                    backgroundIcon: MyHexColor(ColorUtil.yellowColor),
                    title: 'Lý lịch khoa học',
                    description:
                        'Lưu giữ bộ những trình độ, quá trình đào tạo, hoạt động...'),
                SizedBox(
                  height: DoubleUtil.padding16,
                ),

                ///list news
                HomePageComponent()
                    .listNews(context: context, homePageBloc: bloc)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget informationUser({@required BuildContext context, HomePageBloc bloc}) {
    return Stack(
      children: [
        panelLogoUniversity(
            context: context, pathAsset: AssetUnit.backgroundTop),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(DoubleUtil.padding16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ///avatar
                    _buildAvatar(bloc: bloc),

                    ///information
                    Padding(
                      padding: const EdgeInsets.all(DoubleUtil.padding8),
                      child: _buildInformation(bloc: bloc),
                    )
                  ],
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    iconNotificationHomePage,
                    height: 30,
                    width: 30,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationPage()),
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget buildFeature(
      {@required BuildContext context,
      @required String pathSvg,
      @required Color backgroundIcon,
      Function onTap,
      @required String title,
      @required String description}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: DoubleUtil.padding16, vertical: DoubleUtil.padding8),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width,
          decoration: myBoxDecoration(backgroundColor: Colors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(DoubleUtil.padding8),
                  child: Container(
                    height: double.infinity,
                    decoration: myBoxDecoration(
                        backgroundColor:
                            MyHexColor(ColorUtil.grayColorFeatureHomePage)),
                    child: Padding(
                      padding: const EdgeInsets.all(DoubleUtil.padding8),
                      child: SvgPicture.asset(
                        '$pathSvg',
                        color: backgroundIcon,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$title',
                      style: TextStyle(
                          fontSize: DoubleUtil.fontSizeTextInformationUserHome,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text('$description'),
                    SizedBox(
                      height: 4,
                    ),
                    Container(
                      height: 30,
                      width: 60,
                      decoration: myBoxDecoration(
                          backgroundColor: backgroundIcon, borderRadius: 15),
                      child: Icon(Icons.arrow_forward,
                          color: Colors.white, size: 25),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget listNews(
      {List<String> entries,
      List<int> colorCodes,
      BuildContext context,
      HomePageBloc homePageBloc}) {
    final List<ListItemsNewsHomePageModel> listItems =
        <ListItemsNewsHomePageModel>[];
    listItems.add(new ListItemsNewsHomePageModel(
        imageLink:
            'https://photo-cms-giaoduc.zadn.vn/w700/Uploaded/2021/edxwpcqdh/2020_03_05/giao_duc.jpg',
        titleNews:
            'Kiến nghị của chuyên gia cho thấy quanh đi quẩn lại, sau mấy chục năm sáp nhập'));

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: DoubleUtil.padding16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Tin tức',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => NewsPage()),
                    // );
                    homePageBloc.setIndexNavigationBar(2);
                  },
                  child: Text(
                    'Xem tất cả',
                    style: TextStyle(color: MyHexColor(ColorUtil.green)),
                  ))
            ],
          ),
          SizedBox(
            height: DoubleUtil.padding16,
          ),
          Container(
            height: DoubleUtil.heightListNewsHomePage,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Padding(
                      padding:
                          const EdgeInsets.only(right: DoubleUtil.padding8),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsDetailPage()),
                          );
                        },
                        child: Container(
                          decoration: myBoxDecoration(
                              backgroundColor: Colors.white, borderRadius: 15),
                          width: 250,
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    decoration: new BoxDecoration(
                                      color: MyHexColor(ColorUtil.black),
                                      image: new DecorationImage(
                                        image: new NetworkImage(
                                          '${listItems[0].imageLink}',
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(DoubleUtil
                                              .borderRadiusListNewsHomePage)),
                                    ),
                                  )),
                              SizedBox(
                                height: DoubleUtil.padding16,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${listItems[0].titleNews}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar({@required HomePageBloc bloc}) {
    return Container(
      width: DoubleUtil.widthAvatarHomePage,
      height: DoubleUtil.heightAvatarHomePage,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(
            new Radius.circular(DoubleUtil.borderRadiusAvatarHomePage)),
        border: new Border.all(
          color: MyHexColor(ColorUtil.green),
          width: DoubleUtil.borderAvatarHomePage,
        ),
      ),
      child: StreamBuilder<String>(
          stream: bloc.getAvatar,
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              return new Container(
                width: DoubleUtil.heightImageHomePage,
                height: DoubleUtil.widthImageHomePage,
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  image: new DecorationImage(
                    image: new NetworkImage(
                        '${ConfigUnit.linkMedia}${snapshot.data}'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: new BorderRadius.all(new Radius.circular(
                      DoubleUtil.borderRadiusAvatarHomePage)),
                  border: new Border.all(
                    color: Colors.white,
                    width: DoubleUtil.borderAvatarHomePage,
                  ),
                ),
              );
            }
            return new Container(
              width: DoubleUtil.heightImageHomePage,
              height: DoubleUtil.widthImageHomePage,
              decoration: new BoxDecoration(
                color: Colors.grey,
                borderRadius: new BorderRadius.all(
                    new Radius.circular(DoubleUtil.borderRadiusAvatarHomePage)),
                border: new Border.all(
                  color: Colors.white,
                  width: DoubleUtil.borderAvatarHomePage,
                ),
              ),
            );
          }),
    );
  }

  Widget _buildInformation({@required HomePageBloc bloc}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<String>(
            stream: bloc.getFullName,
            builder: (context, snapshot) {
              return Text(
                snapshot.data != null ? snapshot.data : '',
                style: TextStyle(
                    fontSize: DoubleUtil.fontSizeTextInformationUserHome,
                    fontWeight: FontWeight.bold),
              );
            }),
        Text('Trưởng khoa'),
      ],
    );
  }

  Widget bottomNavigationBarUtil(
      {@required Function(int) onTapFunction, @required Stream stream}) {
    return StreamBuilder<int>(
        stream: stream,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    '$iconHome',
                    color: snapshot.data == 0
                        ? MyHexColor(ColorUtil.green)
                        : Colors.grey,
                  ),
                  label: '${WordUtil.home}',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      '$iconNotificationBottomNavigationBarItem',
                      color: snapshot.data == 1
                          ? MyHexColor(ColorUtil.green)
                          : Colors.grey),
                  label: '${WordUtil.notification}',
                ),




                BottomNavigationBarItem(
                  icon: SvgPicture.asset('$iconNews',
                      color: snapshot.data == 2
                          ? MyHexColor(ColorUtil.green)
                          : Colors.grey),
                  label: '${WordUtil.news}',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('$iconAccount',
                      color: snapshot.data == 3
                          ? MyHexColor(ColorUtil.green)
                          : Colors.grey),
                  label: '${WordUtil.account}',
                ),
              ],
              currentIndex: snapshot.data,
              selectedItemColor: MyHexColor(ColorUtil.green),
              onTap: onTapFunction,
            );
          }
          return Container();
        });
  }
}
