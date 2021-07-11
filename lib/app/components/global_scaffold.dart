import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:majorica/app/utilities/color_util.dart';

class GlobalScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final AppBar? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const GlobalScaffold({
    required this.body,
    this.floatingActionButton,
    this.appBar,
    this.backgroundColor,
    this.drawer,
    this.scaffoldKey,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: intl.Intl.getCurrentLocale() == 'en'
          ? TextDirection.ltr
          : TextDirection.rtl,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: backgroundColor ?? ColorUtil.whiteScaffold,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
      ),
    );
  }
}
