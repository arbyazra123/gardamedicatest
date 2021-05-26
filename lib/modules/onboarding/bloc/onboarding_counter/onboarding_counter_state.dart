part of 'onboarding_counter_cubit.dart';

abstract class OnboardingCounterState extends Equatable {
  const OnboardingCounterState();

  @override
  List<Object> get props => [];
}


class SkippedPage extends OnboardingCounterState{
  final bool isLast;

  SkippedPage(this.isLast);
  @override
  List<Object> get props => [isLast];
  
}
