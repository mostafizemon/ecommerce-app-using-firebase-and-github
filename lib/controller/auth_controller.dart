import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commarce_app_firebase/screens/home_screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  final fullnamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

  final loginKey = GlobalKey<FormState>();
  final registerKey = GlobalKey<FormState>();

  void login() async {
    if (loginKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text,
        );
        Get.snackbar("Success", "Login Successfull",
            snackPosition: SnackPosition.BOTTOM);
        Get.offAll(() => const Home());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Error!", "No user found for that email.",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error!", "Wrong password provided for that user.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }
  }

  void register() async {
    if (registerKey.currentState!.validate()) {
      isLoading.value = true;
      try {
        await _auth
            .createUserWithEmailAndPassword(
                email: emailcontroller.text, password: passwordcontroller.text)
            .then((user) async {
          await _firestore.collection("users").doc(emailcontroller.text).set({
            'fullname': fullnamecontroller.text,
            'email': emailcontroller.text,
          });
          Get.snackbar("Success", "Account Created Successfull",
              snackPosition: SnackPosition.BOTTOM);
          Get.offAll(() => const Home());
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.snackbar("Error!", "The password provided is too weak.",
              snackPosition: SnackPosition.BOTTOM);
        } else if (e.code == 'email-already-in-use') {
          Get.snackbar("Error!", "The account already exists for that email.",
              snackPosition: SnackPosition.BOTTOM);
        }
      } catch (e) {
        print(e);
      } finally {
        isLoading.value = false;
      }
    }
  }
}
