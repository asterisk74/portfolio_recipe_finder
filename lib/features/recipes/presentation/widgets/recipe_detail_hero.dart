import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RecipeDetailHero extends StatelessWidget {
  final String image;
  final String? duration;
  final String? size;
  final String? servings;

  const RecipeDetailHero({
    super.key,
    required this.image,
    this.duration,
    this.servings,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: 300,
      placeholder: (context, _) {
        return const Center(child: CircularProgressIndicator());
      },
      errorWidget: (context, url, _) {
        return const Center(child: Icon(Icons.error));
      },
      imageBuilder: (_, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.fill, image: imageProvider),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.bottomRight,
                end: FractionalOffset.topLeft,
                colors: [Colors.black54, Colors.transparent],
                stops: [0, 1],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: RawMaterialButton(
                    onPressed: () => context.pop(),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    elevation: 0,
                    fillColor: Colors.black54.withOpacity(0.3),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    constraints: const BoxConstraints(),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              duration == null ? '' : '$duration mins',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.timer,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              servings == null ? '' : '$servings people',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.people,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              size == null ? '' : '$size g',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.restaurant_menu,
                              size: 15,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
