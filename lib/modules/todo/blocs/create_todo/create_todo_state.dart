part of 'create_todo_cubit.dart';

enum TodoProgress {PURE,LOADING,SUCCESS,FAILURE}

class CreateTodoState extends Equatable {
  final String title;
  final String date;
  final String level;
  final TodoProgress isLoading;

  CreateTodoState({
    this.title = "",
    this.date,
    this.level = "Usual",
    this.isLoading = TodoProgress.PURE, 
  });

  copyWith({
    title,
    date,
    level,
    isLoading,
  }) =>
      CreateTodoState(
        title: title ?? this.title,
        date: date ?? this.date,
        level: level ?? this.level,
        isLoading: isLoading ?? this.isLoading,
      );

  @override
  List<Object> get props => [title, date, level,isLoading];
}
