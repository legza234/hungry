import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/shared/custom_text.dart';
import 'package:hungry/shared/custom_text_field.dart';

import '../../../core/constants/app_color.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwardController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  Gap(10),
                  CustomText(
                    text: "Welcom back",
                    color: Colors.white,
                    Weight: FontWeight.w500,
                    size: 14,
                  ),
                  Gap(70),
                  CustomTextField(
                    hint: "Email Address",
                    ispassward: false,
                    controller: emailController,
                  ),
                  Gap(20),
                  CustomTextField(
                    hint: "Passward",
                    ispassward: true,
                    controller: passwardController,
                  ),
                  Gap(40),


                  GestureDetector(
                    onTap: (){
                      if (formKey.currentState !.validate()){

                        print("object");
                      };

                    },
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
                          Weight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Gap(20),


                  GestureDetector(
                    onTap: (){
                      if (formKey.currentState !.validate()){

                        print("object");
                      };

                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(25),
                      ),

                      width: double.infinity,
                      child: Center(
                        child: CustomText(
                          text: 'Singin',
                          color: Colors.white,
                          size: 20,
                          Weight: FontWeight.bold,
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
    );
  }
}
