import 'package:e_commarce_app_firebase/screens/register/signup_screens.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account? ",
          style: TextStyle(color: Color(0xFF757575)),
        ),
        GestureDetector(
          onTap: () {
            // Handle navigation to Sign Up
          },
          child: InkWell(
            onTap: (){
              Get.to(()=>const SignUpScreen(),);
            },
            child: const Text(
              "Sign Up",
              style: TextStyle(
                color: Color(0xFFFF7643),
              ),
            ),
          ),
        ),
      ],
    );
  }
}