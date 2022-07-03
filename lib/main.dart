import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:weather_app/screen/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/screen/history/bloc/history_bloc.dart';
import 'package:weather_app/screen/home/bloc/home_bloc.dart';
import 'package:weather_app/screen/map/widget/map_bloc.dart';
import 'package:weather_app/screen/splash/bloc/splash_bloc.dart';
import 'package:weather_app/screen/splash/splash_screen.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/color_res.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SplashBloc>(
          create: (context) => SplashBloc(),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
        BlocProvider<ForecastBloc>(
          create: (context) => ForecastBloc(),
        ),
        BlocProvider<HistoryBloc>(
          create: (context) => HistoryBloc(),
        ),
        BlocProvider<MapBloc>(
          create: (context) => MapBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: ColorRes.themeColor,
          colorScheme: const ColorScheme.dark().copyWith(
            primary: ColorRes.themeColor,
            secondary: ColorRes.themeColor,
          ),
        ),
        navigatorKey: navigator,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}
