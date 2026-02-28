import 'package:antripe/core/helper/ui_helpers.dart';
import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';
import 'package:antripe/features/user/presentation/controllers/user_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key, required this.appColors, required this.data});

  final AppColorPalette appColors;
  final UsersState data;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        UIHelper.verticalSpace(12.sp),
        ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shrinkWrap: true,
          itemCount: data.users.length,
          physics: NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => UIHelper.customDivider(),
          itemBuilder: (context, index) {
            final user = data.users[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(32.r),
                    child: CachedNetworkImage(
                      imageUrl: user.avatarUrl ?? "",
                      width: 48.sp,
                      height: 48.sp,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => ColoredBox(
                        color: appColors.c1A73E8,
                        child: Icon(Icons.error, color: appColors.cECFDF3),
                      ),
                    ),
                  ),
                  UIHelper.horizontalSpace(12.w),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          spacing: 4.w,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            ConstrainedBox(
                              constraints: BoxConstraints(maxWidth: 180.w),
                              child: Text(
                                "${user.name}",
                                overflow: TextOverflow.ellipsis,
                                style: TextFontStyle.text16w500.copyWith(color: appColors.c475569),
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpace(4.sp),
                        Text(user.phone ?? "No phone number", style: TextFontStyle.text14w400.copyWith(color: appColors.c64758B)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
