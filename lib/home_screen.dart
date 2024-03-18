import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/settings/settings_tab.dart';
import 'package:todo/task_list/AddBottomSheet.dart';
import 'package:todo/task_list/task_list_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Provider/list_provider.dart';

class home_screen extends StatefulWidget {
  static const String routeName = 'home-screen';

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List<Widget> tabs = [task_list_tab(), settings_tab()];

  int selected_index = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<listProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 17.0),
            child: Text(
              selected_index == 0
                  ? AppLocalizations.of(context)!.todo_list
                  : AppLocalizations.of(context)!.settings,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          toolbarHeight:
              MediaQuery.of(context).size.height * .17, // Set this height
          flexibleSpace: Container(
            color: MyTheme.blue_color,
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color:provider.appMode==ThemeMode.light?
                  MyTheme.white_color:
                  MyTheme.dark_black_color,
                  width: 6, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(50)),
          child: FloatingActionButton(
            onPressed: () {
              showAddBottomSheet();
            },
            child: Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BottomAppBar(
              shape: CircularNotchedRectangle(),
              notchMargin: 8,
              child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: provider.appMode==ThemeMode.light?
                      MyTheme.white_color:
                      MyTheme.dark_black_color
                ),
                child: BottomNavigationBar(
                  currentIndex: selected_index,
                  onTap: (value) => setState(() {
                    selected_index = value;
                  }),
                  items: [
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/ic_task_list.png'),
                          size: 30,
                        ),
                        label: ''),
                    BottomNavigationBarItem(
                        icon: ImageIcon(
                          AssetImage('assets/images/ic_settings.png'),
                          size: 30,
                        ),
                        label: ''),
                  ],
                ),
              ),
            )),
        body: tabs[selected_index]);
  }

  void showAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddBottomSheet(),
    );
  }
}
