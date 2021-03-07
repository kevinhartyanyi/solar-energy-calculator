// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../analyze/view/analyze_page.dart';
import '../calculator/view/calculator_page.dart';
import '../home/view/home_page.dart';
import '../models/solar_data.dart';
import '../root/view/root_page.dart';

class Routes {
  static const String rootPage = '/root-page';
  static const String homePage = '/home-page';
  static const String calculatorPage = '/calculator-page';
  static const String analyzePage = '/analyze-page';
  static const all = <String>{
    rootPage,
    homePage,
    calculatorPage,
    analyzePage,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.rootPage, page: RootPage),
    RouteDef(Routes.homePage, page: HomePage),
    RouteDef(Routes.calculatorPage, page: CalculatorPage),
    RouteDef(Routes.analyzePage, page: AnalyzePage),
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
    HomePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const HomePage(),
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
      final args = data.getArgs<AnalyzePageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => AnalyzePage(
          key: args.key,
          solarData: args.solarData,
        ),
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

  Future<dynamic> pushHomePage() => push<dynamic>(Routes.homePage);

  Future<dynamic> pushCalculatorPage() => push<dynamic>(Routes.calculatorPage);

  Future<dynamic> pushAnalyzePage({
    Key key,
    @required SolarData solarData,
  }) =>
      push<dynamic>(
        Routes.analyzePage,
        arguments: AnalyzePageArguments(key: key, solarData: solarData),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AnalyzePage arguments holder class
class AnalyzePageArguments {
  final Key key;
  final SolarData solarData;
  AnalyzePageArguments({this.key, @required this.solarData});
}
