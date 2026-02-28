import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antripe/core/helper/ui_helpers.dart';
import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';

class ActionButton extends ConsumerStatefulWidget {
  final String name;
  final double? height;
  final double? width;
  final Function? onTap;
  final List<Color> colors;
  final TextStyle? style;
  final bool isBorderSide;
  final Color? borderColor;
  final double? borderRadius;
  final Widget? icon;
  final bool isRight;

  const ActionButton({
    super.key,
    this.onTap,
    required this.name,
    this.height = 56,
    this.width = double.maxFinite,
    this.colors = const [StaticColors.cDBDBDB, StaticColors.cDBDBDB],
    this.style,
    this.isBorderSide = false,
    this.borderRadius,
    this.icon,
    this.borderColor,
    this.isRight = false,
  });

  @override
  ConsumerState<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends ConsumerState<ActionButton> {
  bool _isLoading = false;

  // Method to handle the loading state and call the passed future function
  Future<void> _handleTap() async {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      if (widget.onTap != null) {
        await widget.onTap!(); // Call the future function passed from the parent
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }

    // Display a success message or handle other actions as needed
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(content: Text('Data fetched successfully!')),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final appColors = ref.watch(appColorsProvider);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _isLoading ? () {} : _handleTap,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 6.r),
          border: widget.isBorderSide
              ? Border.all(width: 1.0, color: widget.borderColor ?? appColors.baseColor)
              : Border.all(width: 0.0, color: Colors.transparent),
          gradient: LinearGradient(colors: widget.colors),
        ),
        child: _isLoading
            ? Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 20.sp, height: 20.sp, child: CircularProgressIndicator.adaptive(strokeWidth: 1.5)),
                    SizedBox(width: 10.w),
                    Flexible(
                      child: Text(
                        'Loading...',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: widget.style ?? TextFontStyle.text16w500.copyWith(color: appColors.baseColor),
                      ),
                    ),
                  ],
                ),
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null && !widget.isRight) Row(children: [widget.icon!, UIHelper.horizontalSpaceSmall]),
                    Text(widget.name, style: widget.style ?? TextFontStyle.text16w500.copyWith(color: StaticColors.cFFFFFF)),
                    if (widget.isRight && widget.icon != null)
                      if (widget.icon != null) Row(children: [widget.icon!, UIHelper.horizontalSpaceSmall]),
                  ],
                ),
              ),
      ),
    );
  }
}
