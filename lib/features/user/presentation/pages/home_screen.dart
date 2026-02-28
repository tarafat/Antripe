import 'dart:developer';

import 'package:antripe/core/common_widget/action_button.dart';
import 'package:antripe/core/common_widget/bottom_sheet.dart';
import 'package:antripe/core/common_widget/custom_dropdown.dart';
import 'package:antripe/core/constants/app_strings.dart';
import 'package:antripe/core/helper/ui_helpers.dart';
import 'package:antripe/core/themes/app_colors.dart';
import 'package:antripe/core/themes/text_font_style.dart';
import 'package:antripe/features/user/domain/entities/category.dart';
import 'package:antripe/features/user/presentation/controllers/category_controller.dart';
import 'package:antripe/features/user/presentation/controllers/header_select_contoller.dart';
import 'package:antripe/features/user/presentation/controllers/relation_controller.dart';
import 'package:antripe/features/user/presentation/controllers/user_controller.dart';
import 'package:antripe/features/user/presentation/pages/widget/contact_list.dart';
import 'package:antripe/features/user/presentation/pages/widget/custom_text_feild.dart';
import 'package:antripe/features/user/presentation/pages/widget/header.dart';
import 'package:antripe/features/user/presentation/pages/widget/search.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> with TickerProviderStateMixin {
  String _countyCode = "+1";

  @override
  Widget build(BuildContext context) {
    final userController = ref.watch(usersControllerProvider);
    final categoryController = ref.watch(categoryControllerProvider);
    final appColors = ref.watch(appColorsProvider);
    final selectedTab = ref.watch(contactTabControllerProvider);

    // Initialize controller

    return Scaffold(
      backgroundColor: appColors.cFFFFFF,
      floatingActionButton: addContract(context, appColors, SvgPicture.asset('assets/icons/floating_icon.svg', height: 100.sp, width: 100.sp)),

      body: RefreshIndicator(
        onRefresh: () async {
          return ref.invalidate(usersControllerProvider);
        },
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              if (selectedTab == "search") searchbar(ref, context),
              if (selectedTab != "search") Header(ref: ref, selectedTab: selectedTab, appColors: appColors),

              categoryController.when(
                data: (categories) => filterWidget(categories, appColors),
                loading: () => Center(child: CircularProgressIndicator(color: appColors.c098268)),
                error: (error, stackTrace) => Center(child: Text("Error loading categories")),
              ),
              userController.when(
                data: (data) {
                  if (data.users.isEmpty) {
                    return noContactFound(appColors, context);
                  }
                  return ContactList(appColors: appColors, data: data);
                },

                loading: () => SizedBox(
                  height: 500.sp,
                  child: Center(child: CircularProgressIndicator(color: appColors.c098268)),
                ),
                error: (error, stackTrace) => Center(child: Text("Error: $error")),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container noContactFound(AppColorPalette appColors, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.sp),
      decoration: BoxDecoration(color: appColors.grey500, borderRadius: BorderRadius.circular(8.r)),
      height: 200.sp,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: .5.sw,
            child: Center(
              child: Text(
                "Ee! No Contacts found.",
                textAlign: TextAlign.center,
                style: TextFontStyle.text20w500.copyWith(color: appColors.grey900),
              ),
            ),
          ),
          UIHelper.verticalSpace(15.sp),
          addContract(
            context,
            appColors,
            Container(
              width: .6.sw,
              height: 50.sp,
              decoration: BoxDecoration(color: appColors.c098268, borderRadius: BorderRadius.circular(30.r)),
              child: Center(
                child: Text("Add New Contact", style: TextFontStyle.text14w400.copyWith(color: appColors.cFFFFFF)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container filterWidget(List<Category> categories, AppColorPalette appColors) {
    return Container(
      height: 80.sp,
      margin: EdgeInsets.symmetric(vertical: 12.sp),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (context, index) => UIHelper.horizontalSpace(12.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              ref.read(usersControllerProvider.notifier).selectCategory(MapEntry(category.id.toString(), category.name ?? ""));
            },
            child: Consumer(
              builder: (context, ref, child) {
                final selectedCategory = ref.watch(
                  usersControllerProvider.select((state) => state.maybeWhen(data: (users) => users.selectedCategory, orElse: () => null)),
                );

                final isSelected = selectedCategory?.key == category.id.toString();

                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80.r),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80.r),
                          border: Border.all(color: isSelected ? appColors.c098268 : Colors.transparent, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(75.r),
                          child: Container(
                            width: 50.sp,
                            height: 50.sp,
                            color: appColors.grey400,
                            child: Center(
                              child: Text(
                                category.name != null && category.name!.isNotEmpty ? category.name![0].toUpperCase() : "?",

                                style: TextFontStyle.text14w400.copyWith(color: appColors.cFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 50.sp,
                      child: Text(
                        category.name ?? "",
                        textAlign: TextAlign.center,
                        style: TextFontStyle.text14w400.copyWith(
                          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? appColors.c098268 : appColors.c6F7D91,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  GestureDetector addContract(BuildContext context, AppColorPalette appColors, Widget child) {
    return GestureDetector(
      onTap: () async {
        CommonBottomSheet.show(
          vsync: this,
          ref: ref,
          context: context,
          child: SafeArea(
            child: SizedBox(
              height: 0.6.sh,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 16.sp),
                  child: Form(
                    //    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          fillColor: appColors.cFFFFFF,
                          isBorder: true,
                          borderColor: appColors.borderColor,
                          isPrefixIcon: false,
                          hintText: 'Name',
                        ),
                        UIHelper.verticalSpaceSmall,
                        UIHelper.verticalSpace(4),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: .91.sw,
                              height: 52.sp,
                              child: CustomTextFormField(
                                prefixIcon: CountryCodePicker(
                                  flagDecoration: const BoxDecoration(
                                    shape: BoxShape.circle, // Makes it perfectly circular
                                  ),
                                  flagWidth: 60, // Important to keep circle shape consistent
                                  onChanged: (value) {
                                    setState(() {
                                      _countyCode = value.dialCode!;
                                    });
                                  },
                                  textStyle: TextFontStyle.text16w400.copyWith(color: appColors.textColor),
                                  initialSelection: _countyCode,
                                  showCountryOnly: false,
                                  showOnlyCountryWhenClosed: false,
                                  alignLeft: false,
                                ),
                                fillColor: appColors.cFFFFFF,
                                isBorder: true,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                //controller: phoneController,
                                isPrefixIcon: true,
                                //  iconpath: Assets.icons.homeSvg,
                                borderRadius: 10.r,
                                hintText: 'Phone Number',
                                borderColor: appColors.borderColor,
                              ),
                            ),
                          ],
                        ),
                        UIHelper.verticalSpaceSmall,
                        UIHelper.verticalSpace(4),
                        CustomTextFormField(
                          fillColor: appColors.cFFFFFF,
                          isBorder: true,
                          borderColor: appColors.borderColor,
                          isPrefixIcon: false,
                          hintText: 'Desgination',
                        ),
                        UIHelper.verticalSpaceSmall,
                        UIHelper.verticalSpace(4),
                        CustomTextFormField(
                          fillColor: appColors.cFFFFFF,
                          isBorder: true,
                          borderColor: appColors.borderColor,
                          isPrefixIcon: false,
                          hintText: 'Company',
                          textInputAction: TextInputAction.newline,
                          keyboardType: TextInputType.multiline,
                        ),
                        UIHelper.verticalSpaceMedium,
                        UIHelper.verticalSpace(4),
                        Consumer(
                          builder: (context, ref, child) {
                            final language = ref.watch(relationControllerProvider);

                            return MyCustomDropdown(
                              verticPadding: 0,
                              horizonPadding: 12,
                              selectedValue: relationMap.entries
                                  .firstWhere(
                                    (entry) =>
                                        entry.key.toLowerCase() == (language).toString().toLowerCase() ||
                                        entry.value.toLowerCase() == (language).toString().toLowerCase(),
                                    orElse: () => const MapEntry('', ''),
                                  )
                                  .value,

                              dropDownValue: relationMap.entries.map((e) => e.value).toList(),
                              hinttext: 'Select Relation',
                              onTap: (value) {
                                ref.read(relationControllerProvider.notifier).updateSelectedRelation(value!);

                                log('Selected relation: $value');
                              },
                            );
                          },
                        ),
                        UIHelper.verticalSpaceMedium,
                        ActionButton(
                          name: 'Save Contract',
                          height: 45.h,
                          onTap: () async {
                            Navigator.of(context).pop();
                          },
                          isBorderSide: true,
                          colors: [appColors.c098268, appColors.c098268],
                          borderRadius: 30.r,
                          borderColor: appColors.borderColor,
                          style: TextStyle(color: appColors.cFFFFFF, fontSize: 12.sp, fontWeight: FontWeight.w400),
                        ),
                        UIHelper.verticalSpaceSmall,
                        ActionButton(
                          name: 'Cancel',
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
                ),
              ),
            ),
          ),
        );
      },
      child: child,
    );
  }
}
