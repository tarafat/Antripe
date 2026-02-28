import 'package:antripe/core/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_colors.g.dart';

// Static colors
class StaticColors {
  static const Color primaryWhite = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFF031220);
  static const Color cDBDBDB = Color(0xFF2E2E2E);
  static const Color cF2F2F2 = Color(0xFFF2F2F2);
  static const Color c34C759 = Color(0xFF34C759);
  static const Color cStroke = Color(0xFF3A3A3C);
  static const Color cFFFFFF = Color(0xFFFFFFFF);
  static const Color c8D8D8D = Color(0xFF8D8D8D);
  static const Color cCCCCCC = Color(0xFFCCCCCC);
  static const Color cD92C20 = Color(0xFFD92D20);
  static const Color cA8A8A8 = Color(0xFFA8A8A8);
  static const Color c475467 = Color(0xFF475467);
  static const Color eEF2F6 = Color(0xFFEEF2F6);
  static const Color cD8EE8 = Color(0xFF8CD8EE);
  static const Color d4F6FF = Color(0xFFD4F6FF);
  static const Color e6F6FB = Color(0xFFE6F6FB);
  static const Color fAEFEB = Color(0xFFFAEFEB);
  static const Color e1F9FF = Color(0xFFE1F9FF);
  static const Color o0A0CD = Color(0xFF00A0CD);
  static const Color transparent = Color(0x00000000);
  static const Color lightBlue700 = Color(0xFF2194B4);
  static const Color lightBlue900 = Color(0xFF0C252B);
  static const Color grey500 = Color(0xFF8799AA);
  static const Color lightBlue600 = Color(0xFF47BCDD);
  static const Color lightBlue500 = Color(0xFF8ED2E5);

  static const Color c000000 = Color(0xFF000000);
  static const Color oC252B = Color(0xFF0C252B);
  static const Color s78858C = Color(0xFF78858C);
  static const Color e6F9FF = Color(0xFFE6F9FF);
  static const Color t692AC = Color(0xFF3692AC);

  static const Color c475569 = Color(0xFF475569);
  static Color get c94A3B8 => Color(0xFF94A3B8);
}

class AppColorPalette {
  //new colors start
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;
  final Color textColor;
  final Color c1A73E8;
  final Color textColorTwo;
  final Color textColorThree;
  final Color hintTextColor;
  final Color borderColor;
  final Color errorColor;
  final Color cFFFFFF;
  final Color c12B769;
  final Color blueLight200;
  final Color c000000;
  final Color stormGrey50;
  final Color cFFF3F3F3;
  final Color c344054;
  final Color cECFDF3;
  final Color c027A48;
  final Color c0BA5EC;
  final Color c098268;

  //new colors end

  final Color primaryWhite;
  final Color lightBlue50;
  final Color lightBlue100;
  final Color lightBlue200;
  final Color lightBlue300;
  final Color lightBlue400;
  final Color lightBlue500;
  final Color lightBlue600;
  final Color lightBlue700;
  final Color lightBlue800;
  final Color lightBlue900;

  final Color grey50;
  final Color grey100;
  final Color grey200;
  final Color grey300;
  final Color grey400;
  final Color grey500;
  final Color grey600;
  final Color grey700;
  final Color grey800;
  final Color grey900;

  final Color dangerAlert50;
  final Color dangerAlert100;
  final Color dangerAlert200;
  final Color dangerAlert300;
  final Color dangerAlert400;
  final Color dangerAlert500;

  final Color warningAlert50;
  final Color warningAlert100;
  final Color warningAlert200;
  final Color warningAlert300;
  final Color warningAlert400;
  final Color warningAlert500;

  final Color successAlert50;
  final Color successAlert100;
  final Color successAlert200;
  final Color successAlert300;
  final Color successAlert400;
  final Color successAlert500;

  final Color baseColor;
  final Color greyBase;
  final Color bgGrey;
  final Color formColor;
  final Color formBase;
  final Color homeBg;
  final Color cD92D20;
  final Color cDC6803;
  final Color c01261C;
  final Color cC4DBCC;

