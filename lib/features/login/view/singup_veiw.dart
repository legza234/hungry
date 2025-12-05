import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';

import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';
import '../widget/custom_botton.dart';

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

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Primru,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(100),
                SvgPicture.asset("assets/Hungry_.svg"),
                const Gap(70),

                // Name
                CustomTextField(
                  hint: "Name",
                  ispassward: false,
                  controller: nameController,
                ),
                const Gap(20),

                // Email
                CustomTextField(
                  hint: "Email Address",
                  ispassward: false,
                  controller: emailController,
                ),
                const Gap(40),

                // Password
                CustomTextField(
                  hint: "Enter Password",
                  ispassward: true,
                  controller: passController,
                ),
                const Gap(20),

                // Confirm Password
                CustomTextField(
                  hint: "Confirm Your Password",
                  ispassward: true,
                  controller: confirmpassController,
                ),
                const Gap(50),

                // Sign Up Button
                CustomAuthBotton(
                  text: "Sign UP",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (passController.text != confirmpassController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Passwords do not match")),
                        );
                        return;
                      }
                      // هنا ممكن تضيف منطق التسجيل
                      print("Sign Up pressed");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
