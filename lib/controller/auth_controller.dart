import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../api/network/api_provider.dart';
import '../routes/health_routes_constant.dart';
import '../view_model/respository_impl/auth_repository_impl.dart';

class AuthController extends GetxController {
  var isPasswordVisible = false.obs;
  var isEditable = false.obs;
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final _authRepository = AuthRepositoryImpl();
  var isLoading = false.obs;
  var isButtonLoading = false.obs;

  void checkValidation() {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Email should not be empty!");
      return;
    } else if (!emailController.text.isEmail) {
      Fluttertoast.showToast(
          msg: "Email is not correct!");
      return;
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password should not be empty!");
      return;
    } else {
      doSafeLogin();
    }
  }

  Future<void> doSafeLogin() async {
    isLoading(true);
    try {
      final loginResponse = await _authRepository.signIn(
          emailController.text, passwordController.text);
      isLoading(false);
      Fluttertoast.showToast(msg: loginResponse!.responseMessage!);
    } on FetchDataException catch (exception) {
      isLoading(false);
      Fluttertoast.showToast(msg: exception.details.toString());
    } on BadRequestException catch (exception) {
      isLoading(false);
      Fluttertoast.showToast(msg: exception.details.toString());
    } on UnauthorisedException catch (exception) {
      isLoading(false);
      Fluttertoast.showToast(msg: exception.message.toString());
    }
  }
}
