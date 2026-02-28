import 'package:antripe/core/di/di.dart';
import 'package:antripe/core/router/navigation_service.dart';
import 'package:antripe/core/router/routing.dart';
import 'package:antripe/core/service/internate_checker.dart';
import 'package:antripe/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toastification/toastification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diSetup();
  InternateChecker.initiInternetChecker();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // iPhone X design size, adjust as needed
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ProviderScope(
          child: ToastificationWrapper(
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
              debugShowCheckedModeBanner: false,
              onGenerateRoute: RouteGenerator.generateRoute,
              navigatorKey: NavigationService.navigatorKey,
              home: InternetStatusWidget(child: const SplashScreen()),
            ),
          ),
        );
      },
    );
  }
}
