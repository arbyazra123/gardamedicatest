import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gardamedicatest/modules/onboarding/bloc/onboarding/onboarding_bloc.dart';
import 'package:gardamedicatest/modules/onboarding/bloc/onboarding_counter/onboarding_counter_cubit.dart';
import 'package:gardamedicatest/modules/onboarding/data/repostiory/onboarding_repository.dart';
import 'package:gardamedicatest/modules/onboarding/pages/onboarding_page.dart';
import 'package:gardamedicatest/modules/todo/data/repository/todo_repository.dart';
import 'package:gardamedicatest/shared/theme.dart';

import 'modules/todo/blocs/bottom_dialog/bottom_dialog_cubit.dart';
import 'modules/todo/blocs/delete_todo/delete_todo_bloc.dart';
import 'modules/todo/blocs/todo/todo_bloc.dart';
import 'modules/todo/pages/todo_page.dart';
import 'shared/bloc_observer.dart';

void main() {
  Bloc.observer = CustomBlocObserver();
  
  OnboardingRepository repository = OnboardingRepository();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => OnboardingBloc(repository)
          ..add(
            CheckUserHasOnboarded(),
          ),
      ),
      BlocProvider(
        create: (_) => OnboardingCounterCubit(),
      ),
      BlocProvider(
        create: (_) => BottomDialogCubit(),
      ),
      BlocProvider(
        create: (_) => TodoBloc(TodoRepository()),
      ),
      BlocProvider(
        create: (_) => DeleteTodoBloc(TodoRepository()),
      ),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "GardaMedica Test",
      home: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          if (state is Onboarded) {
            return TodoPage();
          }
          if (state is Unonboarded) {
            return OnboardingPage();
          }
          return MainLoading();
        },
      ),
      theme: LightTheme.themeData,
    );
  }
}

class MainLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
