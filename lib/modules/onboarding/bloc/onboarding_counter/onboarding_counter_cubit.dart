import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_counter_state.dart';

class OnboardingCounterCubit extends Cubit<OnboardingCounterState> {
  OnboardingCounterCubit() : super(SkippedPage(false));
  int initialIndex =0;
  void nextPage(){
    initialIndex+=1;
    emit(SkippedPage(initialIndex==3));
  }
}
