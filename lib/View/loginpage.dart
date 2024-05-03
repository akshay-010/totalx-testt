import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:machinetestt/Controller/backendservices.dart';
import 'package:machinetestt/View/otpverify.dart';
import 'package:machinetestt/View/userlists.dart';
import 'package:number_key/keyboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController phoneController = TextEditingController();
  final double userAmount = 0;

  @override
  Widget build(BuildContext context) {


    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    BackendServices backendServices =BackendServices();
    return Scaffold(
      backgroundColor: HexColor("#FAFAFA"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height*0.03,
            ),
            Image.asset("assets/OBJECTS.png"),
           SizedBox(
             height: height*0.07,
           ),
           SizedBox(
             height: height/4,
             child: Padding(
               padding: const EdgeInsets.only(left: 15,right: 15),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Text("Enter Phone Number",style: TextStyle(color: Colors.black,fontFamily: GoogleFonts.montserrat().fontFamily,fontWeight: FontWeight.w900,fontSize: height*0.016),),
                   SizedBox(
                     height: height*0.001,
                   ),
                   TextFormField(
                     keyboardType: TextInputType.phone,
                     controller: phoneController,
                     decoration: InputDecoration(
                       hintText: "Enter Phone Number * ",
                       hintStyle: TextStyle(
                           fontFamily: GoogleFonts.montserrat().fontFamily,fontSize: height*0.016
                       ),
                       contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                       enabledBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(color: HexColor("#000000").withOpacity(0.4))
                       ),
                       focusedBorder: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(10),
                           borderSide: BorderSide(
                               color: Colors.black
                           )
                       ),
                     ),
                   ),
                   RichText(
                     text: TextSpan(
                       children: [
                         TextSpan(
                             text: 'By Continuing, I agree to TotalX’s',
                             style: TextStyle(
                                 color: Colors.black
                             )
                         ),
                         TextSpan(
                           text: 'Terms and condition',
                           style: TextStyle(
                             color: HexColor("2873F0"),
                           ),
                         ),
                         TextSpan(
                             text: ' & ',
                             style: TextStyle(
                                 color: Colors.black
                             )
                         ),TextSpan(
                             text: '\n'
                         ),
                         TextSpan(
                           text: 'privacy policy',
                           style: TextStyle(
                             color: HexColor("2873F0"),
                           ),
                         ),
                       ],

                     ),

                   ),
                   SizedBox(
                     height: height*0.015,
                   ),
                   SizedBox(
                     height: height*0.06,
                     child: ElevatedButton(
                       style: ButtonStyle(shape:MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),backgroundColor: MaterialStatePropertyAll(HexColor("#100E09")),),
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>UserLists()));
                         backendServices.initiatePhoneVerification(context,phoneController);
                       },
                       child: Center(
                         child: Text("Get OTP",style: TextStyle(color: HexColor("#FFFFFF"),fontFamily: GoogleFonts.montserrat().fontFamily,fontSize: height*0.022),),
                       ),),
                   ),
                 ],
               ),
             ),
           ),
            // Spacer(),
            // const SizedBox(height: 20), // Add some space between TextField and Keyboard
            // SizedBox(
            //   height: height/2.2,
            //   child: Padding(
            //     padding: const EdgeInsets.only(left: 5,right: 5),
            //     child: OnScreenKeys(
            //       keyColor: HexColor("#979797"),
            //       keyAxisCount: 3,
            //       customButtonText: 'Clear',
            //       customButton: (){},
            //       textEditingController: textController,
            //       keyboardSize: 5,
            //     ),
            //   ),
            // ),
            
          ],
        ),
      ),
    );
  }
}
