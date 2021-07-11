import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {
  final Function(BuildContext?) builder;

  const AppBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  @override
  AppBuilderState createState() => AppBuilderState();

  static AppBuilderState? of(BuildContext? context) {
    return context!.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  Key key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.builder(context),
    );
  }

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  void rebuild() {
    setState(() {});
  }
}
