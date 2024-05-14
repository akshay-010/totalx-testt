import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:machinetestt/View/otpverify.dart';
import 'package:machinetestt/View/userlists.dart';
class BackendServices {
 FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
 FirebaseAuth firebaseAuth = FirebaseAuth.instance;
 FirebaseStorage firebaseStorage = FirebaseStorage.instance;


 Future<void> initiatePhoneVerification(BuildContext context,phoneController) async {
  try {
   await FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: '$selectedcountrycode${phoneController.text}',
    verificationCompleted: (PhoneAuthCredential credential) {
     signInWithPhoneCredential(context, credential);
    },
    verificationFailed: (FirebaseAuthException e) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       content: Text('Verification failed: ${e.message}'),
      ),
     );
    },
    codeSent: (String verificationId, int? resendToken) {
     // Navigate to OTP screen after code is sent
     Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => OtpScreen(
           verificationid: verificationId,
           mobilenumber:
              '$selectedcountrycode${phoneController.text}',)),
     );
    },
    codeAutoRetrievalTimeout: (String verificationId) {
     // Handle timeout
    },
   );
  } catch (e) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
     content: Text('Error: $e'),
    ),
   );
  }
 }




 Future<void> signInWithPhoneCredential(
     BuildContext context, PhoneAuthCredential credential) async {
  try {
   final authResult =
   await FirebaseAuth.instance.signInWithCredential(credential);
   // Check if the user is signed in
   if (authResult.user != null) {
    Navigator.pushReplacement(
     context,
     MaterialPageRoute(
      builder: (context) => UserListBody()
     ),
    );
   } else {
    // Handle sign in failure
    ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(
      content: Text('Sign in failed'),
     ),
    );
   }
  } catch (e) {
   ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
     content: Text('Error: $e'),
    ),
   );
  }
 }

 final selectedcountrycode = '+91';


}