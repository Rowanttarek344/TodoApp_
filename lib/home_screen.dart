import 'package:flutter/material.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/settings/settings_tab.dart';
import 'package:todo/task_list/task_list_tab.dart';

class home_screen extends StatefulWidget {
  static const String routeName='home-screen';

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  List<Widget> tabs=[
    settings_tab(),task_list_tab()
  ];

  int selected_index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Padding(
          padding: const EdgeInsets.only(left: 17.0),
          child: Text('To Do List',style: Theme.of(context).primaryTextTheme.headline1,),
        ) ,
        toolbarHeight:MediaQuery.of(context).size.height*.17 , // Set this height
        flexibleSpace: Container(
          color: MyTheme.blue_color,
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius:BorderRadius.circular(16),

        child: BottomNavigationBar(
          currentIndex: selected_index,
          onTap: (value) => setState(() {
            selected_index=value;

          }),
          items: [
            BottomNavigationBarItem(
                icon:ImageIcon(AssetImage('assets/images/ic_task_list.png'),size: 30,),
              label: ''
            ),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/ic_settings.png'),size: 30,),
            label:''
            ),

          ],
        ),
      ),
      body:tabs[selected_index]
    );
  }
}


