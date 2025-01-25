import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_care/const/color.dart';

Widget commonText(
  String text, {
  double size = 12.0,
  Color color = AppColor.black,
  bool isBold = false,
  bool? softWrap,
  FontWeight? fontWeight,
  TextAlign textAlign = TextAlign.left,
  TextDecoration decoration = TextDecoration.none,
  int maxLines = 1000,
  TextOverflow overflow = TextOverflow.ellipsis,
  FontStyle fontStyle = FontStyle.normal,
}) {
  return Text(
    text,
    textAlign: textAlign,
    overflow: overflow,
    softWrap: softWrap,
    maxLines: maxLines,
    style: GoogleFonts.openSans(
      fontSize: size,
      fontWeight: (fontWeight != null)
          ? fontWeight
          : (isBold ? FontWeight.bold : FontWeight.w600),
      color: color,
      decoration: decoration,
      fontStyle: fontStyle,
    ),
  );
}
