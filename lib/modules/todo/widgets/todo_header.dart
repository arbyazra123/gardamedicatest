import 'package:flutter/material.dart';
import 'package:gardamedicatest/modules/todo/blocs/todo/todo_bloc.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/modules/todo/widgets/top_painter.dart';
import 'package:gardamedicatest/shared/asset_paths.dart';

class TodoHeader extends StatelessWidget {
  final TodoLoaded todos;

  const TodoHeader({Key key, this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TopCustomPaint(),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 14, bottom: 16),
        height: 190,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Hello",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        )),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Today you have " +
                          todos.today.length.toString() +
                          " tasks",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [Colors.blue[200], Colors.blue[300]])),
              height: 100,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              // margin: EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Today Todo",
                          style: TextStyle(
                              letterSpacing: 0.5,
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      Text(
                          todos.today.length == 0
                              ? "You dont have active task"
                              : todos.today.first.title,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            color: Colors.white,
                            fontSize: 16,
                          ))
                    ],
                  ),
                  // Spacer(),
                  Container(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      AssetPaths.bell,
                      width: 80,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
