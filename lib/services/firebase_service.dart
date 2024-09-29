import 'package:cloud_firestore/cloud_firestore.dart';

import '../data/model/recipe_model.dart';

Future<void> addRecipe(Recipe recipe) async {
  CollectionReference recipes =
      FirebaseFirestore.instance.collection('recipes');
  await recipes.add(recipe.toJson());
}

