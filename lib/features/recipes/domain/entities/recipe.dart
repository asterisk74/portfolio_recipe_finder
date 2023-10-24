import 'package:equatable/equatable.dart';

class RecipeEntity extends Equatable {
  final int id;
  final String title;
  final String? summary;
  final String? image;
  final String? imageType;
  final int? servings;
  final int? readyInMinutes;
  final double? spoontacularScore;
  final double? healthScore;

  const RecipeEntity({
    required this.id,
    required this.title,
    this.summary,
    this.image,
    this.imageType,
    this.servings = 1,
    this.readyInMinutes,
    this.spoontacularScore = 0,
    this.healthScore = 0,
  });

  @override
  List<Object?> get props => [id, title, image];
}
