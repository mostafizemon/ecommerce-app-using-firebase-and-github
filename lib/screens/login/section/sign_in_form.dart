import 'package:e_commarce_app_firebase/controller/obscure_text_controller.dart';
import 'package:flutter/Material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../controller/auth_controller.dart';
import '../../../svg_icons/svg_icons.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    ObscureTextController obscureTextController =
        Get.put(ObscureTextController());
    final controller = Get.put(AuthController());

    return Form(
      key: controller.loginKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.emailcontroller,
            validator: (value) {
              if (value!.isEmpty) {
                return "This field can not be empty";
              }
            },
            onSaved: (email) {},
            onChanged: (email) {},
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              hintText: "Enter your email",
              labelText: "Email",
              suffix: SvgPicture.string(
                mailIcon,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => TextFormField(
                    controller: controller.passwordcontroller,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field can not be empty";
                      }
                    },
                    onSaved: (password) {},
                    onChanged: (password) {},
                    obscureText:
                        obscureTextController.obscureTextloginPassword.value,
                    decoration: InputDecoration(
                      hintText: "Enter your password",
                      labelText: "Password",
                      suffix: InkWell(
                        onTap: () {
                          obscureTextController.obscureTextloginPassword.value =
                              !obscureTextController
                                  .obscureTextloginPassword.value;
                        },
                        child:
                            obscureTextController.obscureTextloginPassword.value
                                ? const Icon(
                                    Icons.visibility_off,
                                    color: Color(0xFF868686),
                                  )
                                : const Icon(
                                    Icons.visibility,
                                    color: Color(0xFF868686),
                                  ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Forget password?",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Obx(() {
            return ElevatedButton(
              onPressed: () => controller.login(),
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: const Color(0xFFFF7643),
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 48),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              child:
                  Text(controller.isLoading.value ? "Loading.." : "Continue"),
            );
          }),
        ],
      ),
    );
  }
}
