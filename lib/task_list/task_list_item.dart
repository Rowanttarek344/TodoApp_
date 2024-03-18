import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/Model/task.dart';
import 'package:todo/MyTheme.dart';
import 'package:todo/edit_task.dart';
import 'package:todo/firebase_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../Provider/list_provider.dart';

class task_list_item extends StatefulWidget {
  task Task;
  task_list_item({required this.Task});

  @override
  State<task_list_item> createState() => _task_list_itemState();
}

class _task_list_itemState extends State<task_list_item> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<listProvider>(context);

    return Container(
      margin: EdgeInsets.only(left: 16),
      child: Slidable(
        // The start action pane is the one at the left or the top side.
        startActionPane: ActionPane(
          extentRatio: 0.23,
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (context) {
                deleteTaskFromFireStore(widget.Task)
                    .timeout(Duration(milliseconds: 500), onTimeout: () {
                  print("task deleted successfully");
                });
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
              borderRadius:
              provider.appLanguage == 'en'?
              BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ):
              BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )
            ),
          ],
        ),

        // The child of the Slidable is what the user sees when the
        // component is not dragged.
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(edit_task.routeName,
                arguments: taskArgs(
                    title: widget.Task.title,
                    description: widget.Task.description,
                    date: widget.Task.Date,
                    Task: widget.Task));
          },
          child: Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.only(top: 20, right: 16, bottom: 20),
            decoration: BoxDecoration(
                color: provider.appMode == ThemeMode.light
                    ? MyTheme.white_color
                    : MyTheme.dark_black_color,
                borderRadius: provider.appLanguage == 'en'
                    ? BorderRadius.only(
                        bottomRight: Radius.circular(16),
                        topRight: Radius.circular(16),
                      )
                    : BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        topLeft: Radius.circular(16),
                      )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: widget.Task.isDone == false
                      ? MyTheme.blue_color
                      : MyTheme.green_color,
                  width: 5,
                  height: 60,
                  margin: EdgeInsets.only(left: 15),
                ),
                SizedBox(
                  width: 18,
                ),
                Column(
                  children: [
                    Text(
                      '${widget.Task.title}',
                      style: widget.Task.isDone == false
                          ? Theme.of(context).primaryTextTheme.headline4
                          : Theme.of(context).primaryTextTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${widget.Task.description}',
                      style: Theme.of(context).primaryTextTheme.headline5,
                    )
                  ],
                ),
                SizedBox(
                  width: 28,
                ),
                widget.Task.isDone == false
                    ? Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 18),
                        decoration: BoxDecoration(
                            color: MyTheme.blue_color,
                            borderRadius: BorderRadius.circular(8)),
                        child: IconButton(
                          icon: Icon(Icons.check,
                              size: 35, color: MyTheme.white_color),
                          onPressed: () {
                            updateTask(widget.Task);
                            setState(() {});
                          },
                        ),
                      )
                    : Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 18),
                        color: Colors.transparent,
                        child: Text(
                          AppLocalizations.of(context)!.done,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: MyTheme.green_color),
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void updateTask(task Task) {
    //update task isDone
    if (Task.isDone == false) {
      updateTaskInFireStore(Task).timeout(Duration(milliseconds: 500),
          onTimeout: () {
        print('task updated successfully');
        //Navigator.of(context).pop();
      });
    }
    setState(() {});
  }
}
