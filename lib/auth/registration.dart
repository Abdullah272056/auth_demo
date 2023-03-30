
import 'dart:convert';
import 'dart:io';


import 'package:auth_demo/auth/verification_after_registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../api_service/api_service.dart';
import '../static/Colors.dart';
import '../static/loding_dialog.dart';
import '../static/toast.dart';
import 'log_in.dart';





class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController? _userNameController = TextEditingController();
  TextEditingController? _surNameController = TextEditingController();
  TextEditingController? _emailOrPhoneController = TextEditingController();
  TextEditingController? _phoneController = TextEditingController();
  TextEditingController? _userPasswordController = TextEditingController();
  TextEditingController? _userConfirmPasswordController = TextEditingController();

  String _particularBirthDate1="Enter Birthday";
  String selectedBirthDay="";
  TextEditingController? _birthDayController = TextEditingController();

  late DateTime _myDate;

  bool _isObscure = true;
  bool _isObscure3 = true;

  String gender = "male";
  List _registrationErrorList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: 25,
            ),
            Padding(
                padding:
                const EdgeInsets.only(left:20, top: 10, right: 20, bottom: 30),
                child: Column(
                  children: [

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin:EdgeInsets.only(right: 20.0,top: 00,left: 10),
                      child:Align(alignment: Alignment.topLeft,
                          child:Container(
                            width: 71,
                            height: 71,

                            child: Image.asset(
                              "assets/images/logo1.png",

                              fit: BoxFit.fill,
                            ),
                          )


                      ),
                    ),
                    Container(
                      margin:EdgeInsets.only(right: 10.0,top: 10,left: 10,bottom: 0),
                      child: Align(alignment: Alignment.topLeft,
                        child: Text(
                          "Register",
                          textAlign: TextAlign.center,

                          style: TextStyle(
                              color: text_color,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      margin:EdgeInsets.only(right: 20.0,top: 10,left: 10,bottom: 0),
                      child: Align(alignment: Alignment.centerLeft,
                        child: Text(
                          "Register with your email address or phone number and password.",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: hint_color,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Name',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    userInputName(_userNameController!, 'Name',
                        TextInputType.text, "assets/images/icon_user.png"),

                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Last Name',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              // TextSpan(
                              //     text: ' *',
                              //     style: TextStyle(
                              //         color: Colors.red,
                              //         fontSize: 14,
                              //         fontWeight: FontWeight.w400)
                              // ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    userInputName(_surNameController!, 'Last name',
                        TextInputType.text, "assets/images/icon_user.png"),


                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Phone',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    userInputEmail(_phoneController!, 'Phone', TextInputType.text),


                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Email',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    userInputEmail(_emailOrPhoneController!, 'Email', TextInputType.text),


                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Password',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    userInputPassword(_userPasswordController!, 'Password', TextInputType.emailAddress),

                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Confirm password',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    userInputConfirmPassword(_userConfirmPasswordController!, 'Confirm password', TextInputType.emailAddress),


                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Birthday',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    userInputBirthDay(_birthDayController!, 'BirthDay', TextInputType.datetime),

                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Sex',
                                  style: TextStyle(
                                      color: hint_color,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                  text: ' *',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400)
                              ),

                            ],
                          ),
                          // textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    userInputGender(),

                    SizedBox(
                      height: 35,
                    ),
                    _buildSignUpButton(),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10,bottom: 0),
                        child: InkResponse(
                          onTap: (){

                          },
                          child: Text("OR",
                              style: TextStyle(
                                  color:text_color,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)
                          ),

                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: _buildSocialButton(),
                    ),

                    Container(
                      margin:EdgeInsets.only(right: 20.0,top: 20,left: 10,bottom: 0),
                      child: Flex(direction: Axis.horizontal,
                        children: [
                          Text(
                            "Already have an account?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'PT-Sans',
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          InkResponse(
                            onTap: (){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>const LogInScreen()));
                            },
                            child: Align(alignment: Alignment.centerLeft,
                              child:  Text(
                                " Sign In",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'PT-Sans',
                                  decoration: TextDecoration.underline,
                                  fontSize: 17,
                                  fontWeight: FontWeight.normal,
                                  color: sohojatri_color1,
                                ),
                              ),),

                          )
                        ],
                      ),
                    ),
                  ],
                ))

          ],
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
            decoration: BoxDecoration(
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

  Widget userInputName(TextEditingController userInput, String hintTitle,
      TextInputType keyboardType, String icon_link) {
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
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            // suffixIcon: Icon(icons,color: Colors.hint_color,),

            suffixIconConstraints: BoxConstraints(
              minHeight: 8,
              minWidth: 8,
            ),
            // suffixIcon: Image(
            //   image: AssetImage(
            //     icon_link,
            //   ),
            //   height: 17,
            //   width: 17,
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



  Widget userInputPassword(TextEditingController userInput, String hintTitle,
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
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 10),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          obscureText: _isObscure,
          cursorColor: input_text_color,
          enableSuggestions: false,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color: hint_color,
                icon:
                Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputConfirmPassword(TextEditingController userInput,
      String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: inputBoxBackGroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding:
        const EdgeInsets.only(left: 25.0, top: 0, bottom: 0, right: 10),
        child: TextField(
          controller: userInput,
          autocorrect: false,
          obscureText: _isObscure3,
          enableSuggestions: false,
          cursorColor: input_text_color,
          autofocus: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: IconButton(
                color: hint_color,
                icon:
                Icon(_isObscure3 ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    _isObscure3 = !_isObscure3;
                  });
                }),
            hintText: hintTitle,
            hintStyle: const TextStyle(
                fontSize: 18, color: hint_color, fontStyle: FontStyle.normal),
          ),
          keyboardType: keyboardType,
        ),
      ),
    );
  }

  Widget userInputBirthDay(TextEditingController userInput, String hintTitle, TextInputType keyboardType) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: inputBoxBackGroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: InkResponse(
        onTap: () async {
          _myDate = (await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ))!;

          setState(() {
            selectedBirthDay = _myDate.toString();
            selectedBirthDay = DateFormat('yyyy-MM-dd').format(_myDate);
          });

        },
        child: SizedBox(
          height: 52,

          child: Padding(
            padding:  EdgeInsets.only(left: 25.0, top: 0,bottom: 0, right: 20),
            child:Flex(direction: Axis.horizontal,
              children: [
                if(selectedBirthDay.isEmpty)...{
                  Expanded(child: Text("Enter Birthday",
                      style: TextStyle(
                          color: hint_color,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)
                  )),
                }
                else...{
                  Expanded(child: Text(selectedBirthDay,
                      style: TextStyle(
                          color: text_color,
                          fontSize: 18,
                          fontWeight: FontWeight.normal)
                  )),
                },
                // Image.asset(
                //   "assets/images/icon_birthday.png",
                //   width: 18,
                //   height: 18,
                //   fit: BoxFit.fill,
                // ),
                // Flag.fromCode(FlagsCode.BD, height: 18, width: 22, fit: BoxFit.fill)
              ],
            ),

          ),
        ),
      ),
    );
  }


  Widget userInputGender() {
    return Container(
    //  height: 100,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: inputBoxBackGroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(child: Flex(direction: Axis.horizontal,
            children: [
              Radio(
                value: "male",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Expanded(child: Text("Male"))
            ],
            
          )),
          Expanded(child:
          Flex(direction: Axis.horizontal,
            children: [
              Radio(
                value: "female",
                groupValue: gender,
                onChanged: (value){
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              Expanded(child: Text("Female"))
            ],

          )


          )




        ],
      ),
    )

      ;
  }

  Widget _buildSignUpButton() {
    return Container(
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: ElevatedButton(
        onPressed: () {

          String nameTxt = _userNameController!.text;
          String lastNameTxt = _surNameController!.text;
          String emailTxt = _emailOrPhoneController!.text;
          String phoneTxt = _phoneController!.text;
          String passwordTxt = _userPasswordController!.text;
          String confirmPasswordTxt = _userConfirmPasswordController!.text;

          if(_inputValidation( name: nameTxt, last_name: lastNameTxt, email: emailTxt,
              password: passwordTxt, confirmPassword: confirmPasswordTxt, dateOfBirth: selectedBirthDay, gender: gender, phone: phoneTxt)==false){

            _userRegistration(dateOfBirth: selectedBirthDay, gender: gender,
                lastname: lastNameTxt, password: passwordTxt, name: nameTxt, phone: phoneTxt, email: emailTxt);

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
            child:  Text(
              "Sign Up",
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


  void _showLoadingDialog(BuildContext context, String _message) {
    showDialog(
      context: context,
      builder: (context) {
        // return VerificationScreen();
        return Dialog(
          child: Wrap(
            children: [
              Container(
                  margin: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 30, bottom: 30),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircularProgressIndicator(
                          backgroundColor: sohojatri_color1,
                          strokeWidth: 5,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                          _message,
                          style: TextStyle(fontSize: 25),
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

  _inputValidation({
        required String name,
        required String last_name,
        required String email,
        required String phone,
        required String password,
        required String confirmPassword,
        required String dateOfBirth,
        required String gender,

  }) {


    if (name.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("Name can't empty");
      return;
    }
    if (phone.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("phone can't empty");
      return;
    }

    if (email.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("email can't empty");
      return;
    }


    if (password.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("Password can't empty");
      return;
    }
    if (password.length<8) {
      Fluttertoast.cancel();
      validation_showToast("Password must be 8 digit");
      return;
    }
    if (confirmPassword.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("Confirm password can't empty");
      return;
    }
    if (password!=confirmPassword) {
      Fluttertoast.cancel();
      validation_showToast("Confirm password don't match");
      return;
    }
    if (dateOfBirth.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("Select your date of birth!");
      return;
    }

    if (gender.isEmpty) {
      Fluttertoast.cancel();
      validation_showToast("Select your dgender!");
      return;
    }

    return false;
  }

  _userRegistration({
        required String name,
        required String lastname,
        required String email,
        required String phone,
        required String password,
        required String dateOfBirth,
        required String gender,
      }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoadingDialog(context,"Creating...");
        try {
          Response response =
          await post(Uri.parse('$BASE_URL_API$SUB_URL_API_REGISTRATION'),
              body: {
              'phone': phone,
              'name': name,
              'lname': lastname,
              'email': email,
              'dob': dateOfBirth,
              'gender': gender,
              'password': password

              }
              );
          Navigator.of(context).pop();
          _showToast(response.statusCode.toString());
          if (response.statusCode == 201) {
            _showToast("Create Successfully");
            //var data = jsonDecode(response.body.toString());

            setState(() {
              //_showToast("success");
              var data = jsonDecode(response.body);

              Navigator.push(context,MaterialPageRoute(builder: (context)=>VerificationAfterRegistrationScreen(data["data"]["user_id"].toString())));


            });
          }
          else if(response.statusCode == 422){
            var data = jsonDecode(response.body);
            _showToast(data["errors"].toString());

            // _registrationErrorList = data["errors"];
            // if(_registrationErrorList.length>0){
            //   _showToast(_registrationErrorList[0].toString());
            // }
          }

          else {
            // var data = jsonDecode(response.body.toString());
            // _showToast(data['message']);
          }
        } catch (e) {
        //  Navigator.of(context).pop();
          _showToast("Try again!");
          print(e.toString());
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      _showToast("No Internet Connection!");
    }
  }


  _showToast(String message){

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        fontSize: 16.0);

  }



}



