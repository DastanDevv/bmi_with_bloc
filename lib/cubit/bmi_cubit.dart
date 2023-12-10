import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(const BmiState());

  void changeGender(bool isMale) {
    emit(state.copyWith(isMale: isMale));
  }

  void changeHeight(double height) {
    emit(state.copyWith(height: height));
  }

  void icrementWeight() {
    emit(state.copyWith(weight: state.weight + 1));
  }

  void decrementWeight() {
    emit(state.copyWith(weight: state.weight - 1));
  }

  void incrementAge() {
    emit(state.copyWith(age: state.age + 1));
  }

  void decrementAge() {
    emit(state.copyWith(age: state.age - 1));
  }

  (String, double, String, Color) calculate() {
    final v = state.weight / ((state.height * state.height) / 10000);
    final result = double.parse(v.toStringAsFixed(1));

    if (result < 18.5) {
      final x = 20 * ((state.height * state.height) / 10000);
      final y = x - state.weight;
      return (
        "Арыксыз",
        result,
        "Сиздин дене салмагыңыз aрык. ${y.roundToDouble()} киллограм салмак кошунуз!\nСураныч кучтуроок тамак жениз :)",
        Colors.red,
      );
    } else if (result >= 18.5 && result < 25) {
      return (
        "Нормалдуусуз",
        result,
        "Сиздин дене салмагыңыз нормалдуу. Азаматсыз!",
        Colors.green,
      );
    } else {
      final x = 24 * ((state.height * state.height) / 10000);
      final y = state.weight - x;
      return (
        "Толуксуз",
        result,
        "Сиздин салмагыныз бир аз ашыкча. Сураныч ${y.roundToDouble()} киллограмга арыктаныз!",
        Colors.red,
      );
    }
  }
}
