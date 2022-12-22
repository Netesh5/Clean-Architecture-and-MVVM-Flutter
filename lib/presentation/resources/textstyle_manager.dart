import 'package:cleanarchmvvm/presentation/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle _textStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

TextStyle getRegularTextStyle(
    {double fontSize = FontSizeManager.f12, required Color color}) {
  return _textStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.regular, color);
}

TextStyle getLightTextStyle(
    {double fontSize = FontSizeManager.f12, required Color color}) {
  return _textStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.light, color);
}

TextStyle getBoldTextStyle(
    {double fontSize = FontSizeManager.f12, required Color color}) {
  return _textStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.bold, color);
}

TextStyle getSemiBoldTextStyle(
    {double fontSize = FontSizeManager.f12, required Color color}) {
  return _textStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.semiBold, color);
}

TextStyle getMediumTextStyle(
    {double fontSize = FontSizeManager.f12, required Color color}) {
  return _textStyle(
      fontSize, FontConstant.fontFamily, FontWeightManager.medium, color);
}
