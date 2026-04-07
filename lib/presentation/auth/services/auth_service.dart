
import '../../../core/constants/api_constant.dart';
import '../../../core/network/api_client.dart';
import '../data/user_model.dart';

class AuthService {
  final ApiClient _apiClient;

  AuthService(this._apiClient);

  Future<(String, UserModel)> login({
    required String email,
    required String password,
  }) async {
    final response = await _apiClient.post(
      ApiConstants.baseUrl + ApiConstants.login,
      {
        "email": email,
        "password": password,
      },
    );

    final token = response["token"];
    final user = UserModel.fromJson(response["user"]);

    return (token as String, user);  }
}