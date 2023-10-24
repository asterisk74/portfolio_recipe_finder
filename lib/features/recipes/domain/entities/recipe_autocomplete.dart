import 'package:equatable/equatable.dart';

class RecipeAutoCompleteEntity extends Equatable {
  final int id;
  final String title;

  const RecipeAutoCompleteEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}
