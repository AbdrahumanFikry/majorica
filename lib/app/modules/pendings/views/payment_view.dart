import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:majorica/app/components/global_app_bar.dart';
import 'package:majorica/app/components/global_scaffold.dart';
import 'package:majorica/app/utilities/color_util.dart';
import 'package:majorica/generated/l10n.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Payment extends StatefulWidget {
  final String paymentToken;

  const Payment({
    required this.paymentToken,
  });

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  double progress = 0.0;
  bool enableBack = true;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return enableBack;
      },
      child: GlobalScaffold(
        appBar: GlobalAppBar(
          title: S.of(context).payment,
          enableBack: enableBack,
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Column(
              children: [
                if (progress != 0 || progress != 100)
                  LinearPercentIndicator(
                    width: Get.width,
                    animation: true,
                    animationDuration: 1000,
                    percent: progress / 100,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: ColorUtil.primaryColor,
                    padding: EdgeInsets.zero,
                  ),
                Expanded(
                  child: WebView(
                    initialUrl:
                        'https://backend.majoricahotel.com/payment/${widget.paymentToken}',
                    javascriptMode: JavascriptMode.unrestricted,
                    onWebViewCreated: (WebViewController webViewController) {
                      _controller.complete(webViewController);
                    },
                    onProgress: (int? value) {
                      print("WebView is loading (progress : $value%)");
                      setState(() {
                        if (value == null) progress = 0.0;
                        progress = double.tryParse(value.toString())!;
                      });
                    },
                    javascriptChannels: <JavascriptChannel>{
                      _toasterJavascriptChannel(context),
                    },
                    onPageStarted: (String url) {
                      print('Page started loading: $url');

                      if (url.contains('atfawry')) {
                        setState(() {
                          enableBack = false;
                        });
                      }
                    },
                    onPageFinished: (String url) {
                      print('Page finished loading: $url');
                    },
                    gestureNavigationEnabled: true,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Payment',
      onMessageReceived: (JavascriptMessage message) {
        print('::::::::::::::::::::::::: ${message.message}');
        Get.back(result: message.message);
      },
    );
  }
}
