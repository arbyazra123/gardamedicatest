part of 'delete_todo_bloc.dart';

abstract class DeleteTodoState extends Equatable {
  const DeleteTodoState();
  
  @override
  List<Object> get props => [];
}

class DeleteTodoInitial extends DeleteTodoState {}
class DeleteTodoLoaded extends DeleteTodoState {
  final bool result;

  DeleteTodoLoaded({this.result});
  @override
  List<Object> get props => [result];
}
class DeleteTodoError extends DeleteTodoState {}
class DeleteTodoLoading extends DeleteTodoState {}
