import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solar_energy_calculator/common/my_alert_dialog.dart';
import 'package:solar_energy_calculator/common/my_text.dart';
import 'package:solar_energy_calculator/manage/cubit/manage_cubit.dart';
import 'package:solar_energy_calculator/models/calculation_item.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:solar_energy_calculator/router/my_router.dart';
import 'package:auto_route/auto_route.dart';

class ManagePage extends StatelessWidget {
  const ManagePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Material(
          color: Colors.transparent,
          child: BlocProvider(
            create: (context) => ManageCubit(),
            child: const Manage(),
          ),
        ),
      ),
    );
  }
}

class Manage extends StatelessWidget {
  const Manage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<ManageCubit, List<CalculationItem>>(
        builder: (context, state) {
          final theme = ThemeProvider.themeOf(context).data;
          return state.isEmpty
              ? const Center(
                  child: MyText("Nothing saved yet"),
                )
              : ListView.separated(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    final item = state[index];
                    return ManageItem(
                      item: item,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: theme.accentColor.withOpacity(0.3),
                      thickness: 3.0,
                    );
                    // return SizedBox(
                    //   height: h * 0.02,
                    // );
                  });
        },
      ),
    );
  }
}

class ManageItem extends StatelessWidget {
  const ManageItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final CalculationItem item;

  void onDeleteTap(BuildContext context) {
    final theme = ThemeProvider.themeOf(context).data;
    const String description = "Are you sure? you can't undo this?";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyAlertDialog(
          backgroundColor: theme.primaryColor,
          confirmText: "Confirm Delete",
          continueColor: theme.errorColor,
          description: description,
          onConfirm: () => item.delete(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.rootNavigator.pushAnalyzePage(loadData: item);
      },
      child: Row(
        children: [
          const SizedBox(
            width: 8.0,
          ),
          Expanded(child: MyText(item.name)),
          IconButton(
            icon: const Icon(Icons.delete_outlined),
            onPressed: () => onDeleteTap(context),
          )
        ],
      ),
    );
  }
}
