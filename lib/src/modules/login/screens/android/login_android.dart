import 'package:byneetcourseapp/src/modules/login/login_service.dart';
import 'package:byneetcourseapp/src/modules/register/screens/android/register_android.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/tools/fadeAnimation.dart';
import 'package:byneetcourseapp/src/widgets/customButton_widget.dart';
import 'package:byneetcourseapp/src/widgets/customTextfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:byneetcourseapp/src/modules/forgotPassword/screens/android/forgotPassword_android.dart';
import 'package:provider/provider.dart';

class LoginAndroid extends StatefulWidget {
  @override
  _LoginAndroidState createState() => _LoginAndroidState();
}

class _LoginAndroidState extends State<LoginAndroid> {
  //cuma ngetes ui validator.
  //pindahkan jak sesuai state management
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();

  //untuk pencet next dikeyboard kalo selesai nulis
  FocusNode emailNode;
  FocusNode passNode;

  @override
  void initState() {
    super.initState();
    emailNode = FocusNode();

    passNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    emailNode.dispose();
    passNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<LoginService>(context);
    return Scaffold(
      backgroundColor: CustomColor.background,
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
                  SizedBox(height: 80),
                  FadeAnimation(
                    1,
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  FadeAnimation(
                    1.5,
                    Text(
                      "Selamat datang",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  //textformfield email
                  FadeAnimation(
                    1.7,
                    CustomTextFieldWidget(
                      isEmail: true,
                      controller: emailCtrl,
                      hintText: "Email Address",
                      validatorText: "Email kamu belum diisi",
                      nodeName: emailNode,
                      destinationNode: passNode,
                    ),
                  ),
                  SizedBox(height: 20),
                  //textformfield email
                  //mau di buat widget tapi bingung karne ad focusNode :D
                  FadeAnimation(
                    1.8,
                    TextFormField(
                      obscureText: true,
                      controller: passCtrl,
                      cursorColor: CustomColor.textFieldColor,
                      focusNode: passNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      validator: (value) => value.length < 6
                          ? "Password minimal 6 karakter"
                          : null,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: CustomColor.textColorSecondary,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColor.textFieldColor,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: CustomColor.textFieldColor,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  FadeAnimation(
                    2.0,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordAndroid(),
                              ));
                        },
                        child: Text(
                          "Lupa Password?",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: CustomColor.textColorGrey,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  //tombol login
                  FadeAnimation(
                    2.0,
                    CustomButtonWidget(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          user.signIn(emailCtrl.text, passCtrl.text);
                        }
                      },
                      title: "Log In",
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: FadeAnimation(
                      2.1,
                      InkWell(
                        onTap: () {
                          user.signInWithGoogle();
                        },
                        child: Card(
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SizedBox(
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 13.0, right: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Image.asset(
                                    "images/google.png",
                                    width: 70.0,
                                    height: 70.0,
                                  ),
                                  Text(
                                    "Sign in With Google",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.textColorPrimary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  FadeAnimation(
                    2.2,
                    Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordAndroid(),
                              ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Tidak punya akun?",
                              style: TextStyle(
                                fontSize: 14,
                                color: CustomColor.textColorGrey,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterAndroid(),
                                    ));
                              },
                              child: Text(
                                "Daftar Sekarang",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.textColorPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
