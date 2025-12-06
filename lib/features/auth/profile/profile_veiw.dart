import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_color.dart';
import '../../checkout/widget/payment_method_selector.dart';
import 'custom_field_profile.dart';


class ProfileVeiw extends StatefulWidget {
  ProfileVeiw({super.key});

  @override
  State<ProfileVeiw> createState() => _ProfileVeiwState();
}

class _ProfileVeiwState extends State<ProfileVeiw> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pas = TextEditingController();
  String imagePath = "";

  @override
  void initState() {
    _name.text = 'Knuckles';
    _email.text = 'Knuckles@gmail.com';
    _address.text = '55Dubai, UAE';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.Primru,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        ),
      ),

      backgroundColor: AppColor.Primru,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () async {
                  // TODO: open image picker
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade300,
                  backgroundImage: imagePath.isNotEmpty
                      ? AssetImage(imagePath)
                      : null,
                  child: imagePath.isEmpty
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),
            ),
            Gap(30),

            CustomFieldProfile(controller: _name, label: "name"),

            Gap(10),
            CustomFieldProfile(controller: _email, label: "Email"),

            Gap(10),
            CustomFieldProfile(controller: _address, label: "Delivery address"),

            Gap(10),

            CustomFieldProfile(controller: _pas, label: "Password"),

            Gap(20),
            Divider(),
            Gap(20),
            PaymentMethodSelector(
              initialValue: "cash",
              onChanged: (value) {
                print("Selected payment: $value");
              },
            ),

            Gap(20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ---------------- EDIT PROFILE BUTTON ----------------
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Edit Profile Clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Edit Profile",
                            style: TextStyle(
                              color: Color(0xff0b3d2c), // Dark green
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.edit, color: Color(0xff0b3d2c)),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 15),

                // ---------------- LOG OUT BUTTON ----------------
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print("Log out Clicked");
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.logout, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
