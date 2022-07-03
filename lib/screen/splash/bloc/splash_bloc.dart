import 'package:weather_app/common/helper.dart';
import 'package:weather_app/screen/dashboard/dahsboard.dart';
import 'package:weather_app/screen/splash/bloc/splash_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvent, dynamic> {
  SplashBloc() : super(0) {
    on<NavigateToDashboard>(navigatePage);
  }

  void navigatePage(NavigateToDashboard event, Emitter<dynamic> emit) {
    Future.delayed(const Duration(milliseconds: 2000), () {
      navigator.currentState!.pushReplacement(
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    });
  }
}
