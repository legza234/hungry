import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/root.dart';
import '../../../core/network/api_error.dart';
import '../../../shared/custom_botton.dart';
import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthRepo authRepo = AuthRepo();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) return;

    if (passController.text.trim() != confirmpassController.text.trim()) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    // Show loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ),
    );

    try {
      await authRepo.register(
        nameController.text.trim(),
        emailController.text.trim(),
        passController.text.trim(),
        "01000000000", // رقم افتراضي (لو مطلوب من الـ API)
      );

      if (!mounted) return;
      Navigator.pop(context); // close loading

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (c) => const Root()),
      );
    } catch (e) {
      if (!mounted) return;
      Navigator.pop(context); // close loading
      String errorMsg = 'An error occurred';

      if (e is ApiError) {
        errorMsg = e.message;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMsg)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Gap(100),
                SvgPicture.asset("assets/Hungry_.svg"),
                const Gap(70),
                CustomTextField(
                  hint: "Name",
                  ispassward: false,
                  controller: nameController,
                ),
                const Gap(20),
                CustomTextField(
                  hint: "Email Address",
                  ispassward: false,
                  controller: emailController,
                ),
                const Gap(40),
                CustomTextField(
                  hint: "Enter Password",
                  ispassward: true,
                  controller: passController,
                ),
                const Gap(20),
                CustomTextField(
                  hint: "Confirm Your Password",
                  ispassward: true,
                  controller: confirmpassController,
                ),
                const Gap(50),
                Container(
                  height: 45,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child:  Center(
                    child: CustomText(
                      text: 'Sign Up',
                      color: Colors.black,
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => const LoginView()),
                        );
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

