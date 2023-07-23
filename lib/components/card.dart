import 'package:flutter/material.dart';
import '../constraints.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget? child;
  final VoidCallback? onTap;

  const ReusableCard({required this.color, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: const EdgeInsets.all(kCardMargin),
        decoration: BoxDecoration(
          borderRadius:const BorderRadius.all(
            Radius.circular(kCardBorderRadius),
          ),
          color: color,
        ),
      ),
    );
  }
}