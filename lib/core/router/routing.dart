// ignore_for_file: unused_element

import 'dart:io';

import 'package:antripe/features/user/presentation/pages/home_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static const String homeScreen = '/homeScreen';
  static const String loading = '/loading';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        //   final args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(widget: HomeScreen()),
                settings: settings,
              )
            : CupertinoPageRoute(builder: (context) => HomeScreen(), settings: settings);

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
    : super(
        settings: settings,
        pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return widget;
        },
        transitionDuration: const Duration(milliseconds: 600), // Increased duration for smoother effect
        reverseTransitionDuration: const Duration(milliseconds: 600),
        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
          // Define the scale transition animation
          var beginScale = 0.85;
          var endScale = 1.0;
          var scaleTween = Tween(begin: beginScale, end: endScale).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

          // Define the fade transition animation
          var beginFade = 0.0;
          var endFade = 1.0;
          var fadeTween = Tween(begin: beginFade, end: endFade).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

          return FadeTransition(
            opacity: fadeTween,
            child: ScaleTransition(scale: scaleTween, child: child),
          );
        },
      );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(opacity: value, child: child);
      },
      child: widget,
    );
  }
}
