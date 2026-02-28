import 'package:antripe/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/core/router/navigation_service.dart';

/// Contains useful consts to reduce boilerplate and duplicate code
final class UIHelper {
  UIHelper._();
  // Vertical spacing constants. Adjust to your liking.
  static final double _verticalSpaceSmall = 10.0.sp;
  static final double _verticalSpaceMedium = 20.0.sp;
  // ignore: unused_field
  static final double _verticalSpaceMediumLarge = 25.0.sp;
  static final double _verticalSpaceSemiLarge = 40.0.sp;
  static final double _verticalSpaceLarge = 60.0.sp;
  static final double _verticalSpaceExtraLarge = 100.0.sp;

  // Vertical spacing constants. Adjust to your liking.
  static final double _horizontalSpaceSmall = 10.0.sp;
  static final double _horizontalSpaceMedium = 20.0.sp;
  static final double _horizontalSpaceSemiLarge = 40.0.sp;
  static final double _horizontalSpaceLarge = 60.0.sp;

  static Widget verticalSpaceSmall = SizedBox(height: _verticalSpaceSmall);
  static Widget verticalSpaceMedium = SizedBox(height: _verticalSpaceMedium);
  static Widget verticalSpaceMediumLarge = SizedBox(height: _verticalSpaceMediumLarge);
  static Widget verticalSpaceSemiLarge = SizedBox(height: _verticalSpaceSemiLarge);
  static Widget verticalSpaceLarge = SizedBox(height: _verticalSpaceLarge, width: double.infinity);
  static Widget verticalSpaceExtraLarge = SizedBox(height: _verticalSpaceExtraLarge);

  static Widget horizontalSpaceSmall = SizedBox(width: _horizontalSpaceSmall);
  static Widget horizontalSpaceMedium = SizedBox(width: _horizontalSpaceMedium);
  static Widget horizontalSpaceSemiLarge = SizedBox(width: _horizontalSpaceSemiLarge);
  static Widget horizontalSpaceLarge = SizedBox(width: _horizontalSpaceLarge);

  static Widget horizontalSpace(double width) => SizedBox(width: width);
  static Widget verticalSpace(double height) => SizedBox(height: height);

  static double safePadding() => MediaQuery.of(NavigationService.context).padding.top;

  static Widget customDivider({double width = double.infinity, Color color = StaticColors.cCCCCCC}) =>
      Container(height: .8.h, color: color, width: width);
  static Widget customDividerHorizontal({double width = double.infinity, double height = double.infinity, Color color = StaticColors.cF2F2F2}) =>
      Container(height: height, color: color, width: width);
  static double kDefaulutPadding() => 16.sp;
  static double kDefaulutPaddingSmall() => 4.sp;
}
