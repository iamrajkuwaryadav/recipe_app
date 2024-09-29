import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as path;
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/presentation/recipe/controller/recipe_controller.dart';

import '../../../core/utility/color_constant.dart';
import '../../../core/utility/string.dart';
import '../../../widget/custom_button.dart';
import '../../../widget/custom_text_field.dart';

class AddRecipeScreen extends StatefulWidget {
  Recipe recipe;
  AddRecipeScreen({super.key, required this.recipe});

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _formKeyIngredient = GlobalKey<FormState>();
  RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.btnAddRecipe)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          recipeController.saveData(widget.recipe);
        },
        child: const Text(AppStrings.save),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            CustomTextField.getEditField(
              controller: recipeController.rName,
              hintName: AppStrings.enterRecipe,
              lableText: AppStrings.recipeName,
            ),

            CustomTextField.getEditField(
                controller: recipeController.rDescription,
                maxLines: 2,
                hintName: AppStrings.enterDescription,
                lableText: AppStrings.description),

            CustomTextField.getEditField(
              maxLines: 2,
              controller: recipeController.rInstruction,
              hintName: AppStrings.enterInstruction,
              lableText: AppStrings.instruction,
            ),

            TextButton(
                onPressed: () {
                  pickedImage();
                },
                child: const Text(AppStrings.pickImage)),

            Obx(() => Text("${recipeController.fileName.value}")),

            const SizedBox(
              height: 10,
            ),

            const Divider(),

            CustomButtons.getInstance().getButton(
                context: context,
                text: AppStrings.addIngredient,
                buttonColor: ConstantColor.primaryColor,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    recipeController.clearMethod();
                    addIngredientDialog(context);
                  }
                }),
            widget.recipe.ingredient.isEmpty
                ? const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Text(
                      AppStrings.emptyIngredientMsg,
                      textAlign: TextAlign.center,
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.recipe.ingredient.length,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext contex, int index) {
                      Ingredient data = widget.recipe.ingredient[index];
                      return ListTile(
                        title: Text(data.name!),
                        trailing:
                            Text("${double.parse(data.quantity.toString())}"),
                      );
                    })
            // Add more fields for ingredients and instructions
          ],
        ),
      ),
    );
  }

  addIngredientDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text(AppStrings.addIngredient),
          actions: [
            Form(
              key: _formKeyIngredient,
              child: Column(
                children: [
                  CustomTextField.getEditField(
                    controller: recipeController.inName,
                    hintName: AppStrings.enterIngredient,
                    lableText: AppStrings.ingredientName,
                  ),
                  CustomTextField.getEditField(
                    textInput: TextInputType.number,
                    controller: recipeController.inQuantity,
                    hintName: AppStrings.enterQuantity,
                    lableText: AppStrings.quantity,
                  ),
                  CustomTextField.getEditField(
                    controller: recipeController.inUnit,
                    hintName: AppStrings.enterMeasurement,
                    lableText: AppStrings.measurement,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtons.getInstance().getButton(
                      context: context,
                      text: AppStrings.submit,
                      onTap: () {
                        if (_formKeyIngredient.currentState!.validate()) {
                          Ingredient ingredient = Ingredient();
                          ingredient.name = recipeController.inName.text;
                          ingredient.quantity =
                              double.parse(recipeController.inQuantity.text);
                          ingredient.mesagerment = recipeController.inUnit.text;
                          ingredient.imageUrl = '';
                          widget.recipe.ingredient.add(ingredient);
                          Get.back();
                          setState(() {});
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(AppStrings.msgCheck)));
                        }
                      }),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  pickedImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File files = File(result.files.single.path!);
      String filePath = files.path;
      recipeController.fileName.value = path.basename(filePath);
    } else {
      // User canceled the picker
    }
  }
}
