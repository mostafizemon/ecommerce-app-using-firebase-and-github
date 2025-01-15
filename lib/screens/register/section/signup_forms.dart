import 'package:e_commarce_app_firebase/controller/auth_controller.dart';
import 'package:e_commarce_app_firebase/controller/obscure_text_controller.dart';
import 'package:flutter/Material.dart';
import 'package:get/get.dart';

class SignupForms extends StatelessWidget {
  const SignupForms({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    final ObscureTextController signupController =
        Get.put(ObscureTextController());
    return Form(
      key: controller.registerKey,
      child: Column(
        children: [
          // Full Name Field
          TextFormField(
            controller: controller.fullnamecontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return "This field can not be empty";
              }
              return null;
            },
            onSaved: (value) {},
            decoration: const InputDecoration(
              hintText: "Full Name",
            ),
          ),
          const SizedBox(height: 16),

          // Email Field
          TextFormField(
            controller: controller.emailcontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return "This field can not be empty";
              }
              return null;
            },
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
              controller: controller.passwordcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field can not be empty";
                }
                return null;
              },
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
              controller: controller.confirmpasswordcontroller,
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field can not be empty";
                }
                return null;
              },
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
          Obx(
            () => ElevatedButton(
              onPressed: () {
                controller.register();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF7643),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(controller.isLoading.value ? "Loading.." : "Sign Up"),
            ),
          ),
        ],
      ),
    );
  }
}
