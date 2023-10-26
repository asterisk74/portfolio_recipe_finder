import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../delegates/sliver_tabbar_delegate.dart';


class SliverDetails extends StatelessWidget {
  const SliverDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, innerScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              expandedHeight: 250,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Title'),
                background: CachedNetworkImage(
                  imageUrl: '',
                  placeholder: (context, _) {
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorWidget: (context, url, _) {
                    return const Center(child: Icon(Icons.error));
                  },
                  imageBuilder: (_, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: imageProvider,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SliverPersistentHeader(
              floating: false,
              pinned: true,
              delegate: SliverTabBarDelegate(const TabBar(
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.local_grocery_store, size: 20),
                        SizedBox(width: 10),
                        Text('INGREDIENTS')
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.menu_book, size: 20),
                        SizedBox(width: 10),
                        Text('INSTRUCTIONS')
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ];
        },
        body: const TabBarView(
          children: [
            Text('Ing'),
            Text('Ins'),
          ],
        ),
      ),
    );
  }
}
