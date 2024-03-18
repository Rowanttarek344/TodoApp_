import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Model/task.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/Provider/list_provider.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/task_list/AddBottomSheet.dart';
import 'package:todo/task_list/task_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class task_list_tab extends StatefulWidget {
  @override
  State<task_list_tab> createState() => _task_list_tabState();
}

class _task_list_tabState extends State<task_list_tab> {

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<listProvider>(context);
    provider.getAllTasksFromFireStore();

    return Container(
      child: Column(
        children: [
          SizedBox(height: 8,),
          CalendarTimeline(
            initialDate:provider.selectedDate ,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add( Duration(days: 365 )),
            onDateSelected: (date) {
              provider.changeSelectedDate(date);
              setState(() {

              });
            },
            leftMargin: 20,
            monthColor: provider.appMode==ThemeMode.light?
            MyTheme.black_color:
            MyTheme.white_color,

            dayColor: provider.appMode==ThemeMode.light?
            MyTheme.black_color:
            MyTheme.white_color,

            dayNameColor:  provider.appMode==ThemeMode.light?
            MyTheme.white_color:
            MyTheme.primary_dark_color,

            activeDayColor:provider.appMode==ThemeMode.light?
            MyTheme.white_color:
            MyTheme.primary_dark_color,

            activeBackgroundDayColor:MyTheme.blue_color,
            dotsColor:  provider.appMode==ThemeMode.light?
            MyTheme.white_color:
            MyTheme.primary_dark_color,

            locale: provider.appLanguage,
          ),
          SizedBox(height: 18,),
          Expanded(
            child: ListView.separated(
              itemBuilder:(context, index) => task_list_item(Task: provider.alltasks[index],),
              itemCount: provider.alltasks.length,
              separatorBuilder: (context, index) =>SizedBox(height: 18,),
            ),
          )


        ],
      ),
    );
  }


}
