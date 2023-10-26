import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe_finder/injection_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'delegates/search_food_delegate.dart';
import 'delegates/sliver_searchbar_delegate.dart';
import 'favorites_list.dart';
import 'just_for_you_list.dart';

class SliverHome extends StatelessWidget {
  const SliverHome({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, innerScrolled) {
        return [
          SliverAppBar(
            pinned: true,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
            ),
            leadingWidth: double.maxFinite,
            leading: Row(
              children: [
                const SizedBox(width: 15),
                Text(
                  'RECIPE FINDER',
                  style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          SliverPersistentHeader(
            floating: true,
            delegate: SliverSearchBarDelegate(
              onTap: () => showSearch(
                context: context,
                delegate: SearchFoodDelegate(sl()),
              ),
              placeholder: 'Search foods...',
            ),
          ),
        ];
      },
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 209, 236, 243),
              Color.fromARGB(255, 236, 243, 253),
              Color.fromARGB(255, 159, 199, 225),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            FavoritesList(),
            SizedBox(height: 20),
            JustForYouList(),
          ],
        ),

        // ListView.separated(
        //   padding: EdgeInsets.zero,
        //   itemBuilder: (_, index) {
        //     return Text('$index');
        //   },
        //   separatorBuilder: (_, index) {
        //     return const SizedBox(height: 10);
        //   },
        //   itemCount: 100,
        // ),
      ),
    );
  }
}
