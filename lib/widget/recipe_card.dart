import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/core/utility/string.dart';
import 'package:recipe_app/widget/text_widget.dart';

import '../core/utility/utility.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard(
      {super.key, this.onTap, this.onTapDelete, this.onTapView, this.title
      // required this.farmModel,
      });

  // final Re farmModel;
  final VoidCallback? onTap;
  final VoidCallback? onTapDelete;
  final VoidCallback? onTapView;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: Get.width,
            height: 200,
            child: Stack(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        // width: Get.width,
                        height: 110,
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
                    height: 80,
                    child: Column(
                      children: [
                        TextRegular(
                          title: title ?? "NA",
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  onTapView?.call();
                                },
                                child: const TextRegular(
                                  title: AppStrings.btnView,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextButton(
                                onPressed: () {
                                  onTapDelete?.call();
                                },
                                child: const TextRegular(
                                  title: AppStrings.btnDelete,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
