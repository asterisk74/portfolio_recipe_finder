import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:recipe_finder/views/widgets/recipe_list.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Find The Best Recipe",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800, fontSize: 25),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Search box

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8),
                          hintText: 'Search food...',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    RawMaterialButton(
                      onPressed: () {},
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                      ),
                      elevation: 0,
                      fillColor: Colors.teal,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      constraints: const BoxConstraints(),
                      child: const Icon(Icons.tune, color: Colors.white),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // List
              const Expanded(child: RecipeList())
            ],
          ),
        ),
      ),
    );
  }
}
