
import 'dart:convert';
import 'dart:io';

import 'package:auth_demo/auth/password_set.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart';


import '../api_service/api_service.dart';
import '../static/Colors.dart';
import '../static/loding_dialog.dart';
import '../static/toast.dart';


class VerificationAfterResetPasswordScreen extends StatefulWidget {
  String email;

  VerificationAfterResetPasswordScreen(this.email);


  @override
  State<VerificationAfterResetPasswordScreen> createState() => _VerificationAfterResetPasswordScreenState(this.email);
}

class _VerificationAfterResetPasswordScreenState extends State<VerificationAfterResetPasswordScreen> {
  String _userId;
  _VerificationAfterResetPasswordScreenState(this._userId);


  String _firstDigitPin="-";
  String _secondDigitPin="-";
  String _thirdDigitPin="-";
  String _fourthDigitPin="-";
  String _fifthDigitPin="-";
  String _sixthDigitPin="-";
  double keyboardfontSize= 25;
  double keyboardfontTopPadding= 15;
  double keyboardfontBottomPadding= 15;
  String inputText="";
  TextStyle keyboardTextStyle= TextStyle(
      color: text_color,
      fontSize: 26,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500);
  TextStyle otpInputBoxTextStyle= TextStyle(
      color: text_color,
      fontSize: 20,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      body:CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(


              children: [
                Expanded(child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 55,
                        ),
                        Padding(
                            padding:
                            const EdgeInsets.only(left:20, top: 10, right: 20, bottom: 30),
                            child: Column(
                              children: [

                                SizedBox(
                                  height: 20,
                                ),

                                Wrap(
                                  children: [
                                    Container(
                                      margin:EdgeInsets.only(right: 10.0,top: 00,left: 10,bottom: 00),
                                      child:Align(alignment: Alignment.center,
                                        child:Container(

                                          child: Image.asset(
                                            "assets/images/logo1.png",
                                            width: 90,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),

                                    Align(alignment: Alignment.center,
                                      child:Text(
                                        "Pin Verification",
                                        style: TextStyle(
                                            color:text_color.withOpacity(.8),
                                            fontSize: 25,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),




                                  ],
                                ),

                                Container(
                                  margin:EdgeInsets.only(right: 20.0,top: 20,left: 10,bottom: 0),
                                  child: Align(alignment: Alignment.topCenter,
                                    child: Text(
                                      "Please enter the verification code.That was send to your email address",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: text_color,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),),
                                ),
                                Container(
                                  margin:EdgeInsets.only(right: 20.0,top: 20,left: 10,bottom: 0),
                                  child: Align(alignment: Alignment.topCenter,
                                    child: Text(
                                      "01:36",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: sohojatri_color,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),),
                                ),
                                Container(
                                  margin:EdgeInsets.only(right: 20.0,top: 15,left: 10,bottom: 0),
                                  child: Align(alignment: Alignment.topCenter,
                                    child: InkResponse(
                                      onTap: (){

                                        _userReSendCodeWithPhoneNumber();

                                      },
                                      child: Text(
                                        "Resend Code",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: sohojatri_color1,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                _buildTextFieldOTPView1(),



                              ],
                            )),
                        Expanded(child:  Align(alignment: Alignment.bottomCenter,
                          child: _buildBottomDesign(),
                        ),)


                      ],
                    )
                  ],
                )),

              ],
            ),
          ),
        ],
      ),

    );
  }



