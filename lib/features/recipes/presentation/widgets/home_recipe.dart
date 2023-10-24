import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/recipe.dart';

class HomeRecipe extends StatelessWidget {
  final RecipeEntity recipe;

  const HomeRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.width / 2.2;
    final rating = (((recipe.spoontacularScore ?? 0) / 100) * 100) - 50;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(context, '/food_page');
      },
      child: CachedNetworkImage(
        imageUrl: recipe.image!,
        height: height,
        placeholder: (context, _) {
          return const Center(child: CircularProgressIndicator());
        },
        errorWidget: (context, url, _) {
          return const Center(child: Icon(Icons.error));
        },
        imageBuilder: (context, imageProvider) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: imageProvider,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.black26,
                        Colors.black12,
                        Colors.transparent,
                        Colors.black54
                      ],
                      stops: [0, 0.2, 0.5, 1],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.alarm_on,
                            size: 18,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            recipe.readyInMinutes == null
                                ? '--'
                                : '${recipe.readyInMinutes} mins',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox(height: 10)),
                      RatingBar.builder(
                        initialRating: rating,
                        minRating: 1,
                        itemSize: 17,
                        itemBuilder: (context, _) {
                          return const Icon(Icons.star, color: Colors.white);
                        },
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(height: 5),
                      Text(
                        recipe.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
