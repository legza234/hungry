import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/view/singup_veiw.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/constants/app_color.dart';
import '../../checkout/widget/payment_method_selector.dart';
import '../data/auth_repo.dart';
import '../data/user_model.dart';
import 'custom_field_profile.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _pas = TextEditingController();
  File? _image;
  bool _isLoading = false;
  UserModel? userModel;
  final AuthRepo authRepo = AuthRepo();


  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _address.dispose();
    _pas.dispose();
    super.dispose();
  }


  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
        _name.text = userModel?.name ?? '';
        _email.text = userModel?.email ?? '';
        _address.text = userModel?.address ?? '';
      });

    }catch (e) {
      String errorMsg = 'An error in profile';
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
    getProfileData();
  }


  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showSnackBar(String message, {bool isError = false}) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
      ),
    );
  }

  Future<void> _editProfile() async {
    setState(() => _isLoading = true);
    try {
      final updatedUser = await authRepo.updateProfileData(
        name: _name.text,
        email: _email.text,
        address: _address.text,
        password: _pas.text,
        image: _image,
      );
      setState(() {
        userModel = updatedUser;
        // Clear the local image so the new network image is used
        _image = null;
      });

      _showSnackBar("Profile updated successfully!");

    } catch (e) {
      String errorMessage = "An unexpected error occurred.";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      _showSnackBar("Failed to update profile: $errorMessage", isError: true);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _logout() async {
    setState(() => _isLoading = true);
    try {

      await authRepo.logout();

      if (!mounted) return;
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SignUpView()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      String errorMessage = "An unexpected error occurred.";
      if (e is ApiError) {
        errorMessage = e.message;
      }
      _showSnackBar("Logout failed: $errorMessage", isError: true);
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColor.Primru,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: AppColor.Primru,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileImage(),
            const Gap(30),
            CustomFieldProfile(controller: _name, label: "name"),
            const Gap(10),
            CustomFieldProfile(controller: _email, label: "Email"),
            const Gap(10),
            CustomFieldProfile(
                controller: _address, label: "Delivery address"),
            const Gap(10),
            CustomFieldProfile(
              controller: _pas,
              label: "Password",

            ),
            const Gap(20),
            const Divider(),
            const Gap(20),
            PaymentMethodSelector(
              initialValue: "cash",
              onChanged: (value) {
                // TODO: Handle payment method change
              },
            ),
            const Gap(20),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    ImageProvider? backgroundImage;
    if (_image != null) {
      backgroundImage = FileImage(_image!);
    } else if (userModel?.image != null && userModel!.image!.isNotEmpty) {
      backgroundImage = NetworkImage(userModel!.image!);
    }

    return Center(
      child: GestureDetector(
        onTap: _pickImage,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: backgroundImage,
          child: backgroundImage == null
              ? const Icon(Icons.camera_alt, size: 40)
              : null,
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(child: _buildEditProfileButton()),
        const SizedBox(width: 15),
        Expanded(child: _buildLogOutButton()),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return ElevatedButton.icon(
      onPressed: _isLoading ? null : _editProfile,
      icon: const Icon(Icons.edit, color: Color(0xff0b3d2c)),
      label: const Text("Edit Profile"),
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xff0b3d2c),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildLogOutButton() {
    return OutlinedButton.icon(
      onPressed: _isLoading ? null : _logout,
      icon: const Icon(Icons.logout, color: Colors.white),
      label: const Text("Log out"),
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
