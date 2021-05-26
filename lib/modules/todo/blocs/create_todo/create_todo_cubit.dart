import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gardamedicatest/modules/todo/data/models/todos.dart';
import 'package:gardamedicatest/modules/todo/data/repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

part 'create_todo_state.dart';

class CreateTodoCubit extends Cubit<CreateTodoState> {
  CreateTodoCubit(this.repository) : super(CreateTodoState(level: "Usual"));
  TodoRepository repository;

  String selectedLevel = "Usual";
  void onTitleChanged(String v) {
    emit(state.copyWith(title: v));
  }

  void onDateChanged(String v) {
    emit(state.copyWith(date: v));
  }

  void onLevelChanged(String v) {
    emit(state.copyWith(level: v));
  }

  void save() async {
    emit(state.copyWith(isLoading: TodoProgress.LOADING));
    print(state.title);
    print(state.date);
    print(state.level);
    try {
      var request = Todo(
          id: Uuid().v4(),
          level: state.level,
          time: DateTime.parse(state.date),
          title: state.title);
      var response = await repository.addTodo(request);
      if (response != null) {
        emit(state.copyWith(isLoading: TodoProgress.SUCCESS));
        emit(state.copyWith(isLoading: TodoProgress.PURE));
      } else {
        emit(state.copyWith(isLoading: TodoProgress.FAILURE));
        emit(state.copyWith(isLoading: TodoProgress.PURE));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: TodoProgress.FAILURE));
      emit(state.copyWith(isLoading: TodoProgress.PURE));
    }
  }

  void update() async {
    emit(state.copyWith(isLoading: TodoProgress.LOADING));
    print(state.title);
    print(state.date);
    print(state.level);
    try {
      var request = Todo(
          id: Uuid().v4(),
          level: state.level,
          time: DateTime.parse(state.date),
          title: state.title);
      var response = await repository.updateTodo(request);
      if (response != null) {
        emit(state.copyWith(isLoading: TodoProgress.SUCCESS));
      } else {
        emit(state.copyWith(isLoading: TodoProgress.FAILURE));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: TodoProgress.FAILURE));
    }
  }
}
