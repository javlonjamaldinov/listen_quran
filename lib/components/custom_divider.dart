
import 'package:flutter/material.dart';
import 'package:listen_quran/content.dart';

class CustomDivider extends StatelessWidget {
  final double thickness;
  final Color color;
  final double horizontalPadding;

  const CustomDivider({
    super.key,
    this.thickness = 1.0,
    this.color = ContentColors.appGrey,
    this.horizontalPadding = 35.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Divider(
        thickness: thickness,
        color: color,
      ),
    );
  }
}
