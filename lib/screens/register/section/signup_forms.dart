import 'package:e_commarce_app_firebase/controller/obscure_text_controller.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class SignupForms extends StatelessWidget {
  const SignupForms({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final ObscureTextController signupController = Get.put(ObscureTextController());
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // Full Name Field
          TextFormField(
            onSaved: (value) {},
            decoration: const InputDecoration(
              hintText: "Full Name",
            ),
          ),
          const SizedBox(height: 16),

          // Email Field
          TextFormField(
            onSaved: (value) {},
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "Email Address",
            ),
          ),
          const SizedBox(height: 16),

          // Password Field
          Obx(
            () => TextFormField(
              obscureText: signupController.obscureTextpassword.value,
              onChanged: (value) {},
              onSaved: (value) {},
              decoration: InputDecoration(
                hintText: "Password",
                suffixIcon: Obx(
                  () => GestureDetector(
                    onTap: () {
                      signupController.obscureTextpassword.value =
                          !signupController.obscureTextpassword.value;
                    },
                    child: signupController.obscureTextpassword.value
                        ? const Icon(Icons.visibility_off,
                            color: Color(0xFF868686))
                        : const Icon(Icons.visibility,
                            color: Color(0xFF868686)),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Confirm Password Field
          Obx(
            () => TextFormField(
              obscureText: signupController.obscureTextconfirmppassword.value,
              decoration: InputDecoration(
                hintText: "Confirm Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    signupController.obscureTextconfirmppassword.value =
                        !signupController.obscureTextconfirmppassword.value;
                  },
                  child: signupController.obscureTextconfirmppassword.value
                      ? const Icon(Icons.visibility_off,
                          color: Color(0xFF868686))
                      : const Icon(Icons.visibility, color: Color(0xFF868686)),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Sign Up Button
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF7643),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Sign Up"),
          ),
        ],
      ),
    );
    ;
  }
}
