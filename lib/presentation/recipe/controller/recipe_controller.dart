import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/recipe_model.dart';
import '../../../services/firebase_service.dart';
import '../../home/controller/home_controller.dart';

class RecipeController extends GetxController{
  HomeController homeController = Get.find<HomeController>();

  TextEditingController inName = TextEditingController();
  TextEditingController inQuantity = TextEditingController();
  TextEditingController inUnit = TextEditingController();

  TextEditingController rName = TextEditingController();
  TextEditingController rInstruction = TextEditingController();
  TextEditingController rDescription = TextEditingController();
  RxString fileName ="".obs;

  void clearMethod() {
    inName.clear();
    inQuantity.clear();
    inUnit.clear();

  }

  void saveData(Recipe data) {
    if(data.name != null || data.ingredient.isNotEmpty){
      data.name = rName.text;
      data.description = rDescription.text;
      data.instruction = rInstruction.text;
      data.imageUrl = "imageUrl";
      debugPrint("Json Data => ${jsonEncode(data)}");
      addRecipe(data);
      homeController.getAllRecipes();
      Get.back();
      update();
    }

  }



}