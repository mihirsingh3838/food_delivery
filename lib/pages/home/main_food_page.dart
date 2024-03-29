//Creating home page for the app

import 'package:flutter/material.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/pages/home/food_page_body.dart';
import 'package:foodie/utils/colors.dart';
import 'package:foodie/utils/dimensions.dart';
import 'package:foodie/widgets/big_text.dart';
import 'package:foodie/widgets/small_text.dart';
import 'package:get/get.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductCotroller>().getPopularProductList();
    await Get.find<RecommendedProductCotroller>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _loadResource,
        child: Column(
          children: [
            Container(
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                margin: EdgeInsets.only(
                    top: Dimensions.height45, bottom: Dimensions.height15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: 'India', color: AppColors.mainColor),
                        const Row(
                          children: [
                            SmallText(
                              text: 'Allahabad',
                              color: Colors.black54,
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: Colors.blue,
                        ),
                        child: Icon(
                          Icons.search,
                          color: AppColors.mainColor,
                          size: Dimensions.iconSize24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: FoodPageBody(),
              ),
            ),
          ],
        ));
  }
}
