// To parse this JSON data, do
//
//     final todo = todoFromJson(jsonString);

import 'dart:convert';

List<Todo> todoFromJson(String str) => List<Todo>.from(json.decode(str).map((x) => Todo.fromJson(x)));

String todoToJson(List<Todo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Todo {
    Todo({
        this.title,
        this.time,
        this.level,
        this.id,
    });

    String title;
    DateTime time;
    String level;
    String id;

    Todo copyWith({
        String title,
        DateTime time,
        String level,
        String id,
    }) => 
        Todo(
            title: title ?? this.title,
            time: time ?? this.time,
            level: level ?? this.level,
            id: id ?? this.id,
        );

    factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        title: json["title"] == null ? null : json["title"],
        time: json["time"] == null ? null : DateTime.parse(json["time"]),
        level: json["level"] == null ? null : json["level"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, String> toJsonWithID() => {
        "title": title == null ? null : "${title}",
        "time": time == null ? null : "${time.toIso8601String()}",
        "level": level == null ? null : "${level}",
        "id": id == null ? null : "$id",
    };
    Map<String, dynamic> toJson() => {
        "title": title == null ? null : title,
        "time": time == null ? null : time.toIso8601String(),
        "level": level == null ? null : level,
    };
}
