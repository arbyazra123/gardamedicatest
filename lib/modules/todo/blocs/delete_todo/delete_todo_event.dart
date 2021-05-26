part of 'delete_todo_bloc.dart';

abstract class DeleteTodoEvent extends Equatable {
  const DeleteTodoEvent();

  @override
  List<Object> get props => [];
}

class DeleteTodo extends DeleteTodoEvent{
  final String id;

  DeleteTodo(this.id);
}