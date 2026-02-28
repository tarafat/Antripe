import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';
import 'package:antripe/core/utils/debounceer.dart';
import 'package:antripe/core/utils/keyboard.dart';
import 'package:antripe/features/user/presentation/controllers/header_select_contoller.dart';
import 'package:antripe/features/user/presentation/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget searchbar(WidgetRef ref, BuildContext context) {
  return Container(
    width: .8.sw,
    height: 48.sp,
    padding: EdgeInsets.symmetric(horizontal: 16.sp),
    child: TextFormField(
      autofocus: false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter text';
        }
        return null;
      },
      cursorColor: StaticColors.cStroke,
      cursorHeight: 15.sp,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      onTapOutside: (event) {
        KeyboardUtil.hideKeyboard(context);
      },

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: StaticColors.cStroke, width: .05.sp),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: StaticColors.c000000, width: .2.sp),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.sp),
          borderSide: BorderSide(color: StaticColors.cStroke, width: .05.sp),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: .5.sp, vertical: 15.sp),

        suffixIcon:
            // ref.watch(usersControllerProvider).searchController.text.isNotEmpty
            //     ?
            IconButton(
              icon: Icon(Icons.clear, size: 20.sp, color: StaticColors.c000000),
              onPressed: () {
                ref.read(contactTabControllerProvider.notifier).changeTab("recent");
                ref.read(usersControllerProvider.notifier).search("");
              },
            ),
        //  : null,
        fillColor: StaticColors.transparent,
        filled: true,
        hintText: "Search",
        hintStyle: TextFontStyle.text16w400.copyWith(color: StaticColors.c94A3B8),
      ),
      onChanged: (value) {
        Debouncer(milliseconds: 1000).run(() {
          ref.read(usersControllerProvider.notifier).search(value);
        });
      },
    ),
  );
}
