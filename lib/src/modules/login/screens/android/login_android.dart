import 'package:byneetcourseapp/src/modules/login/login_service.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:byneetcourseapp/src/modules/forgotPassword/screens/android/forgotPassword_android.dart';
import 'package:byneetcourseapp/src/modules/register/screens/android/register_android.dart';
import 'package:byneetcourseapp/src/modules/login/widgets/textfield_widget.dart';
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
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          //tombol registrasi member baru
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterAndroid(),
                  ));
            },
            child: Text(
              "SIGN UP",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFB1002),
              ),
            ),
          ),
        ],
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
                  Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Selamat datang",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 28),
                  //textformfield email
                  TextfieldWidget(
                    isEmail: true,
                    controller: emailCtrl,
                    hintText: "Email Address",
                    validatorText: "Email kamu belum diisi",
                    nodeName: emailNode,
                    destinationNode: passNode,
                  ),

                  SizedBox(height: 20),
                  //textformfield email
                  //mau di buat widget tapi bingung karne ad focusNode :D
                  ClayContainer(
                    borderRadius: 15,
                    color: Color(0xFFD2E0EF),
                    curveType: CurveType.none,
                    emboss: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passCtrl,
                        cursorColor: Color(0xFFFB1002),
                        focusNode: passNode,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        validator: (value) => value.length < 6
                            ? "Password minimal 6 karakter"
                            : null,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  //tombol login
                  RaisedButton(
                    // borderRadius: 15,
                    color: Color(0xFFFB1002),
                    // curveType: CurveType.none,
                    // emboss: true,
                    // spread: 1,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BottomNavBar(),
                        //   ),
                        // );
                        user.signIn(emailCtrl.text, passCtrl.text);
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Log in",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordAndroid(),
                              ));
                        },
                        child: ClayContainer(
                          borderRadius: 15,
                          color: Color(0xFFD2E0EF),
                          curveType: CurveType.none,
                          // emboss: true,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Lupa Password",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFB1002),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          user.signInWithGoogle();
                        },
                        child: ClayContainer(
                          borderRadius: 15,
                          color: Color(0xFFD2E0EF),
                          curveType: CurveType.none,
                          // emboss: true,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              " Goolge Sign In ",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
