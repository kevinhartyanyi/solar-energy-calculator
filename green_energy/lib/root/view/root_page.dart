import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/navigation/navigation_cubit.dart';
import 'package:green_energy/router/my_router.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class RootPage extends StatelessWidget {
  const RootPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RootPageBody();
  }
}

class RootPageBody extends StatelessWidget {
  const RootPageBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navCubit = BlocProvider.of<NavigationCubit>(context);
    return BlocBuilder<NavigationCubit, NavTab>(
      cubit: navCubit,
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: IndexedStack(
            index: state.index,
            children: List.generate(NavigationCubit.tabs.length, (index) {
              final tab = NavigationCubit.tabs[NavTab.values[index]];
              return TickerMode(
                enabled: index == state.index,
                child: Offstage(
                  offstage: index != state.index,
                  child: ExtendedNavigator(
                    initialRoute: tab.initialRoute,
                    name: tab.name,
                    router: MyRouter(),
                  ),
                ),
              );
            }),
          ),
          bottomNavigationBar: MyBottomNavigationBar(
            currentIndex: state.index,
          ), //MyBottomNavigationBar(),
        );
      },
    );
  }
}

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
        items: navCubit.getBottomNavigationItems(),
        onTap: (index) {
          onChangeTab(context, navCubit, index);
        },
        inactiveColor: Colors.black,
        reverse: true,
        enableShadow: false,
        activeColor: Colors.red,
      ),
    );
  }
}
