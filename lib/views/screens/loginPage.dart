import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../helper/loginHelper.dart';
import 'package:firebase_first/modal/userModal.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              GoogleSignInAccount? account =
                  await AuthHelper.authHelpers.googleSignIn();

              if (account != null) {
                UserModal userModal = UserModal();

                userModal.username = account.displayName;
                userModal.email = account.email;

                userModal.image = account.photoUrl;

                Get.offNamed(
                  '/home_page',
                  arguments: userModal,
                );
              }
            },
            child: const CircleAvatar(
              radius: 20,
              backgroundImage:
                  NetworkImage('https://blog.hubspot.com/hubfs/image8-2.jpg'),
            )),
      ),
    );
  }
}
