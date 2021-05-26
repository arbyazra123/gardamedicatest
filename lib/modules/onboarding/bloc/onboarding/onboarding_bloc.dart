import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gardamedicatest/modules/onboarding/data/repostiory/onboarding_repository.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this.repository) : super(OnboardingInitial());
  OnboardingRepository repository;
  @override
  Stream<OnboardingState> mapEventToState(
    OnboardingEvent event,
  ) async* {
    if(event is CheckUserHasOnboarded){
      var result = await repository.checkIfUserHasOnboarded();
      if(result){
        yield Onboarded();
      } else {
        yield Unonboarded();
      }
    }

    if(event is UserHasOnboarded){
      await repository.userOnboarded();
      yield Onboarded();
    }
  }
}
