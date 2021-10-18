import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vnu_app/src/pages/news_page/components/NewsPageComponents.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> with BaseComponent , TickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: Scaffold(
        appBar: appBarUtil(title: '${WordUtil.news}', context: context,
          bottom:  NewsPageComponents().tabBarComponent(tabController: _tabController),),
        body: SingleChildScrollView(
          child: NewsPageComponents().buildListNews(),
        ),
      ),
    );
  }
}
