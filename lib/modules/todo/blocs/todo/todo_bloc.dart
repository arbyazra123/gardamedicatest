import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/modules/todo/data/repository/todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this.repository) : super(TodoInitial());
  TodoRepository repository;
  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is ResetTodos) {
      yield TodoInitial();
    }
    if (event is GetTodos) {
      // try {
      var result = await repository.getTodos();
      if (result != null) {
        yield TodoLoaded(result);
      } else {
        yield TodoError();
      }
      // } catch (e) {
      //   yield TodoError();
      // }
    }
  }
}
