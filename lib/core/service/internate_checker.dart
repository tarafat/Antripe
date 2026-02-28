import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:rxdart/rxdart.dart';

class InternateChecker {
  static final InternateChecker _singleton = InternateChecker._internal();
  InternateChecker._internal();
  static InternateChecker get instance => _singleton;

  static BehaviorSubject<bool> isfirstLaunch = BehaviorSubject<bool>.seeded(true);
  static BehaviorSubject<bool> dataFetcher = BehaviorSubject<bool>.seeded(false);
  static ValueStream<bool> showingNotConnected = dataFetcher.stream;

  static Future<void> initiInternetChecker() async {
    isfirstLaunch.add(true);

    InternetConnectionChecker.createInstance(
      checkTimeout: const Duration(seconds: 3),
      checkInterval: const Duration(seconds: 5),
    ).onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          dataFetcher.add(false);
          break;
        case InternetConnectionStatus.disconnected:
          dataFetcher.add(true);
          break;
        case InternetConnectionStatus.slow:
          // TODO: Handle this case.
          dataFetcher.add(false);
      }
    });

    showingNotConnected.listen((event) {
      if (event) {
        if (isfirstLaunch.value == true) {
          isfirstLaunch.add(false);
        }
      } else {
        if (isfirstLaunch.value == true) {
          Future.delayed(Duration(seconds: 30)).then((value) => isfirstLaunch.add(false));
        }
      }
    });
  }
}

class InternetStatusWidget extends StatefulWidget {
  final Widget child;

  const InternetStatusWidget({required this.child, super.key});

  @override
  _InternetStatusWidgetState createState() => _InternetStatusWidgetState();
}

class _InternetStatusWidgetState extends State<InternetStatusWidget> {
  bool _isOffline = false;

  @override
  void initState() {
    super.initState();
    InternateChecker.showingNotConnected.listen((event) {
      setState(() {
        _isOffline = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          widget.child,
          if (_isOffline)
            Positioned.directional(
              top: 108,
              width: 1.sw,
              textDirection: TextDirection.rtl,
              child: Center(
                child: AnimatedOpacity(
                  opacity: 1,
                  duration: Duration(seconds: 2),
                  curve: Curves.bounceIn,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.wifi_off, size: 20, color: Colors.red),
                            //  UIHelper.horizontalSpaceSmall,
                            Text(
                              " You Are Currently offline",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, color: Colors.red),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
