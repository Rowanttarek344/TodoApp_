//to save all firebase functions

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/Model/task.dart';

//function to get the task collection
CollectionReference<task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('task').withConverter<task>(
        fromFirestore: ((snapshot, options) => task.fromJson(snapshot.data()!)),
        toFirestore: (task, options) => task.toJson(),
      );
}

Future<void> addTaskToFireStore(task task) {
  var collection = getTaskCollection(); //collection
  var docRef = collection.doc(); //document
  task.id = docRef.id; //auto-generated id
  print(docRef.id);
  return docRef.set(task);
}

Future<void> deleteTaskFromFireStore(task Task) {
  return getTaskCollection().doc(Task.id).delete();
}

Future<void> updateTaskInFireStore(task Task) {
  return getTaskCollection().doc(Task.id).update({'isDone': true});
}

Future<void> editTaskInFireStore(
    task Task, String newTitle, String newDesc, int newDate) {
  return getTaskCollection()
      .doc(Task.id)
      .update({'title': newTitle, 'description': newDesc, 'date': newDate});
}
