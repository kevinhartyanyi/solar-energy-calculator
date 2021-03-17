import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/navigation/navigation_cubit.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key key, @required this.currentIndex})
      : super(key: key);

  final int currentIndex;

  void onChangeTab(BuildContext context, NavigationCubit navCubit, int index) {
    navCubit.changeTab(NavTab.values[index]);
  }

  @override
  Widget build(BuildContext context) {
    final navCubit = BlocProvider.of<NavigationCubit>(context);
    final theme = ThemeProvider.themeOf(context).data;
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(0.0, 2.0),
          end: const Offset(0.0, 0.0),
        ).chain(CurveTween(curve: Curves.easeOutCubic)).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      child: TitledBottomNavigationBar(
        key: const Key("BottomNavigationBar"),
        currentIndex: currentIndex,
        items: navCubit.getBottomNavigationItems(theme),
        onTap: (index) {
          onChangeTab(context, navCubit, index);
        },
        inactiveColor: theme.textTheme.bodyText1.color,
        reverse: true,
        enableShadow: false,
        activeColor: Colors.red,
      ),
    );
  }
}
