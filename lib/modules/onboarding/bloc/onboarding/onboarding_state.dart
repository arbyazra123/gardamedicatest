part of 'onboarding_bloc.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();
  
  @override
  List<Object> get props => [];
}

class OnboardingInitial extends  OnboardingState {}
class Onboarded extends OnboardingState {
  @override
  List<Object> get props => [];
}
class Unonboarded extends OnboardingState {
  @override
  List<Object> get props => [];
}
