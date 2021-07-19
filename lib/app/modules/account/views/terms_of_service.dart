import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/utilities/app_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TOS extends StatefulWidget {
  final String tOSLink;

  const TOS({
    required this.tOSLink,
  });

  @override
  _TOSState createState() => _TOSState();
}

class _TOSState extends State<TOS> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      appBar: GlobalAppBar(
        title: S.of(context).termsOfService,
        enableBack: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return WebView(
            initialUrl: widget.tOSLink,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onProgress: (int progress) {
              print("WebView is loading (progress : $progress%)");
            },
            onPageStarted: (String url) {
              print('Page started loading: $url');
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
            gestureNavigationEnabled: true,
          );
        },
      ),
    );
  }
}
