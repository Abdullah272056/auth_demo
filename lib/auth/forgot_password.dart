
import 'dart:convert';
import 'dart:io';
import 'package:auth_demo/auth/verification_after_reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';

import '../api_service/api_service.dart';
import '../static/Colors.dart';
import '../static/loding_dialog.dart';
import 'log_in.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  TextEditingController? _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: Padding(
          padding:
          const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(
                    height: 15,
                  ),
                  Container(

                    width: 80,
                    height: 80,
                    child:  Image.asset(
                      "assets/images/icon_forgot.png",
                      color: sohojatri_color,
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Forgot Password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:text_color.withOpacity(.8),
                        fontSize: 25,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  Text(
                    "Enter your email address or phone number associated with your account "
                        "we will send you a pin to reset your password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: hint_color,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Email or Phone",
                        style: TextStyle(
                            color:hint_color,
                            fontSize: 16,
                            fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputEmail(_emailController!, 'Email or Phone', TextInputType.text),
                  //  userInputEmail(_emailController!, 'Email', TextInputType.emailAddress,Icons.email),

                  SizedBox(
                    height: 30,
                  ),

                  _buildSubmitButton(),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10,bottom: 10),
                      child: Wrap(
                        direction: Axis.horizontal,
                        children: [
                          const Text("Already have an account?",
                              style: TextStyle(
                                  color:text_color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)
                          ),
                          InkResponse(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                            },
                            child: Text(" Sign In",
                                style: TextStyle(
                                    color:sohojatri_color,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)
                            ),

                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }



  Widget _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        onPressed: () {
          String emailTxt = _emailController!.text;

          if (_inputValid(emailTxt) == false) {
           // Navigator.push(context,MaterialPageRoute(builder: (context)=>VerificationAfterResetPasswordScreen("1")));

            _forgottenPassword(emailOrPhone: emailTxt);
          }

        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [sohojatri_color,sohojatri_color],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(7.0)
          ),
          child: Container(

            height: 50,
            alignment: Alignment.center,
            child:  Text(
              "Submit",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'PT-Sans',
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget userInputEmail(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: inputBoxBackGroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 20),
        child: TextField(
          controller: userInput,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor: input_text_color,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            // suffixIcon: Image(
            //   image: AssetImage(
            //     'assets/images/icon_email.png',
            //   ),
            //   height: 18,
            //   width: 22,
            //   fit: BoxFit.fill,
            // ),
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 17, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputEmail1(TextEditingController userInputController, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color:inputBoxBackGroundColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 0,bottom: 0, right: 20),
        child: TextField(
          controller: userInputController,
          textInputAction: TextInputAction.next,
          autocorrect: false,
          enableSuggestions: false,
          cursorColor:input_text_color,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIconConstraints: BoxConstraints(
              minHeight: 15,
              minWidth: 15,
            ),
            // suffixIcon: Image(
            //   image: AssetImage(
            //     'assets/images/icon_email.png',
            //   ),
            //   height: 18,
            //   width: 22,
            //   fit: BoxFit.fill,
            // ),


            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),

            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color:hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }



  _inputValid(String email) {
    if (email.isEmpty) {
      Fluttertoast.cancel();
      _showToast("Email or Phone can't empty");
      return;
    }
    // if (!RegExp(
    //     r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
    //   //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    // ).hasMatch(email)) {
    //   Fluttertoast.cancel();
    //   _showToast("Enter valid email");
    //   return;
    // }


    return false;
  }

  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: sohojatri_color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _forgottenPassword({required String emailOrPhone}) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoadingDialog(context,"Sending...");
        try {
          Response response = await post(Uri.parse('$BASE_URL_API$SUB_URL_API_FORGET_PASSWORD'),

              body: {
                'emailOrMobile': emailOrPhone,
              }
          );
          Navigator.of(context).pop();
          // _showToast(response.statusCode.toString());

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body.toString());
            _showToast(data["message"]);
             Navigator.push(context,MaterialPageRoute(builder: (context)=>VerificationAfterResetPasswordScreen(emailOrPhone)));


          }

          else {
            var data = jsonDecode(response.body.toString());
            _showToast(data["message"]);

          }
        } catch (e) {
        //  Navigator.of(context).pop();
          print(e.toString());
          _showToast("failed!");
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      _showToast("No Internet Connection!");
    }
  }

}
