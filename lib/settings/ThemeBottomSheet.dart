import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/Provider/list_provider.dart';

import '../MyTheme.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  late var provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<listProvider>(context);

    return Container(
      color: provider.appMode == ThemeMode.light
          ? Colors.white
          : MyTheme.dark_black_color,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
              onTap: () => provider.changeTheme(ThemeMode.light),
              child: provider.appMode == ThemeMode.light
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.light)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.light)),
          SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () => provider.changeTheme(ThemeMode.dark),
              child: provider.appMode == ThemeMode.dark
                  ? getSelectedItemWidget(AppLocalizations.of(context)!.dark)
                  : getUnselectedItemWidget(
                      AppLocalizations.of(context)!.dark)),
        ],
      ),
    );
  }

  getSelectedItemWidget(String s) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(s,
            style: TextStyle(
                color: MyTheme.blue_color,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        Icon(
          Icons.check,
          color: MyTheme.blue_color,
        )
      ],
    );
  }

  getUnselectedItemWidget(String s) {
    return Text(s,
        style: TextStyle(
            color: provider.appMode == ThemeMode.light
                ? MyTheme.black_color
                : MyTheme.white_color,
            fontWeight: FontWeight.normal,
            fontSize: 18));
  }
}
