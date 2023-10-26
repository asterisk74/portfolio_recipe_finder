import 'package:flutter/material.dart';

class SliverSearchBarDelegate extends SliverPersistentHeaderDelegate {
  final double height = 65;

  final String? placeholder;
  final GestureTapCallback? onTap;

  SliverSearchBarDelegate({this.onTap, this.placeholder});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
        height: height,
        padding: const EdgeInsets.all(8),
        color: Colors.teal,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
              padding: const EdgeInsets.only(left: 23, right: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    placeholder ?? 'Search...',
                    style: TextStyle(fontSize: 16, color: Colors.teal[800]),
                  ),
                  Icon(Icons.search, color: Colors.teal[800])
                ],
              )

              ),
        ));
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
