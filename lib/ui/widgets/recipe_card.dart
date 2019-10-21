import 'package:duration/duration.dart';
import 'package:flutter/material.dart';

import 'package:recipes_app/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final bool inFavourites;
  final Function onFavouriteButtonPressed;

  RecipeCard(
      {@required this.recipe,
      @required this.inFavourites,
      @required this.onFavouriteButtonPressed});
  @override
  Widget build(BuildContext context) {
    RawMaterialButton _buildFavouriteButton() {
      return RawMaterialButton(
        constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
        onPressed: () => onFavouriteButtonPressed(recipe.id),
        child: Icon(
          inFavourites == true ? Icons.favorite : Icons.favorite_border,
        ),
        elevation: 2,
        fillColor: Colors.white,
        shape: CircleBorder(),
      );
    }

    Padding _buildTitleSection() {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              recipe.name,
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Icon(Icons.timer, size: 20),
                SizedBox(width: 5),
                Text(
                  prettyDuration(recipe.duration),
                )
              ],
            )
          ],
        ),
      );
    }

    return GestureDetector(
      onTap: () => print('Tapped'),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      recipe.imageURL,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    child: _buildFavouriteButton(),
                    top: 2,
                    right: 2,
                  ),
                ],
              ),
              _buildTitleSection(),
            ],
          ),
        ),
      ),
    );
  }
}
