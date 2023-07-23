import 'package:flutter/material.dart';

import '../constraints.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: kRoundIconButtonConstraints,
      shape: const CircleBorder(),
      fillColor: kRoundIconButtonColor,
    );
  }
}