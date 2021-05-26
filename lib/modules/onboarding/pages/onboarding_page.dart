import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gardamedicatest/modules/onboarding/bloc/onboarding/onboarding_bloc.dart';
import 'package:gardamedicatest/shared/colors.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[500],
        floatingActionButton: Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.maxFinite,
          child: ElevatedButton(
            child: Text(
              "NEXT",
              style: TextStyle(color: AppColors.primaryColor),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: () {
              BlocProvider.of<OnboardingBloc>(context).add(UserHasOnboarded());
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "TODO",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pattaya"),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "evertyhing will be organized perfectly and helps you improve by your wishes day by day",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ));
  }
}
