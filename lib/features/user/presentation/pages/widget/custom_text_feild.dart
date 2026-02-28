// ignore_for_file: library_private_types_in_public_api

import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends ConsumerStatefulWidget {
  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  final bool isPrefixIcon;
  final double borderRadius;
  final VoidCallback? onSuffixIconTap;
  final String? iconpath;
  final int maxline;
  final int minline;
  final bool readOnly;
  final bool isBorder;
  final bool? focus;
  final TextAlign? textAlign;
  final Color fillColor;
  final bool isSuffixBer;
  final TextInputAction textInputAction;
  final bool isPadding;
  final int? maxLength;
  final FocusNode? externalFocusNode;
  final Color? textStyleColor;
  final Color? borderColor;

  const CustomTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.borderRadius = 12.0,
    required this.isPrefixIcon,
    this.iconpath,
    this.onSuffixIconTap,
    this.readOnly = false,
    this.maxline = 1,
    this.maxLength,
    this.isBorder = false,
    this.fillColor = StaticColors.eEF2F6,
    this.onTap,
    this.inputFormatters,
    this.suffixWidget,
    this.minline = 1,
    this.textAlign = TextAlign.start,
    this.focus = false,
    this.isSuffixBer = true,
    this.textInputAction = TextInputAction.done,
    this.isPadding = false,
    this.externalFocusNode,
    this.textStyleColor,
    this.borderColor,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends ConsumerState<CustomTextFormField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  BorderSide _borderSide(double width) {
    return widget.borderColor != null ? BorderSide(color: widget.borderColor!, width: width) : BorderSide.none;
  }

  @override
  Widget build(BuildContext context) {
    final appColors = ref.watch(appColorsProvider);
    return TextFormField(
      enabled: !widget.readOnly,
      textInputAction: widget.textInputAction,
      autofocus: widget.focus!,
      textAlign: widget.textAlign!,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly,
      maxLines: widget.maxline,
      minLines: widget.minline,
      focusNode: widget.externalFocusNode ?? _focusNode,
      maxLength: widget.maxLength,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      validator: widget.validator,
      onTap: widget.onTap,
      cursorColor: appColors.lightBlue600,
      style: TextFontStyle.text16w400.copyWith(color: widget.textStyleColor ?? appColors.textColor),
      decoration: InputDecoration(
        errorMaxLines: 2,
        alignLabelWithHint: true,
        //labelText: widget.labelText,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        labelStyle: TextFontStyle.text14w400.copyWith(color: _isFocused ? appColors.lightBlue600 : StaticColors.c8D8D8D),
        hintText: widget.hintText,
        hintStyle: TextFontStyle.text14w400.copyWith(color: StaticColors.c475569),
        filled: true,
        fillColor: widget.readOnly
            ? Color(0xFFF5F5F5)
            : _isFocused
            ? Colors.transparent
            : widget.fillColor,
        prefixIcon: widget.isPrefixIcon && widget.iconpath != null
            ? Padding(
                padding: EdgeInsets.only(left: 20.w, right: 12.w),
                child: Image.asset(widget.iconpath!, color: _isFocused ? appColors.lightBlue600 : StaticColors.c8D8D8D),
              )
            : widget.prefixIcon,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: widget.onSuffixIconTap,
                child: Padding(
                  padding: EdgeInsets.only(right: 4.sp),
                  child: Icon(widget.suffixIcon, color: appColors.lightBlue900),
                ),
              )
            : widget.suffixWidget,
        // Borders: only show when borderColor is provided. Focused border uses same color.
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius), borderSide: _borderSide(1.2)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius), borderSide: _borderSide(1.2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: appColors.grey400, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: appColors.primaryColor, width: 1.5),
        ),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(widget.borderRadius), borderSide: _borderSide(1.0)),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 14.sp),
      ),
    );
  }
}

class CustomTitle extends StatelessWidget {
  const CustomTitle({super.key, required this.title, this.isRequire = false});

  final String title;
  final bool isRequire;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: title, style: TextFontStyle.text16w500),
          if (isRequire)
            TextSpan(
              text: "*",
              style: TextFontStyle.text16w500.copyWith(color: StaticColors.cD92C20),
            ),
        ],
      ),
    );
  }
}
