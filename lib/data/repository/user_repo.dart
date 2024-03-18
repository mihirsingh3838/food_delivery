import 'package:foodie/data/api/api_client.dart';
import 'package:foodie/utils/app_constants.dart';
import 'package:get/get.dart';

class UserRepo {
  UserRepo({required this.apiClient});
  final ApiClient apiClient;

  Future<Response>getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO);
  }
}
