import 'package:cleanarchmvvm/presentation/resources/color_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/font_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/textstyle_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/value_manager.dart';

import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      primaryColor: ColorManager.primaryColor,
      primaryColorLight: ColorManager.primaryOpacityColor,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.primaryOpacityColor,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey1),
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey1,
          elevation: AppSize.ap4),
      appBarTheme: AppBarTheme(
          color: ColorManager.primaryColor,
          centerTitle: true,
          elevation: AppSize.ap4,
          shadowColor: ColorManager.primaryOpacityColor,
          titleTextStyle: getRegularTextStyle(
              color: ColorManager.white, fontSize: FontSizeManager.f16)),
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: ColorManager.grey1,
          buttonColor: ColorManager.primaryColor,
          splashColor: ColorManager.primaryOpacityColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularTextStyle(
                color: ColorManager.white,
              ),
              backgroundColor: ColorManager.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      textTheme: TextTheme(
          headline1: getSemiBoldTextStyle(
              color: ColorManager.darkGrey, fontSize: FontSizeManager.f16),
          subtitle1: getMediumTextStyle(
              color: ColorManager.lightGrey, fontSize: FontSizeManager.f14),
          caption: getRegularTextStyle(color: ColorManager.grey1),
          bodyText1: getRegularTextStyle(color: ColorManager.grey1)),
      inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(PaddingManager.p8),
          hintStyle: getRegularTextStyle(color: ColorManager.grey1),
          labelStyle: getMediumTextStyle(color: ColorManager.darkGrey),
          errorStyle: getRegularTextStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.ap8),
            borderSide:
                BorderSide(color: ColorManager.grey1, width: AppSize.ap1_5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.ap8),
            borderSide: BorderSide(
                color: ColorManager.primaryColor, width: AppSize.ap1_5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.ap8),
            borderSide:
                BorderSide(color: ColorManager.error, width: AppSize.ap1_5),
          )));
}
