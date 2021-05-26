part of 'bottom_dialog_cubit.dart';

abstract class BottomDialogState extends Equatable {
  const BottomDialogState();

  @override
  List<Object> get props => [];
}

class BottomDialogClosed extends BottomDialogState {}
class BottomDialogOpened extends BottomDialogState {}
