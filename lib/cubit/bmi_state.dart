part of 'bmi_cubit.dart';

class BmiState {
  const BmiState({
    this.isMale = false,
    this.age = 28,
    this.weight = 60,
    this.height = 180,
  });

  final bool isMale;
  final double height;
  final double weight;
  final double age;

  BmiState copyWith({
    bool? isMale,
    double? height,
    double? weight,
    double? age,
  }) {
    return BmiState(
      isMale: isMale ?? this.isMale,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      age: age ?? this.age,
    );
  }
}
