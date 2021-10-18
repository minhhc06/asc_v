import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/NewsDetailPage/NewsDetailPage.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class NewsPageComponents {
  TabBar tabBarComponent({@required TabController tabController}) {
    return TabBar(
      labelColor: MyHexColor(ColorUtil.green),
      indicatorColor: MyHexColor(ColorUtil.green),
      unselectedLabelColor: Colors.black,
      controller: tabController,
      isScrollable: true,
      tabs: <Widget>[
        Tab(
          text: WordUtil.generalNews,
        ),
        Tab(text: WordUtil.admissions),
        Tab(
          text: WordUtil.training,
        ),
        Tab(
          text: WordUtil.coOperate,
        ),
      ],
    );
  }

  // bottomNavigationBarAppBar() {
  //   return BottomNavigationBar(
  //       backgroundColor: Colors.red,
  //       type: BottomNavigationBarType.fixed,
  //       items: [
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255)),
  //           title: new Text('Home'),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.work, color: Color.fromARGB(255, 255, 255, 255)),
  //           title: new Text('Self Help'),
  //         ),
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.face, color: Color.fromARGB(255, 255, 255, 255)),
  //           title: new Text('Profile'),
  //         ),
  //       ]);
  // }

  buildListNews() {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.all(DoubleUtil.padding16),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: DoubleUtil.padding16),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsDetailPage()),
                );
              },
              child: index == 0
                  ? _buildFirstIndex()
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Image.network(
                              '$linkNews',
                              fit: BoxFit.fill,
                            )),
                        SizedBox(
                          width: DoubleUtil.padding8,
                        ),
                        Expanded(
                            flex: 4,
                            child: Text(
                              "${WordUtil.newsContent}",
                              maxLines: 3,
                            ))
                      ],
                    ),
            ),
          );
        });
  }

  Widget _buildFirstIndex() {
    return Column(
      children: [
        Image.network(
          '$linkNews',
          fit: BoxFit.contain,
        ),
        SizedBox(
          height: DoubleUtil.padding8,
        ),
        Text(
          "${WordUtil.newsContent}",
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: DoubleUtil.padding8,
        ),
        Text(
          "${WordUtil.newsContent}",
          maxLines: 6,
        ),
      ],
    );
  }
}
