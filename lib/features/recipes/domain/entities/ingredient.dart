import 'package:equatable/equatable.dart';

class IngredientEntity extends Equatable {
  final int id;
  final String name;
  final String unit;
  final double amount;

  const IngredientEntity({
    required this.id,
    required this.name,
    required this.unit,
    required this.amount,
  });

  @override
  List<Object?> get props => [id, name, amount, unit];
}
