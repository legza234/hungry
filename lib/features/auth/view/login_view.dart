import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/features/auth/view/singup_veiw.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_field.dart';

import '../../../core/constants/app_color.dart';
import '../../../core/network/api_error.dart';
import '../../../root.dart' show Root;
import '../data/auth_repo.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;

  AuthRepo authRepo = AuthRepo();
  //login
  Future<void> login() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    try {
      final user = await authRepo.login(
          emailController.text.trim(), passwordController.text.trim());
      if (user.token != null) {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (c) => const Root()),
        );
      }
    } catch (e) {
      String errorMsg = 'An error occurred';
      if (e is ApiError) {
        errorMsg = e.message;
      }
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColor.Primru,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Gap(100),
                    SvgPicture.asset("assets/Hungry_.svg"),
                    const Gap(10),
                    const CustomText(
                      text: "Welcome back",
                      color: Colors.white,
                      weight: FontWeight.w500,
                      size: 14,
                    ),
                    const Gap(70),
                    CustomTextField(
                      hint: "Email Address",
                      controller: emailController,
                      ispassward: false,
                    ),
                    const Gap(20),
                    CustomTextField(
                      hint: "Password",
                      ispassward: true,
                      controller: passwordController,
                    ),
                    const Gap(40),
                    GestureDetector(
                      onTap: login,
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        width: double.infinity,
                        child: Center(
                          child: CustomText(
                            text: 'Login',
                            color: AppColor.Primru,
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    // زر Sign Up
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>  SignUpView()), // صفحة التسجيل
                        );
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child:  Center(
                          child: CustomText(
                            text: 'Sign Up',
                            color: Colors.white,
                            size: 20,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Root()), // صفحة التسجيل
                        );
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        child: const Center(
                          child: CustomText(
                            text: 'Continue as guest?',
                            color: Colors.white,
                            size: 15,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
