import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';

import '../api_service/api_service.dart';
import '../static/Colors.dart';
import '../static/toast.dart';
import 'log_in.dart';

class PasswordSetScreen extends StatefulWidget {
   String token;
   // String surName;
   // String email;
   // String mobile;
   // String countryId;


   PasswordSetScreen({required this.token}); //  PasswordSetScreen({Key? key}) : super(key: key);

  @override
  State<PasswordSetScreen> createState() => _PasswordSetScreenState(
      this.token);
}

class _PasswordSetScreenState extends State<PasswordSetScreen> {
  String _token;
  _PasswordSetScreenState(this._token,);

  TextEditingController? _passwordController = TextEditingController();
  TextEditingController? _confirmPasswordController = TextEditingController();

  //TextEditingController? passwordController = TextEditingController();
  bool _isObscure = true;
  bool _isObscure3 = true;
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
                    "Set New Password",
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
                    "Enter your password for set new password"
                        " and remember this password",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: hint_color,
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 50,
                  ),


                  //password input
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password",
                        style: TextStyle(
                            color:input_level_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputPassword(_passwordController!, 'Password', TextInputType.visiblePassword),
                  //password input
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Password",
                        style: TextStyle(
                            color:input_level_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputConfirmPassword(_confirmPasswordController!, 'Confirm Password', TextInputType.visiblePassword),

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
                                  color:input_text_color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)
                          ),
                          InkResponse(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                            },
                            child: Text(" Sign In",
                                style: TextStyle(
                                    color:sohojatri_color1,
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
          )

      ),
    );
  }

  Widget _buildBottomDesign() {
    return Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
            padding:
            const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Set New Password",
                        style: TextStyle(
                            color:input_text_color,
                            fontSize: 24,
                            fontWeight: FontWeight.w600)
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //password input
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Password",
                        style: TextStyle(
                            color:input_level_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputPassword(_passwordController!, 'Password', TextInputType.visiblePassword),
                  //password input
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Password",
                        style: TextStyle(
                            color:input_level_color,
                            fontSize: 15,
                            fontWeight: FontWeight.w400)
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  userInputConfirmPassword(_confirmPasswordController!, 'Confirm Password', TextInputType.visiblePassword),

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
                                  color:input_text_color,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)
                          ),
                          InkResponse(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
                            },
                            child: Text(" Sign In",
                                style: TextStyle(
                                    color:sohojatri_color1,
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
            )));
  }

  Widget _buildSubmitButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: ElevatedButton(
        onPressed: () {
          String password = _passwordController!.text;
          String confirmPassword = _confirmPasswordController!.text;

          if (password.isEmpty) {
            Fluttertoast.cancel();
            validation_showToast("Password can't empty");
            return;
          }

          if (password.length<8) {
            Fluttertoast.cancel();
            validation_showToast("Password must be 8 character");
            return;
          }

          if (confirmPassword.isEmpty) {
            Fluttertoast.cancel();
            validation_showToast("Confirm password can't empty");
            return;
          }
          // if (confirmPassword.length<8) {
          //   Fluttertoast.cancel();
          //   validation_showToast("Confirm password must be 8 character");
          //   return;
          // }

          if (password!=confirmPassword) {
            Fluttertoast.cancel();
            validation_showToast("Confirm password do not match");
            return;
          }
         // Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));
          setState(() {
            _userNewPasswordSet(confirmed: confirmPassword, password: password, token: _token,

              );
            });

        },
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [sohojatri_color, sohojatri_color],
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
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget userInputPassword(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color:inputBoxBackGroundColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 0,bottom: 0, right: 10),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          obscureText: _isObscure,
          enableSuggestions: false,
          autofocus: false,
          cursorColor:input_text_color,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color:input_text_color,
                icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility,
                  color: hint_color,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color:hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputConfirmPassword(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color:inputBoxBackGroundColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 0,bottom: 0, right: 10),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          obscureText: _isObscure3,
          enableSuggestions: false,
          autofocus: false,
          cursorColor:input_text_color,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color: input_text_color,
                icon: Icon(_isObscure3 ? Icons.visibility_off : Icons.visibility,
                color: hint_color,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure3 = !_isObscure3;
                  });
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color:hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  _userNewPasswordSet(
      {
        required String token,
        required String password,
        required String confirmed,
      }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoadingDialog(context,"Sending...");
        try {
          Response response = await post(Uri.parse('$BASE_URL_API$SUB_URL_API_CHANGE_PASSWORD_NEW_PASSWORD_SEND'),
              body: {
                'token': token,
                'password': password,
                'confirmed': confirmed,
              });
          Navigator.of(context).pop();
          if (response.statusCode == 200) {
            _showToast("successfully verified");
            Navigator.push(context,MaterialPageRoute(builder: (context)=>LogInScreen()));

          }
          else {
            var data = jsonDecode(response.body.toString());
            _showToast(data['message']);
          }
        } catch (e) {
          Navigator.of(context).pop();
          print(e.toString());
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      _showToast("No Internet Connection!");
    }
  }

  void saveUserInfo(var userInfo) async {
    try {
      // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      //
      // sharedPreferences.setString(pref_user_id, userInfo['id'].toString());
      // sharedPreferences.setString(pref_user_uuid, userInfo['uuid'].toString());
      // sharedPreferences.setString(pref_login_status, "1");

    } catch (e) {
      //code
    }

    //
    // sharedPreferences.setString(pref_user_UUID, userInfo['data']["user_name"].toString());
    // sharedPreferences.setBool(pref_login_firstTime, userInfo['data']["user_name"].toString());
    // sharedPreferences.setString(pref_user_cartID, userInfo['data']["user_name"].toString());
    // sharedPreferences.setString(pref_user_county, userInfo['data']["user_name"].toString());
    // sharedPreferences.setString(pref_user_city, userInfo['data']["user_name"].toString());
    // sharedPreferences.setString(pref_user_state, userInfo['data']["user_name"].toString());
    // sharedPreferences.setString(pref_user_nid, userInfo['data']["user_name"].toString());
    // sharedPreferences.setString(pref_user_nid, userInfo['data']["user_name"].toString());
  }


  void showLoadingDialog(BuildContext context,String message) {
    showDialog(
      context: context,
      builder: (context) {
        // return VerificationScreen();
        return Dialog(
          child: Wrap(
            children: [
              Container(
                  margin: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 20, bottom: 20),
                  child: Center(
                    child: Row(
                      children:  [
                        SizedBox(
                          width: 10,
                        ),
                        CircularProgressIndicator(
                          backgroundColor:sohojatri_color1,
                          color: Colors.black,
                          strokeWidth: 5,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          message,
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ))
            ],
            // child: VerificationScreen(),
          ),
        );
      },
    );
  }
  _showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

}
