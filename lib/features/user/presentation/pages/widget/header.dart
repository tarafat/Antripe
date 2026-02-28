import 'package:antripe/core/helper/ui_helpers.dart';
import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';
import 'package:antripe/features/user/presentation/controllers/header_select_contoller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.ref, required this.selectedTab, required this.appColors});

  final WidgetRef ref;
  final String selectedTab;
  final AppColorPalette appColors;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => ref.read(contactTabControllerProvider.notifier).changeTab("contacts"),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Contacts", style: TextFontStyle.text16w500.copyWith(color: selectedTab == "contacts" ? appColors.c334155 : appColors.c94A3B8)),
                SizedBox(height: 4.h),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 2,
                  width: 80.w,
                  color: selectedTab == "contacts" ? appColors.c098268 : Colors.transparent,
                ),
              ],
            ),
          ),

          UIHelper.horizontalSpace(16.w),

          GestureDetector(
            onTap: () => ref.read(contactTabControllerProvider.notifier).changeTab("recent"),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Recent", style: TextFontStyle.text16w500.copyWith(color: selectedTab == "recent" ? appColors.primaryColor : appColors.c94A3B8)),
                SizedBox(height: 4.h),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 2,
                  width: 60.w,
                  color: selectedTab == "recent" ? appColors.c098268 : Colors.transparent,
                ),
              ],
            ),
          ),

          const Spacer(),

          GestureDetector(
            onTap: () => ref.read(contactTabControllerProvider.notifier).changeTab("search"),
            child: SvgPicture.asset('assets/icons/search.svg', height: 18.sp, width: 20.sp),
          ),
          UIHelper.horizontalSpace(15.w),
          SvgPicture.asset('assets/icons/drawer.svg', height: 25.sp, width: 20.sp),
        ],
      ),
    );
  }
}
