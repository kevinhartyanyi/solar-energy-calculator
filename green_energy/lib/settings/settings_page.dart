import 'package:flutter/material.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/settings/widgets/policy_dialog.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:package_info/package_info.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key key}) : super(key: key);

  void openPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PolicyDialog(
          mdFileName: 'privacy_policy.md',
        );
      },
    );
  }

  void openTermsAndConditions(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return PolicyDialog(
          mdFileName: 'terms_and_conditions.md',
        );
      },
    );
  }

  Future<void> onAboutClick(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();
    showAboutDialog(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      children: [
        AboutDialogItem(
          text: "Privacy policy",
          onTap: () {
            openPrivacyPolicy(context);
          },
        ),
        AboutDialogItem(
          text: "Terms & Conditions",
          onTap: () {
            openTermsAndConditions(context);
          },
        )
      ],
    );
  }

  void onChangeThemeClick(BuildContext context) {
    // final cubit = BlocProvider.of<ThemeCubit>(context);
    // if (cubit.state.isLightTheme) {
    //   cubit.changeToDarkTheme();
    // } else {
    //   cubit.changeToLightTheme();
    // }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                SettingsItem(
                  iconData: MdiIcons.themeLightDark,
                  text: "Switch theme",
                  onClick: () {
                    onChangeThemeClick(context);
                  },
                ),
                SettingsItem(
                  iconData: MdiIcons.informationOutline,
                  text: "About",
                  onClick: () {
                    onAboutClick(context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AboutDialogItem extends StatelessWidget {
  const AboutDialogItem({Key key, @required this.text, @required this.onTap})
      : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final h = size.height;
    final w = size.width;
    return SizedBox(
      height: h * 0.04,
      width: w * 0.8,
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: MyText(
          text,
          textColor: Colors.black,
          textSize: h * 0.02,
        ),
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {Key key,
      @required this.text,
      @required this.iconData,
      @required this.onClick})
      : super(key: key);

  final String text;
  final IconData iconData;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final theme = ThemeProvider.themeOf(context).data;
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Icon(
                iconData,
                color: theme.textTheme.bodyText1.color,
                size: h * 0.05,
              )),
              Expanded(
                flex: 5,
                child: MyText(
                  text,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const SettingsItemDivider(),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}

class SettingsItemDivider extends StatelessWidget {
  const SettingsItemDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    final h = MediaQuery.of(context).size.height;

    return Divider(
      color: theme.textTheme.bodyText1.color.withOpacity(0.3),
      height: h * 0.01,
    );
  }
}
