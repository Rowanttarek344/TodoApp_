import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/task_list/task_list_item.dart';

class task_list_tab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate:DateTime.now() ,
            firstDate: DateTime.now().subtract(Duration(days: 365)),
            lastDate: DateTime.now().add( Duration(days: 365 )),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: MyTheme.black_color,
            dayColor: MyTheme.black_color,
            dayNameColor:  MyTheme.white_color,
            activeDayColor:MyTheme.white_color,
            activeBackgroundDayColor:MyTheme.blue_color,
            dotsColor:  MyTheme.white_color,
            selectableDayPredicate: (date) => date.day != 23,
            locale: 'en',
          ),
          SizedBox(height: 18,),
          Expanded(
            child: ListView.builder(
              itemBuilder:(context, index) => task_list_item(),
              itemCount: 10,

            ),
          )


        ],
      ),
    );
  }
}
