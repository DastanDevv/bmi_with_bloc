import 'package:bmi_app/cubit/bmi_cubit.dart';
import 'package:bmi_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/gender_card.dart';
import '../widgets/height_card.dart';
import '../widgets/remove_add_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff211834),
      appBar: AppBar(
        backgroundColor: const Color(0xff211834),
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return GenderCard(
                        icon: Icons.male,
                        text: 'MALE',
                        isActive: state.isMale,
                        onTap: () =>
                            context.read<BmiCubit>().changeGender(true),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return GenderCard(
                        icon: Icons.female,
                        text: 'FEMALE',
                        isActive: !state.isMale,
                        onTap: () =>
                            context.read<BmiCubit>().changeGender(false),
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  return HeightCard(
                    value: state.height,
                    onChanged: (v) => context.read<BmiCubit>().changeHeight(v),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return RemoveAddCard(
                        text: 'WEIGHT',
                        value: state.weight,
                        onPressedRemove: () =>
                            context.read<BmiCubit>().decrementWeight(),
                        onPressedAdd: () =>
                            context.read<BmiCubit>().icrementWeight(),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: BlocBuilder<BmiCubit, BmiState>(
                    builder: (context, state) {
                      return RemoveAddCard(
                        text: 'AGE',
                        value: state.age,
                        onPressedRemove: () =>
                            context.read<BmiCubit>().decrementAge(),
                        onPressedAdd: () =>
                            context.read<BmiCubit>().incrementAge(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationButton(
        text: 'CALCULATE',
        onPressed: () {
          final bmi = context.read<BmiCubit>().calculate();
          showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                backgroundColor: const Color(0xff0B0120),
                title: Center(
                  child: Text(
                    bmi.$1,
                    style: TextStyle(
                      fontSize: 30,
                      color: bmi.$4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                content: Text(
                  '${bmi.$2}',
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Text(
                    bmi.$3,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
