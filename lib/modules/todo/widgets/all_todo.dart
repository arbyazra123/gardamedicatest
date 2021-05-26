import 'package:flutter/material.dart';
import 'package:gardamedicatest/modules/todo/blocs/delete_todo/delete_todo_bloc.dart';
import 'package:gardamedicatest/modules/todo/blocs/todo/todo_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/modules/todo/widgets/new_todo.dart';
import 'package:gardamedicatest/modules/todo/widgets/todo_item.dart';

class AllTodo extends StatefulWidget {
  @override
  _AllTodoState createState() => _AllTodoState();
}

class _AllTodoState extends State<AllTodo> {
  bool editMode = false;
  Todo todo;
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodos());
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(microseconds: 300),
      crossFadeState:
          editMode ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      firstChild: _buildTodo(context),
      secondChild: NewTodo(
        todo: todo,
        onEditTab: () {
          setState(() {
            editMode = false;
          });
        },
      ),
    );
  }

  Widget _buildTodo(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<TodoBloc>().add(ResetTodos()),
      child: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is TodoInitial) {
            context.read<TodoBloc>().add(GetTodos());
          }
        },
        builder: (context, state) {
          if (state is TodoLoaded) {
            return _buildTodoList(state);
          }
          if (state is TodoError) {
            return SizedBox(
              child: Center(
                child: Text("Ups, There's something error in our system :("),
              ),
            );
          }
          return SizedBox(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTodoList(TodoLoaded state) {
    return BlocConsumer<DeleteTodoBloc, DeleteTodoState>(
      listener: (context, dstate) {
        if (state is DeleteTodoLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                "Success!",
              ),
            ),
          );
        }
      },
      builder: (context, dstate) {
        if (dstate is DeleteTodoLoading) {
          return Center(child: CircularProgressIndicator());
        }
        if (dstate is DeleteTodoLoaded) {
          return ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 10, top: 10),
            itemCount: state.todos.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 5,
            ),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(child: TodoItem(curData: state.todos[index])),
                  SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                    ),
                    onPressed: () {
                      setState(() {
                        todo = state.todos[index];
                        editMode = !editMode;
                      });
                    },
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      context
                          .read<DeleteTodoBloc>()
                          .add(DeleteTodo(state.todos[index].id));
                    },
                  ),
                ],
              );
            },
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 10, top: 10),
          itemCount: state.todos.length,
          separatorBuilder: (context, index) => SizedBox(
            height: 5,
          ),
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: TodoItem(curData: state.todos[index])),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                  ),
                  onPressed: () {
                    setState(() {
                      todo = state.todos[index];
                      editMode = !editMode;
                    });
                  },
                ),
                SizedBox(
                  width: 4,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    context
                        .read<DeleteTodoBloc>()
                        .add(DeleteTodo(state.todos[index].id));
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
