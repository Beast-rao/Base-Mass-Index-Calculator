import 'package:flutter/material.dart';
import '../constraints.dart';

class IconContent extends StatelessWidget {
  final String label;
  final IconData icon;

  const IconContent({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: iconSize,
        ),
        const SizedBox(height: labelIconSpacing),
        Text(
          label.toUpperCase(),
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
