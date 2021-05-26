import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_dialog_state.dart';

class BottomDialogCubit extends Cubit<BottomDialogState> {
  BottomDialogCubit() : super(BottomDialogClosed());

  void open(){
    emit(BottomDialogOpened());
  }
  void closed(){
    emit(BottomDialogClosed());
  }
}
