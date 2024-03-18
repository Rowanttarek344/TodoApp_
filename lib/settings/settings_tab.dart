import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../MyTheme.dart';
import '../Provider/list_provider.dart';
import 'LanguageBottomSheet.dart';
import 'ThemeBottomSheet.dart';

class settings_tab extends StatefulWidget {
  @override
  State<settings_tab> createState() => _settings_tabState();
}

class _settings_tabState extends State<settings_tab> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<listProvider>(context);

    return Container(
      margin: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
               color: provider.appMode == ThemeMode.light
                    ? MyTheme.white_color
                    : MyTheme.dark_black_color,
              border: Border.all(color: MyTheme.blue_color,width: 2)
            ),
            child: InkWell(
              onTap: () {
                 showLanguageBottomSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                       provider.appLanguage=='en'?
                       AppLocalizations.of(context)!.english:
                       AppLocalizations.of(context)!.arabic,
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: MyTheme.blue_color,

                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).primaryTextTheme.headline2,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: provider.appMode == ThemeMode.light
                    ? MyTheme.white_color
                    : MyTheme.dark_black_color,
                border: Border.all(color: MyTheme.blue_color,width: 2)
            ),
            child: InkWell(
              onTap: showThemeBottomSheet,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    provider.appMode == ThemeMode.light
                        ? AppLocalizations.of(context)!.light
                        : AppLocalizations.of(context)!.dark,
                    style: Theme.of(context).primaryTextTheme.headline3,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                    color: MyTheme.blue_color,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return LanguageBottomSheet();
      },
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ThemeBottomSheet();
      },
    );
  }
}
