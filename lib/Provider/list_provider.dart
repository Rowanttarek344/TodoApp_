import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Model/task.dart';
import 'package:todo/firebase_utils.dart';

class listProvider extends ChangeNotifier {
  DateTime selectedDate = DateTime.now();
  List<task> alltasks = [];

  void getAllTasksFromFireStore() async {
    QuerySnapshot<task> collectionreference = await getTaskCollection().get();
    alltasks = collectionreference.docs
        .map((QueryDocumentSnapshot<task> q) => q.data())
        .toList();
    alltasks = alltasks.where((task) {
      DateTime x = DateTime.fromMillisecondsSinceEpoch(task.Date);
      if (x.day == selectedDate.day &&
          x.month == selectedDate.month &&
          x.year == selectedDate.year) {
        return true;
      } else {
        return false;
      }
    }).toList();
    alltasks.sort((task1, task2) {
      DateTime x = DateTime.fromMillisecondsSinceEpoch(task1.Date);
      DateTime y = DateTime.fromMillisecondsSinceEpoch(task2.Date);
      return x.compareTo(y);
    });
    notifyListeners();
  }

  void changeSelectedDate(DateTime newDate) {
    selectedDate = newDate;
    notifyListeners();
  }

  ///App config provuder
  String appLanguage = 'en';
  ThemeMode appMode = ThemeMode.light;

  void changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', appLanguage);
    notifyListeners();
  }

  void changeTheme(ThemeMode newMode) async {
    if (appMode == newMode) return;
    appMode = newMode;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', appMode == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }
}
