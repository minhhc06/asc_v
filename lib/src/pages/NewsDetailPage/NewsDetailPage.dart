import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/constants.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class NewsDetailPage extends StatefulWidget {
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> with BaseComponent {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(
          title: WordUtil.admissions,
          context: context,
          iconDataBack: Icons.arrow_back_ios,
          iconDataAction: Icons.share),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${WordUtil.newsContent}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: DoubleUtil.padding8,
              ),
              Text(
                '8:30 AM 18/06/2021',
                style: TextStyle(color: Colors.grey),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: DoubleUtil.padding8),
                child: Image.network('$linkNews'),
              ),
              Text(
                  '${WordUtil.newsContent} ${WordUtil.newsContent} ${WordUtil.newsContent}')
            ],
          ),
        ),
      ),
    );
  }
}
