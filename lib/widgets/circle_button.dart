import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff5C5B5B),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(4),
      ),
      child: Icon(icon, size: 40),
    );
  }
}
