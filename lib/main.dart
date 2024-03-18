import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/Provider/list_provider.dart';
import 'package:todo/edit_task.dart';
import 'package:todo/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();//offline
  runApp(ChangeNotifierProvider(create: (context) => listProvider(),child:MyApp()));
}
class MyApp extends StatelessWidget{
  late listProvider provider;
  @override
  Widget build(BuildContext context) {
    provider=Provider.of<listProvider>(context);
    initPrefs();
    return MaterialApp(
      routes: {
        home_screen.routeName:(context) => home_screen(),
        edit_task.routeName:(context) => edit_task()
      },
      initialRoute:home_screen.routeName ,
      darkTheme: MyTheme.dark_theme,
      theme: MyTheme.light_theme,
      locale: Locale(provider.appLanguage),
      themeMode: provider.appMode,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
  void initPrefs()async{
    final prefs=await SharedPreferences.getInstance();

    String lang=prefs.getString('language') ?? 'en';
    provider.changeLanguage(lang);

    String? theme=prefs.getString('theme');
    if(theme=='light'){
      provider.changeTheme(ThemeMode.light);
    }
    else if(theme=='dark'){
      provider.changeTheme(ThemeMode.dark);
    }
  }


}