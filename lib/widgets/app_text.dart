
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class AppText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool multiText;
  final TextAlign? textAlign;
  final TextOverflow overflow;
  final Color? color;
  final bool centered;
  final int? maxLines;
  final double? fontSize;
  final FontStyle? fontStyle;


  AppText.heading1(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.centered = false,
    this.color,
    this.maxLines,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = headingStyle1.copyWith(color: color),
        super(key: key);


  AppText.heading2(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = headingStyle2.copyWith(color: color),
        super(key: key);


  AppText.heading3(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = headingStyle3.copyWith(color: color),
        super(key: key);


  AppText.heading4(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = headingStyle4.copyWith(
          color: color,
          fontSize: fontSize,
        ),
        super(key: key);

  AppText.heading5(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = headingStyle5.copyWith(color: color, fontSize: fontSize),
        super(key: key);


  AppText.heading6(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = headingStyle6.copyWith(color: color),
        super(key: key);


  AppText.body1(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    double? height,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  }) : style = bodyStyle1.copyWith(
          color: color,
          height: height,
          fontSize: fontSize,
        );

  AppText.body2(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    double? height,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  }) : style = bodyStyle2.copyWith(color: color, height: height);

  AppText.caption(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = captionStyle.copyWith(color: color),
        super(key: key);


  AppText.button(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = buttonStyle.copyWith(color: color),
        super(key: key);


  AppText.small(
    this.text, {
    Key? key,
    this.multiText = true,
    this.overflow = TextOverflow.ellipsis,
    this.color,
    this.maxLines,
    this.centered = false,
    this.textAlign,
    this.fontSize,
    this.fontStyle,
  })  : style = small.copyWith(color: color),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: multiText || maxLines != null ? maxLines ?? 9999999999 : 1,
      overflow: overflow,
      textAlign: centered ? TextAlign.center : textAlign ?? TextAlign.left,
      style: style.copyWith(
          color: color ?? Theme.of(context).textTheme.titleMedium!.color!),
    );
  }
}
