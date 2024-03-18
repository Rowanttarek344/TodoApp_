import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo/Provider/list_provider.dart';


import '../MyTheme.dart';

class LanguageBottomSheet extends StatefulWidget {

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late var provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<listProvider>(context);

    return Container(
      color: provider.appMode==ThemeMode.light?
      MyTheme.primary_light_color:
      MyTheme.dark_black_color,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap:() => provider.changeLanguage('en'),
            child: provider.appLanguage=='en'?
            getSelectedItemWidget(AppLocalizations.of(context)!.english):
            getUnselectedItemWidget(AppLocalizations.of(context)!.english)
          ),
          SizedBox(height: 10,),
          InkWell(
              onTap:() => provider.changeLanguage('ar'),
              child: provider.appLanguage=='ar'?
              getSelectedItemWidget(AppLocalizations.of(context)!.arabic):
              getUnselectedItemWidget(AppLocalizations.of(context)!.arabic)
          ),

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
              fontSize: 20
          )),
        Icon(Icons.check,color: MyTheme.blue_color,)
      ],
    );

  }

  getUnselectedItemWidget(String s) {
    return Text(
        s,
        style: TextStyle(
          color: provider.appMode==ThemeMode.light?MyTheme.black_color:MyTheme.white_color,
          fontWeight: FontWeight.normal,
            fontSize: 18
        )
    );

  }
}
