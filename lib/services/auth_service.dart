import 'package:dio/dio.dart';
import 'package:todo_test_api/models/token.dart';
import 'package:todo_test_api/models/user.dart';
import 'package:todo_test_api/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final Response response =
            await ApiClient.post("/signup", data: user.toJson());
        print(response.data);
        Token tokenModle = Token.fromJson(response.data);
        return tokenModle.token.toString();
      }
      return "";
    } catch (e) {
      throw e.toString();
    }
  }

  Future signin({required User user}) async {
    try {
      final Response response =
          await ApiClient.post("/signin", data: user.toJson());
      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token;
    } catch (e) {
      throw e.toString();
    }
  }
}
