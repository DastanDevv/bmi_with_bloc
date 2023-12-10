import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final double value;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff0B0120),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 25, 15, 25),
        child: Column(
          children: [
            const Text(
              'HEIGHT',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xffCECCD2),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${value.toInt()}',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'cm',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffCECCD2),
                    height: 2.7,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlider(
                value: value,
                min: 30,
                max: 230,
                activeColor: Colors.white,
                thumbColor: const Color(0xffFF1065),
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