  const AppColorPalette({
    required this.cC4DBCC,
    required this.primaryColor,
    required this.secondaryColor,
    required this.backgroundColor,
    required this.textColor,
    required this.textColorTwo,
    required this.textColorThree,
    required this.hintTextColor,
    required this.borderColor,
    required this.errorColor,
    required this.cFFFFFF,
    required this.c12B769,
    required this.blueLight200,
    required this.c000000,
    required this.stormGrey50,
    required this.cFFF3F3F3,
    required this.c027A48,
    required this.cECFDF3,
    required this.c344054,
    required this.primaryWhite,
    required this.lightBlue50,
    required this.lightBlue100,
    required this.lightBlue200,
    required this.lightBlue300,
    required this.lightBlue400,
    required this.lightBlue500,
    required this.lightBlue600,
    required this.lightBlue700,
    required this.lightBlue800,
    required this.lightBlue900,
    required this.grey50,
    required this.grey100,
    required this.grey200,
    required this.grey300,
    required this.grey400,
    required this.grey500,
    required this.grey600,
    required this.grey700,
    required this.grey800,
    required this.grey900,
    required this.dangerAlert50,
    required this.dangerAlert100,
    required this.dangerAlert200,
    required this.dangerAlert300,
    required this.dangerAlert400,
    required this.dangerAlert500,
    required this.warningAlert50,
    required this.warningAlert100,
    required this.warningAlert200,
    required this.warningAlert300,
    required this.warningAlert400,
    required this.warningAlert500,
    required this.successAlert50,
    required this.successAlert100,
    required this.successAlert200,
    required this.successAlert300,
    required this.successAlert400,
    required this.successAlert500,
    required this.baseColor,
    required this.greyBase,
    required this.bgGrey,
    required this.formColor,
    required this.formBase,
    required this.homeBg,
    required this.c0BA5EC,
    required this.cD92D20,
    required this.cDC6803,
    required this.c1A73E8,
    required this.c01261C,
    required this.c098268,
  });

  Color get c334155 => Color(0xFF334155);

  Color get c94A3B8 => Color(0xFF94A3B8);

  Color get c6F7D91 => Color(0xFF6F7D91);

  Color get c475569 => Color(0xFF475569);

  Color get c64758B => Color(0xFF64758B);
}

final lightPalette = AppColorPalette(
  cC4DBCC: Color(0xFFC4DBCC),
  c01261C: Color(0xFF01261C),
  c0BA5EC: Color(0xFF0BA5EC),
  c027A48: Color(0xFF027A48),
  cECFDF3: Color(0xFFECFDF3),
  c344054: Color(0xFF344054),
  primaryWhite: StaticColors.primaryWhite,
  lightBlue50: Color(0xFFECF6F9),
  lightBlue100: Color(0xFFDDEFF4),
  lightBlue200: Color(0xFFCDE7EE),
  lightBlue300: Color(0xFFBEE0E9),
  lightBlue400: Color(0xFFA4DEEE),
  lightBlue500: Color(0xFF8ED2E5),
  lightBlue600: Color(0xFF47BCDD),
  lightBlue700: Color(0xFF2194B4),
  lightBlue800: Color(0xFF155D72),
  lightBlue900: Color(0xFF0C252B),
  grey50: Color(0xFFF1F2F4),
  grey100: Color(0xFFDEE2E6),
  grey200: Color(0xFFCCD2D8),
  grey300: Color(0xFFB6C2CD),
  grey400: Color(0xFFA3B2C0),
  grey500: Color(0xFFF0F6FF),
  grey600: Color(0xFF62798F),
  grey700: Color(0xFF475868),
  grey800: Color(0xFF2D3842),
  grey900: Color(0xFF13171A),
  dangerAlert50: Color(0xFFFAEFEB),
  dangerAlert100: Color(0xFFF2D8D0),
  dangerAlert200: Color(0xFFEBC2B4),
  dangerAlert300: Color(0xFFF1A58B),
  dangerAlert400: Color(0xFFEE8D6C),
  dangerAlert500: Color(0xFFE06B44),
  warningAlert50: Color(0xFFFCF5E8),
  warningAlert100: Color(0xFFF9E8CB),
  warningAlert200: Color(0xFFF6DCAF),
  warningAlert300: Color(0xFFFFD286),
  warningAlert400: Color(0xFFFFC666),
  warningAlert500: Color(0xFFFFB434),
  successAlert50: Color(0xFFF3FAEB),
  successAlert100: Color(0xFFE0F0CA),
  successAlert200: Color(0xFFCEF39D),
  successAlert300: Color(0xFFBBEF77),
  successAlert400: Color(0xFFA8EA52),
  successAlert500: Color(0xFF89D624),
  baseColor: Color(0xFFECF6F9),
  greyBase: Color(0xFFEEF2F6),
  bgGrey: Color(0xFFF8F8F8),
  formColor: Color(0xFFEEF2F6),
  formBase: Color(0xFFF2F5F9),
  homeBg: Color(0xFFF1FCFF),
  primaryColor: Color(0xFF19525A),
  secondaryColor: Color(0xFF1C1C1C),
  backgroundColor: Color(0xFFF3F5F6),
  textColor: Color(0xFF101828),
  textColorTwo: Color(0xFF667085),
  textColorThree: Color(0xFF344054),
  hintTextColor: Color(0xFF888888),
  borderColor: Color(0xFFD0D5DD),
  errorColor: Color(0xFFFF0000),
  cFFFFFF: Color(0xFFFFFFFF),
  c12B769: Color(0xFF12B769),
  blueLight200: Color(0xFFB9E6FE),
  c000000: Color(0xFF000000),
  stormGrey50: Color(0xFFF6F7F9),
  cFFF3F3F3: Color(0xFFF3F3F3),
  cD92D20: Color(0xFFD92D20),
  cDC6803: Color(0xFFDC6803),
  c1A73E8: Color(0xFF1A73E8),
  c098268: Color(0xFF098268),
);

