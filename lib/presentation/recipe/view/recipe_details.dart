import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/data/model/recipe_model.dart';

import '../../../core/utility/string.dart';
import '../../../core/utility/utility.dart';
import '../../../widget/text_style.dart';
import '../../../widget/text_widget.dart';

class RecipeDetails extends StatelessWidget {
  Recipe recipe;
  RecipeDetails({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.lblRecipeDetails),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: 150,
                          child: Image.asset(
                            recipeImg,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 10,
                    child: SizedBox(
                      height: 45,
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            recipe.name ?? "",
                            style: AppTextStyles.heading2Style,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            SizedBox(
              width: Get.width,
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const TextRegular(
                      title: "${AppStrings.description} :",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextRegular(
                      title: recipe.description ?? "",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextRegular(
                      title: "${AppStrings.instruction} :",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextRegular(
                      title: recipe.instruction ?? "",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TextRegular(
                      title: "${AppStrings.ingredientLable} :",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    recipe.ingredient.isEmpty
                        ? const Text(AppStrings.emptyIngredientMsg)
                        : ListView.builder(
                            itemCount: recipe.ingredient.length,
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            itemBuilder: (BuildContext contex, int index) {
                              Ingredient data = recipe.ingredient[index];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(Icons.play_arrow),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          TextRegular(
                                            title: data.name! ?? "",
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextRegular(
                                        title:
                                            "${data.quantity}/${data.mesagerment}  " ??
                                                "",
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
