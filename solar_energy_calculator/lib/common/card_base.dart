import 'package:flutter/material.dart';
import 'package:solar_energy_calculator/common/info.dart';
import 'package:solar_energy_calculator/common/my_dialog.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_provider/theme_provider.dart';

class CardBase extends StatelessWidget {
  const CardBase({
    Key key,
    @required this.child,
    this.padding,
    this.height,
    this.width,
    this.info,
    this.infoName,
    this.background,
  })  : assert(info == null || (info != null && infoName != null)),
        super(key: key);

  final Widget child;
  final EdgeInsets padding;
  final double height;
  final double width;
  final String info;
  final String infoName;
  final Color background;

  void showInfo(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return MyDialog(
              height: width * 0.9,
              width: width * 0.9,
              child: Info(
                name: infoName,
                info: info,
              ));
        });
  }

  Widget getChild(ThemeData theme, BuildContext context) {
    Widget getBase(ThemeData theme, {double baseWidth, double baseHeight}) {
      return Ink(
        height: baseHeight,
        width: baseWidth,
        padding: padding ?? const EdgeInsets.fromLTRB(10, 2, 10, 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: background ?? theme.primaryColor,
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
                icon: const Icon(MdiIcons.informationOutline),
                onPressed: () => showInfo(context))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return getChild(theme, context);
  }
}