  _userSendCodeWithEmail() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //   showLoadingDialog(context,"Sending...");
      //   try {
      //     Response response =
      //     await put(
      //         Uri.parse('$BASE_URL_API$SUB_URL_API_EMAIL_SEND_CODE$_userId/'),
      //         );
      //     Navigator.of(context).pop();
      //     if (response.statusCode == 200) {
      //
      //       Navigator.push(context,MaterialPageRoute(builder: (context)=>EmailVerificationParticularScreen(_userId)));
      //
      //     }
      //     else if (response.statusCode == 400) {
      //       var data = jsonDecode(response.body.toString());
      //       _showToast(data['message']);
      //     }
      //     else {
      //       var data = jsonDecode(response.body.toString());
      //       _showToast(data['message']);
      //     }
      //   } catch (e) {
      //     Navigator.of(context).pop();
      //     print(e.toString());
      //   }
      // }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      validation_showToast("No Internet Connection!");
    }
  }

  _userReSendCodeWithPhoneNumber() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      // if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      //   showLoadingDialog(context,"Sending...");
      //   try {
      //     Response response =
      //     await post(
      //         Uri.parse('$BASE_URL_API$SUB_URL_API_PHONE_NUMBER_RESEND_CODE'),
      //         body: {
      //           'user_id': _userId,
      //         }
      //     );
      //     Navigator.of(context).pop();
      //     if (response.statusCode == 200) {
      //       _showToast("Check your phone number");
      //
      //     }
      //     else {
      //       var data = jsonDecode(response.body.toString());
      //       _showToast(data['message']);
      //     }
      //   } catch (e) {
      //     Navigator.of(context).pop();
      //     print(e.toString());
      //   }
      // }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      validation_showToast("No Internet Connection!");
    }
  }






  _userOtpVerify(
      {
        required String otp,
        required String email,
      }) async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        showLoadingDialog(context,"Sending...");
        try {
          Response response = await post(Uri.parse('$BASE_URL_API$SUB_URL_API_CHANGE_PASSWORD_OTP_VERIFY'),
              body: {
                'emailOrMobile': email,
                'verification_code': otp,
              });
          Navigator.of(context).pop();
          if (response.statusCode == 200) {
            validation_showToast("successfully verified");
            Navigator.push(context,MaterialPageRoute(builder: (context)=>PasswordSetScreen( token: '',)));

            //_userSendCodeWithEmail();

          }
          else {
            var data = jsonDecode(response.body.toString());
            validation_showToast(data['message']);
          }
        } catch (e) {
          Navigator.of(context).pop();
          print(e.toString());
        }
      }
    } on SocketException catch (_) {
      Fluttertoast.cancel();
      validation_showToast("No Internet Connection!");
    }
  }



  Widget _buildBottomDesign() {
    return Container(
        height: 280,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),

          boxShadow: [BoxShadow(

              color:Colors.grey.withOpacity(.3),
              //  blurRadius: 20.0, // soften the shadow
              blurRadius:20, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset:Offset(
                2.0, // Move to right 10  horizontally
                1.0, // Move to bottom 10 Vertically
              )
          )],

        ),
        child: Padding(
            padding: const EdgeInsets.only(left: 00, top: 15, right: 00, bottom: 0),
            child: Column(
              children: [

                Expanded(
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Container(

                          child: Flex(direction: Axis.horizontal,
                            children: [
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("1");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "1",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("2");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "2",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("3");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "3",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),

                            ],
                          ),
                        ),

                        Container(

                          child: Flex(direction: Axis.horizontal,
                            children: [
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("4");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "4",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("5");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "5",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("6");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "6",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),

                            ],
                          ),
                        ),

                        Container(

                          child: Flex(direction: Axis.horizontal,
                            children: [
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("7");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "7",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("8");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "8",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("9");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "9",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),

                            ],
                          ),
                        ),

                        Container(

                          child: Flex(direction: Axis.horizontal,
                            children: [
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("x");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 10, bottom: keyboardfontBottomPadding),
                                  child:Image.asset('assets/images/icon_backspace.png',
                                    height: 20,
                                    width: 30,
                                  ),
                                  // Text(
                                  //   "x",
                                  //   textAlign: TextAlign.center,
                                  //
                                  //   style: keyboardTextStyle,
                                  // ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){
                                  typeKeyboard("0");
                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
                                  child: Text(
                                    "0",
                                    textAlign: TextAlign.center,

                                    style: keyboardTextStyle,
                                  ),
                                ),
                              ),),
                              Expanded(child:InkWell(
                                onTap: (){


                                  if(inputText.length<6||inputText.length>6){

                                    validation_showToast("Input six digit pin");

                                  }
                                  else{

                                    _userOtpVerify(otp:inputText, email: _userId);

                                  //  _userVerify(userId: _userId,otp:inputText );

                                  }

                                },
                                child: Container(
                                  padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 10, bottom: keyboardfontBottomPadding),
                                  child:Image.asset('assets/images/submit_icon.png',
                                    color: sohojatri_color1,
                                    height: 32,
                                    width: 32,

                                  ),

                                ),
                              ),),



                            ],
                          ),
                        ),

                      ],
                    )

                ),


                SizedBox(height: 15,),

              ],
            )));
  }

  Widget _buildTextFieldOTPView1() {
    return  Container(

      child: Flex(direction: Axis.horizontal,
        children: [
          Expanded(child: Container(
            height: 55,
            decoration: BoxDecoration(
                color:otp_box_color,
                borderRadius: BorderRadius.circular(6)),
            margin:EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
            child: Center(
              child: Text(
                _firstDigitPin,
                textAlign: TextAlign.center,

                style: otpInputBoxTextStyle,
              ),
            ),
          ),),
          Expanded(child: Container(
            height: 55,
            decoration: BoxDecoration(
                color:otp_box_color,
                borderRadius: BorderRadius.circular(6)),
            margin:EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
            child:Center(
              child:  Text(
                _secondDigitPin,
                textAlign: TextAlign.center,

                style: otpInputBoxTextStyle,
              ),
            ),
          ),),
          Expanded(child: Container(
            height: 55,
            decoration: BoxDecoration(
                color:otp_box_color,
                borderRadius: BorderRadius.circular(6)),
            margin:EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
            child: Center(
              child: Text(
                _thirdDigitPin,
                textAlign: TextAlign.center,

                style: otpInputBoxTextStyle,
              ),
            ),
          ),),
          Expanded(child: Container(
            height: 55,
            decoration: BoxDecoration(
                color:otp_box_color,
                borderRadius: BorderRadius.circular(6)),
            margin:EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
            child: Center(
              child: Text(
                _fourthDigitPin,
                textAlign: TextAlign.center,

                style: otpInputBoxTextStyle,
              ),
            ),
          ),),
          Expanded(child: Container(
            height: 55,
            decoration: BoxDecoration(
                color:otp_box_color,
                borderRadius: BorderRadius.circular(6)),
            margin:EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
            child: Center(
              child: Text(
                _fifthDigitPin,
                textAlign: TextAlign.center,

                style: otpInputBoxTextStyle,
              ),
            ),
          ),),
          Expanded(child: Container(
            height: 55,
            decoration: BoxDecoration(
                color:otp_box_color,
                borderRadius: BorderRadius.circular(6)),
            margin:EdgeInsets.only(left: 2, top: 2, right: 2, bottom: 2),
            padding:EdgeInsets.only(left: 00, top: keyboardfontTopPadding, right: 00, bottom: keyboardfontBottomPadding),
            child: Center(child: Text(
              _sixthDigitPin,
              textAlign: TextAlign.center,

              style: otpInputBoxTextStyle,
            ),),
          ),),

        ],
      ),
    );
  }

  void typeKeyboard(String typeKey) {
    setState(() {
      if (typeKey == "x") {
        if (inputText != null && inputText.length > 1) {
          inputText = inputText.substring(0, inputText.length - 1);
        } else {
          inputText = "";
        }
      }
      else {
        String abc = inputText + typeKey;
        if(abc.length<=6){
          inputText = inputText + typeKey;
        }

      }
      setText(inputText);
    });
  }

  void setText(String inputText){

    setState(() {
      if(inputText.length==0){
        _firstDigitPin="-";
        _secondDigitPin="-";
        _thirdDigitPin="-";
        _fourthDigitPin="-";
        _fifthDigitPin="-";
        _sixthDigitPin="-";
        return;
      }
      if(inputText.length==1){
        _firstDigitPin=inputText[0].toString();
        _secondDigitPin="-";
        _thirdDigitPin="-";
        _fourthDigitPin="-";
        _fifthDigitPin="-";
        _sixthDigitPin="-";
        return;
      }
      if(inputText.length==2){
        _firstDigitPin=inputText[0].toString();
        _secondDigitPin=inputText[1].toString();
        _thirdDigitPin="-";
        _fourthDigitPin="-";
        _fifthDigitPin="-";
        _sixthDigitPin="-";
        return;
      }
      if(inputText.length==3){
        _firstDigitPin=inputText[0].toString();
        _secondDigitPin=inputText[1].toString();
        _thirdDigitPin=inputText[2].toString();
        _fourthDigitPin="-";
        _fifthDigitPin="-";
        _sixthDigitPin="-";
        return;
      }
      if(inputText.length==4){
        _firstDigitPin=inputText[0].toString();
        _secondDigitPin=inputText[1].toString();
        _thirdDigitPin=inputText[2].toString();
        _fourthDigitPin=inputText[3].toString();
        _fifthDigitPin="-";
        _sixthDigitPin="-";
        return;
      }
      if(inputText.length==5){
        _firstDigitPin=inputText[0].toString();
        _secondDigitPin=inputText[1].toString();
        _thirdDigitPin=inputText[2].toString();
        _fourthDigitPin=inputText[3].toString();
        _fifthDigitPin=inputText[4].toString();
        _sixthDigitPin="-";
        return;
      }
      if(inputText.length==6){
        _firstDigitPin=inputText[0].toString();
        _secondDigitPin=inputText[1].toString();
        _thirdDigitPin=inputText[2].toString();
        _fourthDigitPin=inputText[3].toString();
        _fifthDigitPin=inputText[4].toString();
        _sixthDigitPin=inputText[5].toString();
        return;

      }

    });

  }

}

