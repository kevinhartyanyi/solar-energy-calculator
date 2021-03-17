// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../analyze/view/analyze_page.dart';
import '../calculator/view/calculator_page.dart';
import '../manage/manage_page.dart';
import '../models/calculation_item.dart';
import '../models/solar_data.dart';
import '../root/view/root_page.dart';
import '../settings/settings_page.dart';

class Routes {
  static const String rootPage = '/root-page';
  static const String calculatorPage = '/calculator-page';
  static const String analyzePage = '/analyze-page';
  static const String managePage = '/manage-page';
  static const String settingsPage = '/settings-page';
  static const all = <String>{
    rootPage,
    calculatorPage,
    analyzePage,
    managePage,
    settingsPage,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootPage, page: RootPage),
    RouteDef(Routes.calculatorPage, page: CalculatorPage),
    RouteDef(Routes.analyzePage, page: AnalyzePage),
    RouteDef(Routes.managePage, page: ManagePage),
    RouteDef(Routes.settingsPage, page: SettingsPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    RootPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const RootPage(),
        settings: data,
      );
    },
    CalculatorPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const CalculatorPage(),
        settings: data,
      );
    },
    AnalyzePage: (data) {
      final args = data.getArgs<AnalyzePageArguments>(
        orElse: () => AnalyzePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => AnalyzePage(
          key: args.key,
          solarData: args.solarData,
          loadData: args.loadData,
        ),
        settings: data,
      );
    },
    ManagePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ManagePage(),
        settings: data,
      );
    },
    SettingsPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SettingsPage(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension MyRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushRootPage() => push<dynamic>(Routes.rootPage);

  Future<dynamic> pushCalculatorPage() => push<dynamic>(Routes.calculatorPage);

  Future<dynamic> pushAnalyzePage({
    Key key,
    SolarData solarData,
    CalculationItem loadData,
  }) =>
      push<dynamic>(
        Routes.analyzePage,
        arguments: AnalyzePageArguments(
            key: key, solarData: solarData, loadData: loadData),
      );

  Future<dynamic> pushManagePage() => push<dynamic>(Routes.managePage);

  Future<dynamic> pushSettingsPage() => push<dynamic>(Routes.settingsPage);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AnalyzePage arguments holder class
class AnalyzePageArguments {
  final Key key;
  final SolarData solarData;
  final CalculationItem loadData;
  AnalyzePageArguments({this.key, this.solarData, this.loadData});
}
