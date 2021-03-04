import 'package:flutter/material.dart';

class MyColumn extends StatelessWidget {
  const MyColumn({Key key, @required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Column(
        children: children,
      ),
    );
  }
}
