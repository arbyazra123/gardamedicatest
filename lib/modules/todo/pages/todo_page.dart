import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gardamedicatest/modules/todo/blocs/bottom_dialog/bottom_dialog_cubit.dart';
import 'package:gardamedicatest/modules/todo/blocs/todo/todo_bloc.dart';
import 'package:gardamedicatest/modules/todo/data/repository/todo_repository.dart';
import 'package:gardamedicatest/modules/todo/widgets/all_todo.dart';
import 'package:gardamedicatest/modules/todo/widgets/new_todo.dart';
import 'package:gardamedicatest/modules/todo/widgets/todo_listview.dart';
import 'package:gardamedicatest/modules/todo/widgets/todo_header.dart';
import 'package:gardamedicatest/shared/dimens.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(GetTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      floatingActionButton: TodoActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: _buildTodoBody(),
      ),
      bottomSheet: TodoHandler(),
    );
  }

  Widget _buildTodoBody() {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        if (state is TodoLoaded) {
          return ListView(
            children: [
              TodoHeader(todos: state,),
              TodoListView(todos: state.today),
              TodoListView(
                todos: state.tomorrow,
                isToday: false,
              ),
              SizedBox(
                height: 100,
              ),
            ],
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
    );
  }
}

class TodoActionButton extends StatelessWidget {
  const TodoActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomDialogCubit, BottomDialogState>(
      builder: (context, state) {
        return FloatingActionButton(
          onPressed: () {
            if (state is BottomDialogClosed)
              BlocProvider.of<BottomDialogCubit>(context).open();
            else
              BlocProvider.of<BottomDialogCubit>(context).closed();
          },
          child: (state is BottomDialogClosed)
              ? Icon(Icons.arrow_drop_up_outlined)
              : Icon(Icons.arrow_drop_down_outlined),
        );
      },
    );
  }
}

class TodoHandler extends StatelessWidget {
  const TodoHandler({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomDialogCubit, BottomDialogState>(
      builder: (_, state) {
        var isClosed = (state is BottomDialogClosed);
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOutCirc,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 3,
                    color: Colors.blue.withOpacity(0.2),
                    offset: Offset(0, -1),
                    spreadRadius: 1)
              ]),
          width: double.maxFinite,
          height: isClosed ? 50 : Dimens.height(context) / 1.4,
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Container(
              height: 50,
              margin: EdgeInsets.only(top: isClosed ? 0 : 20),
              width: double.maxFinite,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Colors.transparent,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.blue[200],
                    tabs: [
                      Tab(
                        text: "Create",
                      ),
                      Tab(
                        text: "All todo",
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        NewTodo(),
                        AllTodo(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
