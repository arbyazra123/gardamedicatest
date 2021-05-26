import 'package:flutter/material.dart';
import 'package:gardamedicatest/modules/todo/blocs/todo/todo_bloc.dart';
import 'package:gardamedicatest/modules/todo/widgets/todo_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllTodoPage extends StatefulWidget {
  final bool isToday;
  const AllTodoPage({
    Key key,
    this.isToday,
  }) : super(key: key);
  @override
  _AllTodoPageState createState() => _AllTodoPageState();
}

class _AllTodoPageState extends State<AllTodoPage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodos());
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TodoBloc>().add(ResetTodos());
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            widget.isToday?"Today":"Tomorrow",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
          listener: (context, state) {
            if (state is TodoInitial) {
              context.read<TodoBloc>().add(GetTodos());
            }
          },
          builder: (context, state) {
            if (state is TodoLoaded) {
              return TodoListView(
                isAllTodo: true,
                todos: widget.isToday ? state.today : state.tomorrow,
                isToday: widget.isToday,
              );
            }
            if (state is TodoError) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Text("Ups, There's something error in our system :("),
                ),
              );
            }
            return SizedBox(
              height: 200,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
