import 'package:flutter/material.dart';
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/pages/auth/sign_up_page.dart';
// import 'package:foodie/pages/cart/cart_page.dart';
// import 'package:foodie/pages/food/popular_food_details.dart';
// import 'package:foodie/pages/food/recomended_food_details.dart';
import 'package:foodie/pages/home/main_food_page.dart';
import 'package:foodie/routes/route_helper.dart';
import 'package:get/get.dart';
import "package:foodie/helper/dependencies.dart" as dep;

import 'pages/auth/sign_in_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductCotroller>(builder: (_) {
      return GetBuilder<RecommendedProductCotroller>(builder: (_) {
        return GetMaterialApp(
          //Use GetMaterial App instead of material app to use getx package
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //home: const SignInPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
