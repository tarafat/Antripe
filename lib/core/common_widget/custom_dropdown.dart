// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';

class MyCustomDropdown extends ConsumerStatefulWidget {
  final String? selectedValue;
  final List<String> dropDownValue;
  final Function(String?)? onTap;
  final double horizonPadding;
  final double verticPadding;
  final String? hinttext;
  final bool isWarning;
  final String? errorText;

  const MyCustomDropdown({
    super.key,
    required this.selectedValue,
    required this.dropDownValue,
    this.horizonPadding = 2,
    this.verticPadding = 0,
    this.hinttext,
    this.onTap,
    this.isWarning = false,
    this.errorText,
  });

  @override
  _MyCustomDropdownState createState() => _MyCustomDropdownState();
}

class _MyCustomDropdownState extends ConsumerState<MyCustomDropdown> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appColors = ref.watch(appColorsProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Focus(
        focusNode: _focusNode,
        child: Column(
          children: [
            Container(
              height: 48.h,
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: widget.horizonPadding.w, vertical: widget.verticPadding),
              decoration: BoxDecoration(
                color: appColors.primaryWhite,
                border: widget.isWarning
                    ? Border.all(color: _focusNode.hasFocus ? appColors.dangerAlert500 : appColors.dangerAlert200, width: 1.5)
                    : Border.all(color: _focusNode.hasFocus ? appColors.borderColor : appColors.grey300, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              child: PopupMenuButton<String>(
                shadowColor: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                menuPadding: EdgeInsets.all(0),
                constraints: BoxConstraints(
                  maxWidth: 1.sw - 32, // Screen width minus padding
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: appColors.borderColor, width: 1.w),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 4,

                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                offset: Offset(13.sp, 52.sp),
                // Control position here
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.selectedValue ?? widget.hinttext!,
                      style: TextStyle(
                        color: widget.selectedValue != null ? appColors.textColor : StaticColors.c8D8D8D,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down, color: appColors.textColorTwo, size: 25.sp),
                  ],
                ),
                itemBuilder: (context) => widget.dropDownValue.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry.value;
                  final isFirst = index == 0;
                  final isLast = index == widget.dropDownValue.length - 1;
                  final isSelected = widget.selectedValue == item || (widget.selectedValue == null && item == widget.dropDownValue[0]);

                  return PopupMenuItem<String>(
                    value: item,
                    padding: EdgeInsets.zero,
                    child: Container(
                      // Add spacing between items
                      decoration: BoxDecoration(
                        color: isSelected ? appColors.backgroundColor : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: isFirst ? Radius.circular(15.r) : Radius.zero,
                          topRight: isFirst ? Radius.circular(15.r) : Radius.zero,
                          bottomLeft: isLast ? Radius.circular(15.r) : Radius.zero,
                          bottomRight: isLast ? Radius.circular(15.r) : Radius.zero,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 32, // Screen width minus padding

                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 20.sp),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(item, style: TextStyle(color: appColors.textColor)),
                            Spacer(),
                            if (isSelected) Icon(Icons.check, color: Colors.green, size: 16.sp),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onSelected: (String newValue) {
                  widget.onTap?.call(newValue);
                  FocusScope.of(context).requestFocus(_focusNode);
                },
              ),
            ),
            if (widget.isWarning && widget.errorText != null)
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(widget.errorText ?? "", style: TextFontStyle.text12w400.copyWith(color: appColors.dangerAlert500)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class MyCustomDropdownTwo extends ConsumerStatefulWidget {
  final String? selectedValue;
  final List<Map<String, String>> dropDownValue;
  final Function(String?)? onTap;
  final double horizonPadding;
  final double verticPadding;
  final String? hinttext;
  final bool isWarning;
  final String? errorText;

  const MyCustomDropdownTwo({
    super.key,
    required this.selectedValue,
    required this.dropDownValue,
    this.horizonPadding = 2,
    this.verticPadding = 0,
    this.hinttext,
    this.onTap,
    this.isWarning = false,
    this.errorText,
  });

  @override
  _MyCustomDropdownTwoState createState() => _MyCustomDropdownTwoState();
}

class _MyCustomDropdownTwoState extends ConsumerState<MyCustomDropdownTwo> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode;
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final appColors = ref.watch(appColorsProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_focusNode);
      },
      child: Focus(
        focusNode: _focusNode,
        child: Column(
          children: [
            Container(
              height: 48.h,
              width: 1.sw,
              padding: EdgeInsets.symmetric(horizontal: widget.horizonPadding.w, vertical: widget.verticPadding),
              decoration: BoxDecoration(
                color: appColors.primaryWhite,
                border: widget.isWarning
                    ? Border.all(color: _focusNode.hasFocus ? appColors.dangerAlert500 : appColors.dangerAlert200, width: 1.5)
                    : Border.all(color: _focusNode.hasFocus ? appColors.borderColor : appColors.grey300, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              child: PopupMenuButton<String>(
                shadowColor: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                menuPadding: EdgeInsets.all(0),
                constraints: BoxConstraints(
                  maxWidth: 1.sw - 32, // Screen width minus padding
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: appColors.borderColor, width: 1.w),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                elevation: 4,

                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                offset: Offset(13.sp, 52.sp),
                // Control position here
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      widget.selectedValue ?? widget.hinttext ?? "",
                      style: TextStyle(
                        color: widget.selectedValue != null ? appColors.textColor : StaticColors.c8D8D8D,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_down, color: appColors.textColor, size: 16.sp),
                  ],
                ),
                itemBuilder: (context) => widget.dropDownValue.asMap().entries.map((entry) {
                  final index = entry.key;
                  final item = entry;
                  final isFirst = index == 0;
                  final isLast = index == widget.dropDownValue.length - 1;
                  final isSelected = widget.selectedValue == item || (widget.selectedValue == null && item == widget.dropDownValue[0]);

                  return PopupMenuItem<String>(
                    value: entry.value.entries.first.value,
                    padding: EdgeInsets.zero,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected ? appColors.backgroundColor : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: isFirst ? Radius.circular(15.r) : Radius.zero,
                          topRight: isFirst ? Radius.circular(15.r) : Radius.zero,
                          bottomLeft: isLast ? Radius.circular(15.r) : Radius.zero,
                          bottomRight: isLast ? Radius.circular(15.r) : Radius.zero,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width - 32, // Screen width minus padding

                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 20.sp),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(entry.value.entries.first.key, style: TextStyle(color: appColors.textColor)),
                            Spacer(),
                            if (isSelected) Icon(Icons.check, color: Colors.green, size: 16.sp),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                onSelected: (String newValue) {
                  log(newValue);
                  widget.onTap?.call(newValue);
                  FocusScope.of(context).requestFocus(_focusNode);
                },
              ),
            ),
            if (widget.isWarning && widget.errorText != null)
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Text(widget.errorText ?? "", style: TextFontStyle.text12w400.copyWith(color: appColors.dangerAlert500)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
