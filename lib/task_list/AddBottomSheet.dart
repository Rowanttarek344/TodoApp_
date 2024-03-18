import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Model/task.dart';
import 'package:todo/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../MyTheme.dart';
import '../Provider/list_provider.dart';

class AddBottomSheet extends StatefulWidget {
  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  String title = "";
  String description = "";

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);

    return Container(
      padding: EdgeInsets.all(20),
      color: provider.appMode == ThemeMode.light
          ? MyTheme.white_color
          : MyTheme.dark_black_color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.add_new_task,
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
                      hintText: AppLocalizations.of(context)!.enter_task_desc,
                      hintStyle: Theme.of(context).primaryTextTheme.subtitle2),
                  onChanged: (value) {
                    title = value;
                  },
                  //returns Nullable string law mktabtsh haga htrga3 string ->error msg,else returns null(no error)
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter task title';
                    } else
                      return null;
                  },
                ),
                SizedBox(
                  height: 18,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enter_task_desc,
                    hintStyle: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                  onChanged: (value) {
                    description = value;
                  },
                  minLines: 4,
                  maxLines: 4,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter task description';
                    } else
                      return null;
                  },
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
          SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () {
              addTask();
            },
            style: ButtonStyle(
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
                AppLocalizations.of(context)!.add,
                style: Theme.of(context).primaryTextTheme.headline1,
              ),
            ),
          )
        ],
      ),
    );
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

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      //add task
      task Task = task(
          //create the task
          title: title,
          description: description,
          Date: selectedDate.millisecondsSinceEpoch);
      addTaskToFireStore(Task).timeout(Duration(microseconds: 500),
          onTimeout: () {
        print('task added successfully');
        Navigator.of(context).pop();
      });
    }
  }
}
