import 'package:foodie/controllers/auth_controller.dart';
import 'package:foodie/controllers/cart_controller.dart';
import 'package:foodie/controllers/popular_product_controller.dart';
import 'package:foodie/controllers/recommended_product_controller.dart';
import 'package:foodie/controllers/user_controller.dart';
import 'package:foodie/data/api/api_client.dart';
import 'package:foodie/data/repository/auth_repo.dart';
import 'package:foodie/data/repository/cart_repo.dart';
import 'package:foodie/data/repository/popular_product_repo.dart';
import 'package:foodie/data/repository/recommended_product_repo.dart';
import 'package:foodie/data/repository/user_repo.dart';
import 'package:foodie/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(
      () => UserRepo (apiClient: Get.find()));


  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductCotroller(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductCotroller(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
