import 'package:foodie/data/repository/user_repo.dart';
import 'package:foodie/models/response_model.dart';
import 'package:foodie/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  UserController({required this.userRepo});
  final UserRepo userRepo;

  bool _isloading = false;
  late UserModel _userModel;
  UserModel get userModel => _userModel;
  bool get isloading => _isloading;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isloading = true;
      responseModel = ResponseModel(true, "successfully");
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isloading = false;
    update();
    return responseModel;
  }
}
