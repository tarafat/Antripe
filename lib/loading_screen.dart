import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:antripe/core/common_widget/action_button.dart';
import 'package:antripe/core/constants/app_strings.dart';
import 'package:antripe/core/helper/ui_helpers.dart';
import 'package:antripe/core/router/navigation_service.dart';
import 'package:antripe/core/router/routing.dart';
import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _controller.forward();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;

    NavigationService.navigateToReplacement(Routes.homeScreen);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = ref.watch(appColorsProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFE9F4F1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UIHelper.verticalSpace(100.h),
          Spacer(),
          Center(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(scale: _scaleAnimation, child: Image.asset('assets/images/icon_wbg.png', width: 100)),
            ),
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [ColorizeAnimatedText('Qunova', textStyle: TextFontStyle.text28w700, colors: colorizeColors)],
          ),
          Text("Make Life Easy", style: TextFontStyle.text10w400.copyWith(color: const Color(0xFF717171), letterSpacing: 4.32)),
          Spacer(),
          Container(
            height: 0.8.sw,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
            decoration: BoxDecoration(
              color: const Color(0xFF098268),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(15.r), topRight: Radius.circular(15.r)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome", style: TextFontStyle.text40w500.copyWith(color: appColors.cFFFFFF)),
                UIHelper.verticalSpaceSmall,
                Text(
                  "Welcome to **Qunova** – your space for fast, simple, and meaningful conversations.Connect instantly, share moments, and stay close to the people who matter most.Start chatting today and experience communication made effortless.",
                  style: TextFontStyle.text12w400.copyWith(color: appColors.cFFFFFF),
                ),
                UIHelper.verticalSpaceMediumLarge,
                ActionButton(
                  name: 'Getting Started',
                  height: 45.h,
                  onTap: () async {
                    Navigator.of(context).pop();
                  },
                  isBorderSide: true,
                  colors: [appColors.cFFFFFF, appColors.cFFFFFF],
                  borderRadius: 30.r,
                  borderColor: appColors.borderColor,
                  style: TextStyle(color: appColors.textColor, fontSize: 12.sp, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
