import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_color.dart';
import 'package:hungry/features/auth/widget/custom_botton.dart';

import '../../../shared/custom_text.dart';
import '../../../shared/custom_text_field.dart';

class SingupVeiw extends StatelessWidget {

  const SingupVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController confirmpassController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();


    return  Scaffold(
      backgroundColor: AppColor.Primru,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset("assets/Hungry_.svg"),

                Gap(70),

                CustomTextField(
                  hint: "Name",
                  ispassward: false,
                  controller: nameController,
                ),
                Gap(20),
                CustomTextField(
                  hint: "Email Address",
                  ispassward: false,
                  controller: emailController,
                ),
                Gap(40),
                CustomTextField(
                  hint: "Enter Password",
                  ispassward: true,
                  controller: passController,
                ),
                Gap(20),
                CustomTextField(
                  hint: "Confirm Your Password",
                  ispassward: true,
                  controller: passController,
                ),
                Gap(50),
                CustomAuthBotton(
                  text: "Sing UP",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      print("object");
                    }
                    ;
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
