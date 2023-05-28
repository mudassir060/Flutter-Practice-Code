import 'package:flutter/material.dart';

Widget TextWidget({
  required String title,
  required double size,
  FontWeight? fontWeight,
  dynamic maxline,
  dynamic color,
  dynamic textAlign,
}) {
  return Text(
    title.toString(),
    maxLines: maxline ?? 1,
    textAlign: textAlign ?? TextAlign.start,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? Colors.black,
    ),
  );
}
