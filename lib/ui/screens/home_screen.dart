import 'package:flutter/material.dart';

import 'package:recipes_app/utils/store.dart';
import 'package:recipes_app/models/recipe.dart';
import 'package:recipes_app/ui/widgets/recipe_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> recipes = getRecipes();
  List<String> userFavourites = getFavoritesIDs();

  void _favouritesHandler(String recipeID) {
    setState(() {
      if (userFavourites.contains(recipeID)) {
        userFavourites.remove(recipeID);
      } else {
        userFavourites.add(recipeID);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Padding _buildRecipes(List<Recipe> recipesList) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: recipesList.length,
                itemBuilder: (BuildContext context, index) {
                  return RecipeCard(
                    recipe: recipesList[index],
                    inFavourites:
                        userFavourites.contains(recipesList[index].id),
                    onFavouriteButtonPressed: _favouritesHandler,
                  );
                },
              ),
            )
          ],
        ),
      );
    }

    double _iconSize = 20;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 2,
            bottom: TabBar(
              labelColor: Colors.blueGrey,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.restaurant, size: _iconSize)),
                Tab(icon: Icon(Icons.local_drink, size: _iconSize)),
                Tab(icon: Icon(Icons.favorite, size: _iconSize)),
                Tab(icon: Icon(Icons.settings, size: _iconSize)),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: TabBarView(
            children: <Widget>[
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.food)
                  .toList()),
              _buildRecipes(recipes
                  .where((recipe) => recipe.type == RecipeType.drink)
                  .toList()),
              _buildRecipes(recipes
                  .where((recipe) => userFavourites.contains(recipe.id))
                  .toList()),
              Center(child: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }
}
