import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';

class WebViewPage extends StatefulWidget {
  final String path;

  WebViewPage({this.path});

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> with BaseComponent {
  @override
  Widget build(BuildContext context) {
    print('${widget.path}');
    return WebviewScaffold(
      url: 'http://devmedia.vnu.epmt.com.vn:2051/Media/VNU.HRM/DT_ThongBaoNghiHuu/202107/Documents/pdf-test-20210711010303-e.pdf',
      // url: 'http://www.orimi.com/pdf-test.pdf',
        appBar: appBarUtil(title: 'webview', context: context, iconDataBack: Icons.arrow_back_ios)
    );

  }
}
