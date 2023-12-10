import 'package:flutter/material.dart';

import 'circle_button.dart';

class RemoveAddCard extends StatelessWidget {
  const RemoveAddCard({
    super.key,
    required this.text,
    required this.value,
    required this.onPressedRemove,
    required this.onPressedAdd,
  });

  final String text;
  final double value;
  final void Function()? onPressedRemove;
  final void Function()? onPressedAdd;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff0B0120),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
        child: Column(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 26,
                color: Color(0xffCECCD2),
              ),
            ),
            Text(
              '${value.toInt()}',
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleButton(
                  icon: Icons.remove,
                  onPressed: onPressedRemove,
                ),
                CircleButton(
                  icon: Icons.add,
                  onPressed: onPressedAdd,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
