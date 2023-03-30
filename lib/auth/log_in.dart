
import 'dart:convert';
import 'dart:io';

import 'package:auth_demo/auth/registration.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../api_service/api_service.dart';
import '../api_service/sharePreferenceDataSaveName.dart';

import '../static/Colors.dart';
import '../static/loding_dialog.dart';
import '../static/toast.dart';
import 'forgot_password.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {


  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _passwordController = TextEditingController();



  bool _isObscure = true;
  bool isChecked = false;

  @override
  @mustCallSuper
  initState() {
    super.initState();
    //loadUserIdFromSharePref();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: SingleChildScrollView(
        child: Column(

          children: [

            SizedBox(
              height: 55,
            ),

            Padding(
                padding:
                const EdgeInsets.only(left:20, top: 10, right: 20, bottom: 30),
                child: Column(
                  children: [
                    Container(
                      margin:EdgeInsets.only(right: 20.0,top: 00,left: 0),
                      child:Align(alignment: Alignment.topLeft,
                        child:Container(
                          decoration: const BoxDecoration(
                            // boxShadow: [
                            //   BoxShadow(
                            //     color: Colors.grey.withOpacity(0.3),
                            //     spreadRadius: 1,
                            //     blurRadius: 10,
                            //     offset: Offset(0, 2), // changes position of shadow
                            //   ),
                            // ],
                          ),
                          child: Image.asset(
                            "assets/images/logo1.png",
                            width: 100,
                            height: 80,
                            fit: BoxFit.fill,
                          ),
                        )


                      ),
                    ),

                    Container(
                      margin:EdgeInsets.only(right: 10.0,top: 10,left: 10,bottom: 0),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text(
                          "Login",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                              color:text_color,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.only(right: 20.0,top: 10,left: 10,bottom: 0),
                      child: Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Login with your email address or phone number and password.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: hint_color,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),),
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Email or Phone",
                            style: TextStyle(
                                color: input_level_color,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 8,
                    ),
                    userInputEmail(_emailController!, 'Email or Phone', TextInputType.emailAddress),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10,bottom: 8),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text("Your Password",
                            style: TextStyle(
                                color:input_level_color,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    userInputPassword(_passwordController!, 'Password', TextInputType.visiblePassword),
                    Container(
                      margin: EdgeInsets.only(left: 0,right: 10,top: 5),
                      child:  Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [


                          Expanded(child: Align(alignment: Alignment.centerLeft,
                            child: Flex(direction: Axis.horizontal,
                              children: [
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    unselectedWidgetColor:hint_color,
                                  ),
                                  child: Checkbox(
                                    checkColor: Colors.white,

                                    activeColor: sohojatri_color1,

                                    //fillColor: MaterialStateProperty.resolveWith(Colors.black38),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                        if(isChecked){
                                          //  save_card_for_future_payment="true";

                                        }else{
                                          //  save_card_for_future_payment="false";
                                        }
                                      });
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text("Remember me",
                                      style: TextStyle(
                                          color: text_color,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)
                                  ),
                                )
                              ],

                            ),
                          )),

                          Expanded(child:  Align(alignment: Alignment.centerRight,
                            child:InkWell(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                              },
                              child: Text("Forgot Password ?",
                                  style: TextStyle(
                                      color: text_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)
                              ),
                            ),
                          )

                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    _buildLogInButton(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20,bottom: 0),
                        child: InkResponse(
                          onTap: (){

                          },
                          child: Text("OR",
                              style: TextStyle(
                                  color:text_color,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)
                          ),

                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: _buildSocialButton(),
                    ),

                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 20,bottom: 10),
                        child: Wrap(
                          direction: Axis.horizontal,
                          children: [
                            const Text("Don't have an account?",
                                style: TextStyle(
                                    color: text_color,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600)
                            ),
                            InkResponse(
                              onTap: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
                              },
                              child: Text(" Sign Up",
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
                ))

          ],
        ),
      ),
    );
  }

  Widget userInputEmail(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(color:inputBoxBackGroundColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 0,bottom: 0, right: 20),
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



            // suffixIcon: Icon(Icons.email,color: Colors.hint_color,),

            hintText: hintTitle,
            hintStyle:TextStyle(fontSize: 18, color:hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
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
          obscuringCharacter: "*",
          enableSuggestions: false,
          autofocus: false,
          cursorColor: input_text_color,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color: input_text_color,

                icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }


  Widget _buildLogInButton() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: ElevatedButton(
        onPressed: () {
          String emailTxt = _emailController!.text;
          String passwordTxt = _passwordController!.text;

          if(_inputValidation(email:emailTxt,Password: passwordTxt )==false){
            //_userLogIn(email:emailTxt, password: passwordTxt);

            _userLogIn(password: passwordTxt, userName: emailTxt);
          //  Navigator.push(context,MaterialPageRoute(builder: (context)=>LandingScreen()));
          }
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
            child:  const Text(
              "Login",
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

  Widget _buildSocialButton() {
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0,top: 10),
      child: Wrap(direction: Axis.horizontal,
        children: [
          Container(

            height: 44,
            width: 44,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 7,right: 7),
            decoration: const BoxDecoration(
              color:sohojatri_color,
              borderRadius: BorderRadius.all(
                 Radius.circular(22.0),

              ),
            ),
             // Border width
            // decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Image.asset(

              "assets/images/facebook_logo.png",
              color: Colors.white,
            ),
          ),
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 7,right: 7),
            decoration: BoxDecoration(
              color:sohojatri_color,
              borderRadius: BorderRadius.all(
                Radius.circular(22.0),

              ),
            ),
            // Border width
            // decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Image.asset(

              "assets/images/email.png",
              color: Colors.white,
            ),
          ),
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 7,right: 7),
            decoration: BoxDecoration(
              color:sohojatri_color,
              borderRadius: BorderRadius.all(
                Radius.circular(22.0),

              ),
            ),
            // Border width
            // decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Image.asset(

              "assets/images/github.png",
              color: Colors.white,
            ),
          ),
          Container(
            height: 44,
            width: 44,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.only(left: 7,right: 7),
            decoration: BoxDecoration(
              color:sohojatri_color,
              borderRadius: BorderRadius.all(
                Radius.circular(22.0),

              ),
            ),
            // Border width
            // decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: Image.asset(

              "assets/images/twitter.png",
              color: Colors.white,
            ),
          ),

        ],

      ),
    );
  }


  _userLogIn(
      {
        required String userName,
        required String password,
      }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoadingDialog(context,"Checking...");
        try {
          Response response =
          await post(Uri.parse('$BASE_URL_API$SUB_URL_API_LOG_IN'),
              body: {
                // 'username': userName,
                // 'password': password,
                'phone': userName,
                'password': password,
              });
          Navigator.of(context).pop();
         // _showToast(response.statusCode.toString());

          if (response.statusCode == 200) {
            var data = jsonDecode(response.body);

           saveUserInfo(data);

           // _showToast("ok");


        //   Navigator.push(context,MaterialPageRoute(builder: (context)=>NavigationBarScreen(0,FindRide())));


          }

          else if(response.statusCode == 500){
            var data = jsonDecode(response.body);
            validation_showToast(data["errors"]);

          }


          else if(response.statusCode == 404){
            validation_showToast("The provided credentials are incorrect");
            
          }


          else {
            // var data = jsonDecode(response.body.toString());
            // _showToast(data['message']);
          }
        } catch (e) {
          ///Navigator.of(context).pop();
          print(e.toString());
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      validation_showToast("No Internet Connection!");
    }
  }


  void saveUserInfo(var userInfo) async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

      sharedPreferences.setString(pref_user_token, userInfo['token'].toString());
      sharedPreferences.setString(pref_user_id, userInfo['data']['user_id'].toString());
      sharedPreferences.setString(pref_user_name, userInfo['data']['name'].toString());
      print("My token1: "+userInfo['token'].toString());
    } catch (e) {
      validation_showToast("error");
      //code
    }

  }






  _inputValidation({
    required String email,
    required String Password,
  }) {

    if (email.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("email or phone number can't empty");
      return;
    }

    // if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+"
    //   //  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
    // )
    //     .hasMatch(email)) {
    //   validation_showToast("Enter valid email");
    //   return;
    // }

    if (Password.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("password can't empty");
      return;
    }
    if (Password.length<8) {
      Fluttertoast.cancel();
      validation_showToast("password must be 8 digit");
      return;
    }

    return false;
  }


}

