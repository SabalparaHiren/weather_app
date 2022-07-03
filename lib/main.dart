import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/screen/dashboard/dashboard_provider.dart';
import 'package:weather_app/screen/forecast/forecast_provider.dart';
import 'package:weather_app/screen/history/history_provider.dart';
import 'package:weather_app/screen/home/home_provider.dart';
import 'package:weather_app/screen/map/map_provider.dart';
import 'package:weather_app/screen/splash/splash_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SplashProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForecastProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => HistoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MapProvider(),
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
