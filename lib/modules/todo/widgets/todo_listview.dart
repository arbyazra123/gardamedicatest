import 'package:flutter/material.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/modules/todo/pages/based_day_todo_page.dart';
import 'package:gardamedicatest/modules/todo/widgets/todo_item.dart';

class TodoListView extends StatefulWidget {
  final List<Todo> todos;
  final bool isAllTodo;
  final bool isToday;
  const TodoListView({
    Key key,
    this.todos,
    this.isAllTodo = false,
    this.isToday = true,
  }) : super(key: key);
  @override
  _TodayTodoState createState() => _TodayTodoState();
}

class _TodayTodoState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isAllTodo
            ? SizedBox()
            : Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.isToday ? "Today" : "Tomorrow",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    widget.todos.length > 3
                        ? InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AllTodoPage(isToday: widget.isToday),
                                )),
                            child: Text(
                              "Show All",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 14,
                              ),
                            ),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
        SizedBox(
          height: widget.isAllTodo ? null : 190,
          child: ListView.separated(
              padding: EdgeInsets.only(
                top: 14,
                left: 20,
                right: 20,
              ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 2,
                  ),
              physics: widget.isAllTodo
                  ? BouncingScrollPhysics()
                  : NeverScrollableScrollPhysics(),
              itemCount: widget.isAllTodo
                  ? widget.todos.length
                  : widget.todos.length > 3
                      ? 3
                      : widget.todos.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var curData = widget.todos[index];
                return TodoItem(curData: curData);
              }),
        )
      ],
    );
  }
}
