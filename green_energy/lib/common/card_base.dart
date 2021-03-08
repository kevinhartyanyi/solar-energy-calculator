import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_provider/theme_provider.dart';

class CardBase extends StatelessWidget {
  const CardBase(
      {Key key,
      @required this.child,
      this.padding,
      this.height,
      this.width,
      this.info})
      : super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final double height;
  final double width;
  final String info;

  Widget getChild(ThemeData theme) {
    Widget getBase(ThemeData theme, {double baseWidth, double baseHeight}) {
      return Ink(
        height: baseHeight,
        width: baseWidth,
        padding: padding ?? const EdgeInsets.fromLTRB(10, 2, 10, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: theme.primaryColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              color: theme.shadowColor,
              blurRadius: 3,
            ),
          ],
        ),
        child: child,
      );
    }

    if (info == null) {
      return getBase(theme, baseHeight: height, baseWidth: width);
    } else {
      return SizedBox(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Positioned.fill(child: getBase(theme)),
            IconButton(
                icon: const Icon(MdiIcons.informationOutline), onPressed: () {})
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return getChild(theme);
  }
}
