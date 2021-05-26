import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gardamedicatest/modules/todo/data/repository/todo_repository.dart';

part 'delete_todo_event.dart';
part 'delete_todo_state.dart';

class DeleteTodoBloc extends Bloc<DeleteTodoEvent, DeleteTodoState> {
  DeleteTodoBloc(this.repository) : super(DeleteTodoInitial());
  TodoRepository repository;
  @override
  Stream<DeleteTodoState> mapEventToState(
    DeleteTodoEvent event,
  ) async* {
    if (event is DeleteTodo) {
      var result = await repository.deleteTodo(event.id);
      if (result) {
        yield DeleteTodoLoaded(result: result);
      } else {
        yield DeleteTodoError();
      }
    }
  }
}
