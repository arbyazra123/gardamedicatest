import 'package:flutter/material.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/shared/helper/utils.dart';
import 'package:intl/intl.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key key,
    @required this.curData,
  }) : super(key: key);

  final Todo curData;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.maxFinite,
          height: 40,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  color: Utils.getLevelColor(curData.level).withOpacity(0.8),
                  spreadRadius: 1)
            ],
            borderRadius: BorderRadius.circular(12),
            color: Utils.getLevelColor(curData.level),
          ),
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.maxFinite,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(curData.title),
                Text(DateFormat("HH:mm").format(curData.time)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
