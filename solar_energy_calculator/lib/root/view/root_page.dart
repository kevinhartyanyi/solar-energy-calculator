import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/navigation/navigation_cubit.dart';
import 'package:solar_energy_calculator/root/widgets/my_bottom_navigation_bar.dart';
import 'package:solar_energy_calculator/router/my_router.dart';

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
