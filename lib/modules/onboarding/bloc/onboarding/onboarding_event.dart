part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object> get props => [];
}


class CheckUserHasOnboarded extends OnboardingEvent{}
class UserHasOnboarded extends OnboardingEvent{}