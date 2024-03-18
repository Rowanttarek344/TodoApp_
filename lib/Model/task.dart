class task {
  //data class(model) = table in sql
  String id;
  String title;
  String description;
  bool isDone;
  int Date; //can be of type DateTime but int is easier for manipulation can be converted later

  task(
      //constructor
      {this.id = " ", //auto generated,
      required this.title,
      required this.description,
      this.isDone = false,
      required this.Date});

//task->map
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone,
      "date": Date
    };
  }

  //map->task  (named constructor)
  task.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          title: json['title'] as String,
          description: json['description'] as String,
          isDone: json['isDone'] as bool,
          Date: json['date'] as int,
        );
  /*
Here's what's happening:

Task.fromJson(Map<String, dynamic> json) is a named constructor for the Task class. It takes a single argument, which is a JSON map represented as a Map<String, dynamic>.

: this(...) is a constructor initializer that calls the default constructor of the Task class (this()). It passes named parameters such as id, title, description, isDone, and date to the default constructor.

Inside the constructor initializer, each field of the Task class is initialized using values from the JSON map:

id: json['id'] as String retrieves the value associated with the key 'id' from the JSON map and casts it to a String.
title: json['title'] as String retrieves the value associated with the key 'title' from the JSON map and casts it to a String.
description: json['description'] as String retrieves the value associated with the key 'description' from the JSON map and casts it to a String.
isDone: json['isDone'] as bool retrieves the value associated with the key 'isDone' from the JSON map and casts it to a bool.
date: json['date'] as int retrieves the value associated with the key 'date' from the JSON map and casts it to an int.
Overall, this constructor allows you to create a Task object from a JSON map by providing values for its fields. It's a convenient way to deserialize JSON data into a Dart object representing a task with specific attributes.
   */
}
