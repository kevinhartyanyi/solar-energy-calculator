import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_energy/common/my_column.dart';
import 'package:green_energy/common/my_text.dart';
import 'package:green_energy/manage/cubit/manage_cubit.dart';
import 'package:green_energy/models/calculation_item.dart';
import 'package:theme_provider/theme_provider.dart';

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
          final h = MediaQuery.of(context).size.height;
          return ListView.separated(
              itemCount: state.length,
              itemBuilder: (context, index) {
                final item = state[index];
                return ManageItem(
                  name: item.name,
                  onDelete: () => item.delete(),
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
  const ManageItem({Key key, @required this.name, @required this.onDelete})
      : super(key: key);

  final String name;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 8.0,
        ),
        Expanded(child: MyText(name)),
        IconButton(
          icon: const Icon(Icons.delete_outlined),
          onPressed: () => onDelete(),
        )
      ],
    );
  }
}
