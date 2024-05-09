import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pinput/pinput.dart';

class OtpVerification extends StatefulWidget {
  final String verificationId;
  final String mobileNumber;

  OtpVerification({
    Key? key,
    required this.verificationId,
    required this.mobileNumber,
  }) : super(key: key);

  @override
  _OtpVerificationState createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  final _formState = GlobalKey<FormState>();
  final otp = TextEditingController();
  late Timer _timer;
  int _seconds = 59;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  void resendOtp() {

    setState(() {
      _seconds = 59;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: HexColor("#FAFAFA"),
      body: SafeArea(
        child: SizedBox(
          height: height,
          width: width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.03),
                Image.asset("assets/OBJECTS.png"),
                SizedBox(height: height * 0.075),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "OTP Verification",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: GoogleFonts.inter().fontFamily,
                      fontWeight: FontWeight.w900,
                      fontSize: height * 0.016,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Enter the verification code we just sent to your\nnumber +91 ${widget.mobileNumber.substring(widget.mobileNumber.length - 2)}.",
                    style: TextStyle(
                      fontFamily: GoogleFonts.montserrat().fontFamily,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.03),
                Pinput(
                  focusedPinTheme: PinTheme(
                    width: 41,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(
                        color: Colors.green,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  controller: otp,
                  length: 6,
                  cursor: const Icon(Icons.linear_scale),
                  defaultPinTheme: PinTheme(
                    width: 41,
                    height: 40,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: HexColor("#FF5454"),
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: HexColor("#100E09")),
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ),
                SizedBox(height: height * 0.012),
                Text(
                  "${_seconds.toString().padLeft(2, '0')} Sec",
                  style: TextStyle(color: HexColor("#FF5454")),
                ),
                SizedBox(height: height * 0.025),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Don't Get OTP?  ",
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: "Resend",
                        style: TextStyle(
                          color: HexColor("#2873F0"),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            resendOtp();
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.024),
                SizedBox(
                  height: height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        HexColor("#100E09"),
                      ),
                    ),
                    onPressed: () {
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: widget.verificationId,
                        smsCode: otp.text,
                      );
                    },
                    child: Center(
                      child: Text(
                        "Verify",
                        style: TextStyle(
                          color: HexColor("#FFFFFF"),
                          fontFamily: GoogleFonts.montserrat().fontFamily,
                          fontSize: height * 0.022,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
