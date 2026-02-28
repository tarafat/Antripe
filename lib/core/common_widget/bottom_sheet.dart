import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:antripe/core/helper/ui_helpers.dart';
import 'package:antripe/core/themes/app_colors.dart';

class CommonBottomSheet {
  static Future<T?> show<T>({required BuildContext context, required Widget child, required WidgetRef ref, required TickerProvider vsync}) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: ref.watch(appColorsProvider).primaryWhite,
      transitionAnimationController: AnimationController(vsync: vsync, duration: Duration(milliseconds: 800)),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom, // keyboard safe
          ),
          child: IntrinsicHeight(
            // adjusts height based on children
            child: child,
          ),
        );
      },
    );
  }

  static Future<T?> showWithCloseButton<T>({
    required BuildContext context,
    required Widget child,
    String? title = "",
    required WidgetRef ref,
    required TickerProvider vsync,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      transitionAnimationController: AnimationController(vsync: vsync, duration: Duration(milliseconds: 800)),
      //  showDragHandle: true,
      backgroundColor: ref.watch(appColorsProvider).primaryWhite,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    if (title != null)
                      Padding(
                        padding: EdgeInsets.only(top: 16.sp, left: 24.sp),
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: ref.watch(appColorsProvider).textColor),
                        ),
                      ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Icon(Icons.close, color: ref.watch(appColorsProvider).textColor),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ),
                  ],
                ),
                UIHelper.verticalSpaceSmall,
                UIHelper.customDivider(),
                UIHelper.verticalSpaceSmall,
                Flexible(child: IntrinsicHeight(child: child)),
              ],
            ),
          ),
        );
      },
    );
  }
}
