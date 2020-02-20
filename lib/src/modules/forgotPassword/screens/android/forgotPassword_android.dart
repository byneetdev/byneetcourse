import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/tools/fadeAnimation.dart';
import 'package:byneetcourseapp/src/widgets/customButton_widget.dart';
import 'package:byneetcourseapp/src/widgets/customTextfield_widget.dart';
import 'package:flutter/material.dart';

class ForgotPasswordAndroid extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.background,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: CustomColor.textColorPrimary,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  FadeAnimation(
                    1.0,
                    Text(
                      "Lupa Password",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.textColorPrimary,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "Jika kamu menekan reset, maka kamu akan mendapatkan password baru melalui email kamu",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: CustomColor.textColorSecondary,
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  //textformfield email
                  //mau di buat widget tapi bingung karne ad focusNode :D
                  FadeAnimation(
                      1.4,
                      CustomTextFieldWidget(
                        isEmail: false,
                        validatorText: "isi alamat email kamu dulu",
                        controller: emailCtrl,
                        hintText: "Email Address",
                      )),
                  SizedBox(height: 50),
                  FadeAnimation(1.3,
                      CustomButtonWidget(onPressed: () {}, title: "RESET")),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
