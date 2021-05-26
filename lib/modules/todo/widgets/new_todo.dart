import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gardamedicatest/modules/todo/blocs/create_todo/create_todo_cubit.dart';
import 'package:gardamedicatest/modules/todo/blocs/todo/todo_bloc.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/modules/todo/data/repository/todo_repository.dart';
import 'package:intl/intl.dart';

class NewTodo extends StatelessWidget {
  final Todo todo;
  final VoidCallback onEditTab;
  const NewTodo({Key key, this.todo, this.onEditTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BlocProvider(
          create: (context) => CreateTodoCubit(TodoRepository()),
          child: NewTodoForm(
            todo: todo,
            onEditTab: onEditTab,
          ),
        ),
      ),
    );
  }
}

class NewTodoForm extends StatefulWidget {
  final Todo todo;
  final VoidCallback onEditTab;
  const NewTodoForm({Key key, this.todo, this.onEditTab}) : super(key: key);
  @override
  _NewTodoFormState createState() => _NewTodoFormState();
}

class _NewTodoFormState extends State<NewTodoForm> {
  final titleCon = TextEditingController();

  final dateCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      var todoBloc = context.read<CreateTodoCubit>();
      titleCon.text = widget.todo.title;
      dateCon.text = DateFormat("EEE MM - HH:mm").format(widget.todo.time);

      todoBloc.onDateChanged(widget.todo.time.toIso8601String());
      todoBloc.onLevelChanged(widget.todo.level);
      todoBloc.onTitleChanged(widget.todo.title);
    }
  }

  @override
  Widget build(BuildContext context) {
    var todoBloc = BlocProvider.of<CreateTodoCubit>(context);
    return BlocConsumer<CreateTodoCubit, CreateTodoState>(
      listener: (context, state) {
        if (state.isLoading == TodoProgress.SUCCESS) {
          // Navigator.pop(context);
          context.read<TodoBloc>().add(GetTodos());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                "Success!",
              ),
            ),
          );
        }
        if (state.isLoading == TodoProgress.FAILURE) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text(
                "Failed :(",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            widget.onEditTab != null
                ? Container(
                    height: 20,
                    margin: EdgeInsets.only(bottom: 30),
                    child: IconButton(
                        icon: Icon(Icons.close), onPressed: widget.onEditTab),
                  )
                : SizedBox(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Title",
                  border: OutlineInputBorder(),
                ),
                controller: titleCon,
                onChanged: (value) => todoBloc.onTitleChanged(value),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: "Time",
                  border: OutlineInputBorder(),
                ),
                controller: dateCon,
                readOnly: true,
                onTap: () {
                  DatePicker.showDateTimePicker(
                    context,
                    showTitleActions: true,
                    minTime: DateTime.now(),
                    maxTime: DateTime.now().add(Duration(days: 365)),
                    onChanged: (date) {
                      print('change $date');
                    },
                    onConfirm: (date) {
                      todoBloc.onDateChanged(date.toIso8601String());
                      dateCon.text = DateFormat("EEE MM - HH:mm").format(date);
                    },
                    currentTime: DateTime.now(),
                  );
                },
              ),
            ),
            RadioListTile<String>(
              value: "Usual",
              title: Text("Usual"),
              groupValue: todoBloc.state.level,
              onChanged: (String value) {
                todoBloc.onLevelChanged(value);
              },
            ),
            RadioListTile<String>(
              value: "Important",
              title: Text("Important"),
              groupValue: todoBloc.state.level,
              activeColor: Colors.orange,
              onChanged: (String value) {
                todoBloc.onLevelChanged(value);
              },
            ),
            RadioListTile<String>(
              value: "Essential",
              title: Text("Essential"),
              activeColor: Colors.red,
              groupValue: todoBloc.state.level,
              onChanged: (String value) {
                todoBloc.onLevelChanged(value);
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.maxFinite,
              height: 35,
              child: TextButton(
                  child: state.isLoading == TodoProgress.LOADING
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          widget.todo != null
                              ? "Update this Todo"
                              : "Add new Todo",
                          style: TextStyle(color: Colors.white),
                        ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () {
                    if (todoBloc.state.title == null ||
                        todoBloc.state.date == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text(
                            "fill the empty fields!",
                          ),
                        ),
                      );
                      return;
                    }
                    if (widget.todo == null)
                      todoBloc.save();
                    else
                      todoBloc.update();
                  }),
            )
          ],
        );
      },
    );
  }
}