final darkPalette = AppColorPalette(
  cC4DBCC: Color(0xFFC4DBCC),
  c01261C: Color(0xFF01261C),
  c0BA5EC: Color(0xFF0BA5EC),
  c027A48: Color(0xFF027A48),
  cECFDF3: Color(0xFFECFDF3),
  c344054: Color(0xFF344054),
  primaryWhite: StaticColors.primaryDark,
  lightBlue50: Color(0xFF08243F),
  lightBlue100: Color(0xFF1A363D),
  lightBlue200: Color(0xFF204049),
  lightBlue300: Color(0xFF244A54),
  lightBlue400: Color(0xFF1F5A6A),
  lightBlue500: Color(0xFF28687A),
  lightBlue600: Color(0xFF03A1CE),
  lightBlue700: Color(0xFF53B3CD),
  lightBlue800: Color(0xFF84C8DB),
  lightBlue900: Color(0xFFBADDE5),
  grey50: Color(0xFF091121),
  grey100: Color(0xFF08243F),
  grey200: Color(0xFF373E44),
  grey300: Color(0xFF404B56),
  grey400: Color(0xFF688BAC),
  grey500: Color(0xFF375E83),
  grey600: Color(0xFF738697),
  grey700: Color(0xFF91A0AE),
  grey800: Color(0xFFAFBAC4),
  grey900: Color(0xFFCED4D9),
  dangerAlert50: Color(0xFF351C12),
  dangerAlert100: Color(0xFF48261B),
  dangerAlert200: Color(0xFF5D3122),
  dangerAlert300: Color(0xFF7E361D),
  dangerAlert400: Color(0xFF953F21),
  dangerAlert500: Color(0xFFB15030),
  warningAlert50: Color(0xFF3A2B0E),
  warningAlert100: Color(0xFF503912),
  warningAlert200: Color(0xFF644816),
  warningAlert300: Color(0xFF85590F),
  warningAlert400: Color(0xFF9C6811),
  warningAlert500: Color(0xFFC08115),
  successAlert50: Color(0xFF253512),
  successAlert100: Color(0xFF384C1D),
  successAlert200: Color(0xFF4C711A),
  successAlert300: Color(0xFF5E8D20),
  successAlert400: Color(0xFF70A826),
  successAlert500: Color(0xFF8BC93A),
  baseColor: Color(0xFF152B32),
  greyBase: Color(0xFF1B242D),
  bgGrey: Color(0xFF1F1F1F),
  formColor: Color(0xFF08243F),
  formBase: Color(0xFF0B2F51),
  homeBg: Color(0xFF031220),
  primaryColor: Color(0xFF19525A),
  secondaryColor: Color(0xFF1C1C1C),
  backgroundColor: Color(0xFFF3F5F6),
  textColor: Color(0xFF101828),
  textColorTwo: Color(0xFF667085),
  textColorThree: Color(0xFF344054),
  hintTextColor: Color(0xFF888888),
  borderColor: Color(0xFFD0D5DD),
  errorColor: Color(0xFFFF0000),
  cFFFFFF: Color(0xFFFFFFFF),
  c12B769: Color(0xFF12B769),
  blueLight200: Color(0xFFB9E6FE),
  c000000: Color(0xFF000000),
  stormGrey50: Color(0xFFF6F7F9),
  cFFF3F3F3: Color(0xFFF3F3F3),
  cD92D20: Color(0xFFD92D20),
  cDC6803: Color(0xFFDC6803),
  c1A73E8: Color(0xFF1A73E8),
  c098268: Color(0xFF098268),
);

@Riverpod(keepAlive: true)
AppColorPalette appColors(ref) {
  final themeMode = ref.watch(appStateProvider.select((s) => s.themeMode));
  return themeMode == ThemeMode.light ? lightPalette : darkPalette;
}
