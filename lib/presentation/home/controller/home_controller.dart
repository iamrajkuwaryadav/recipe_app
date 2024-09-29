import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe_model.dart';

class HomeController extends GetxController{



RxList<Recipe> allRecipe= <Recipe>[].obs;
RxList<Recipe> allRecipeFilter= <Recipe>[].obs;
TextEditingController search = TextEditingController();



Future<void> getAllRecipes() async {
  // Reference the Firestore collection
  CollectionReference recipes = FirebaseFirestore.instance.collection('recipes');

  try {
    // Get all documents in the collection
    QuerySnapshot querySnapshot = await recipes.get();

    List<Recipe> recipeList = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      Recipe recipe = Recipe.fromJson(data);
      recipe.sid = doc.id;
      return recipe;
    }).toList();
    allRecipe.value = recipeList;
    allRecipeFilter.value  = allRecipe.value;
    update();
  } catch (e) {
    print("Error fetching recipes: $e");
  }
}

filterRecipe(String text){
  allRecipeFilter.value = allRecipe.where((recipe) {
    return recipe.name!.toLowerCase().contains(text.toLowerCase());
  }).toList();
}


void deleteRecipe(String recipeId) async {
  try {
    // Reference to the Firestore collection 'recipes'
    await FirebaseFirestore.instance
        .collection('recipes')  // Access the 'recipes' collection
        .doc(recipeId)          // Access the document with the specific recipeId
        .delete();              // Delete the document

    print("Recipe deleted successfully.");
    getAllRecipes();
  } catch (e) {
    print("Error deleting recipe: $e");
  }
}



}

