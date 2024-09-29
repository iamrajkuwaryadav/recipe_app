import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/core/utility/string.dart';
import 'package:recipe_app/data/model/recipe_model.dart';
import 'package:recipe_app/widget/text_widget.dart';

import '../../../core/utility/color_constant.dart';
import '../../../widget/recipe_card.dart';
import '../../recipe/view/add_recipe_screen.dart';
import '../../recipe/view/recipe_details.dart';
import '../controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    homeController.getAllRecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.lblHome),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text(AppStrings.btnAddRecipe, textAlign: TextAlign.center),
        onPressed: () {
          Get.to(() => AddRecipeScreen(recipe: Recipe(ingredient: [])));
        },
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: homeController.search,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ConstantColor.primaryColor),
                ),
                labelText: AppStrings.search,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 16.0,
                ),
              ),
              onChanged: (v) {
                homeController.filterRecipe(v);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: Obx(
              () => GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 258,
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 30),
                  physics: const BouncingScrollPhysics(),
                  itemCount: homeController.allRecipeFilter.length,
                  itemBuilder: (context, index) {
                    return RecipeCard(
                      title: homeController.allRecipeFilter[index].name,
                      onTapView: () {
                        Get.to(
                          () => RecipeDetails(
                            recipe: homeController.allRecipeFilter[index],
                          ),
                        );
                      },
                      onTapDelete: () {
                        askConfirmationDialog(
                            homeController.allRecipeFilter[index].sid!);
                      },
                      onTap: () {
                        Get.to(
                          () => RecipeDetails(
                            recipe: homeController.allRecipeFilter[index],
                          ),
                        );
                      },
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }

  askConfirmationDialog(String sId) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(AppStrings.deleteMsg),
          actions: <Widget>[
            TextButton(
              child: const TextRegular(title:AppStrings.btnYes),
              onPressed: () {
                homeController.deleteRecipe(sId);
                Get.back();
              },
            ),
            TextButton(
              child: const TextRegular(title:AppStrings.btnNo),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
