part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo> todos;

  TodoLoaded(this.todos);
  @override
  List<Object> get props => [todos];

  List<Todo> get today =>
      todos.where((element) => element.time.day == DateTime.now().day).toList();

  List<Todo> get tomorrow => todos
      .where((element) => element.time.day == DateTime.now().day + 1)
      .toList();
}

class TodoError extends TodoState {}

class TodoLoading extends TodoState {}
