import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/auth_controller.dart';

class LoginView extends GetView<AuthController> {
  LoginView({Key? key}) : super(key: key);
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: controller.loginFormKey,
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Lottie.asset(
                    'animations/login.json',
                    height: MediaQuery.of(context).size.height,
                    repeat: true,
                    reverse: true,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 600.h,
                  child: SingleChildScrollView(
                    reverse: true,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'animations/welcome.json',
                          height: 280.h,
                          width: 280.w,
                          repeat: true,
                          reverse: true,
                          fit: BoxFit.fill,
                        ),
                        TextFormField(
                          controller: mailController,
                          obscureText: false,
                          onSaved: (value) {
                            mailController.text = value!;
                          },
                          validator: (value) {
                            if (mailController.text.isEmpty) {
                              return "Email is required!";
                            }
                            return controller.validateEmail(value!);
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          cursorColor: theme.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 15,
                            ),
                            labelText: "Email",
                            floatingLabelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: theme.hintColor,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: theme.hintColor,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                width: 1,
                                color: theme.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                width: 1,
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25.h),
                        TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          onSaved: (value) {
                            passwordController.text = value!;
                          },
                          validator: (value) {
                            if (passwordController.text.isEmpty) {
                              return "Enter your password!";
                            }
                            return controller.validatePassword(value!);
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          cursorColor: theme.primaryColor,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(
                              top: 20,
                              bottom: 20,
                              left: 15,
                            ),
                            labelText: "Password",
                            floatingLabelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: theme.hintColor,
                            ),
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: theme.hintColor,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                width: 1,
                                color: theme.primaryColor,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6.r),
                              borderSide: BorderSide(
                                width: 1,
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h),
                        SizedBox(
                          width: double.infinity,
                          height: 55.h,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.greenAccent.shade200,
                                  Colors.green.shade300,
                                  Colors.greenAccent.shade400
                                  //add more colors
                                ]),
                                borderRadius: BorderRadius.circular(6.r),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.green, //shadow for button
                                      blurRadius: 6.r) //blur radius of shadow
                                ]),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                ),
                                elevation: MaterialStateProperty.all(0),
                                padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(vertical: 8.h)),
                                textStyle:
                                    theme.elevatedButtonTheme.style?.textStyle,
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.transparent),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.transparent),
                              ),
                              onPressed: () async {
                                await controller.doLogin(mailController.text,
                                    passwordController.text);
                              },
                              child: const Text("Login"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
