import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Model/task.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/firebase_utils.dart';
import 'package:todo/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Provider/list_provider.dart';

class edit_task extends StatefulWidget {
  static const String routeName = 'editTask-screen';

  @override
  State<edit_task> createState() => _edit_taskState();
}

class _edit_taskState extends State<edit_task> {
  String title = "";
  String description = "";
  late DateTime selectedDate;

  var formKey = GlobalKey<FormState>();
  late var args;
int count=0;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);
    args = ModalRoute.of(context)?.settings.arguments as taskArgs;

    if(count==0){
      selectedDate = DateTime.fromMillisecondsSinceEpoch(args.date);
      title=args.title;
      description=args.description;

      count++;
    }

    return Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 17.0, top: 25),
            child: Text(
              AppLocalizations.of(context)!.todo_list,
              style: Theme.of(context).primaryTextTheme.headline1,
            ),
          ),
          //toolbarHeight:MediaQuery.of(context).size.height*.17 , // Set this height
        ),
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .1,
              color: MyTheme.blue_color,
            ),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: provider.appMode == ThemeMode.light
                    ? MyTheme.white_color
                    : MyTheme.dark_black_color,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.edit_task,
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                                hintStyle: Theme.of(context)
                                    .primaryTextTheme
                                    .subtitle2),
                            initialValue: args.title,
                            onChanged: (value) {
                              title = value;
                            },
                            //returns Nullable string law mktabtsh haga htrga3 string ->error msg,else returns null(no error)
                            /*validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter task title';
                              } else
                                return null;
                            },*/
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintStyle:
                                  Theme.of(context).primaryTextTheme.subtitle2,
                            ),
                            initialValue:args.description ,
                            onChanged: (value) {
                              description = value;
                            },
                            minLines: 4,
                            maxLines: 4,
                            /* validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'please enter task description';
                              } else
                                return null;
                            },*/
                          ),
                          SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.select_date,
                      style: Theme.of(context).primaryTextTheme.subtitle1,
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        style: Theme.of(context).primaryTextTheme.subtitle1,
                        textAlign: TextAlign.center,
                      ),
                      onTap: () => chooseDate(),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: editTask,
                      style:ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            )),
                        backgroundColor:
                        MaterialStatePropertyAll<Color>(MyTheme.blue_color),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          AppLocalizations.of(context)!.save_changes,
                          style: Theme.of(context).primaryTextTheme.headline1,
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  void chooseDate() async {
    var chosenDate = await showDatePicker(
        //nullable DateTime
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
  }

  void editTask() {
    editTaskInFireStore(
            args.Task, title, description, selectedDate.millisecondsSinceEpoch)
        .timeout(Duration(microseconds: 500), onTimeout: () {
      print('task edited successfully');
      Navigator.of(context).pop(home_screen.routeName);
    });
  }
}

class taskArgs {
  String title;
  String description;
  int date;
  task Task;
  taskArgs(
      {required this.title,
      required this.description,
      required this.date,
      required this.Task});
}
