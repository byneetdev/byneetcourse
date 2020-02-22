import 'package:byneetcourseapp/src/modules/login/services/login_service.dart';
import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:byneetcourseapp/src/widgets/customButton_widget.dart';
import 'package:byneetcourseapp/src/widgets/customFadeAnimation_widget.dart';
import 'package:byneetcourseapp/src/widgets/customTextfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterAndroid extends StatefulWidget {
  @override
  _RegisterAndroidState createState() => _RegisterAndroidState();
}

class _RegisterAndroidState extends State<RegisterAndroid> {
  //cuma ngetes ui validator.
  //pindahkan jak sesuai state management
  final emailCtrl = TextEditingController();
  final namaLengkapCtrl = TextEditingController();
  final keahlianCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();

  //untuk pencet next dikeyboard kalo selesai nulis
  FocusNode emailFocusNode;
  FocusNode namaLengkapFocusNode;
  FocusNode keahlianFocusNode;
  FocusNode passwordFocusNode;
  FocusNode confirmPassFocusNode;

  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    namaLengkapFocusNode = FocusNode();
    keahlianFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    confirmPassFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    emailFocusNode.dispose();
    namaLengkapFocusNode.dispose();
    keahlianFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPassFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  SizedBox(height: 20),
                  CustomFadeAnimation(
                    1.0,
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomFadeAnimation(
                    1.1,
                    Text(
                      "Daftarkan dirimu, banyak kelas-kelas terbaik yang bisa kamu pelajari",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 28),
                  //textformfield email
                  CustomFadeAnimation(
                    1.3,
                    CustomTextFieldWidget(
                      isEmail: true,
                      controller: emailCtrl,
                      hintText: "Email Address",
                      validatorText: "Email kamu belum diisi",
                      nodeName: emailFocusNode,
                      destinationNode: namaLengkapFocusNode,
                    ),
                  ),
                  SizedBox(height: 20),
                  CustomFadeAnimation(
                    1.4,
                    CustomTextFieldWidget(
                      isEmail: false,
                      controller: namaLengkapCtrl,
                      hintText: "Nama Lengkap",
                      validatorText: "Nama kamu belum diisi",
                      nodeName: namaLengkapFocusNode,
                      destinationNode: keahlianFocusNode,
                    ),
                  ),

                  SizedBox(height: 20),
                  CustomFadeAnimation(
                    1.5,
                    CustomTextFieldWidget(
                      isEmail: false,
                      controller: keahlianCtrl,
                      hintText: "Keahlian, cth: Web Designer",
                      validatorText: "Keahlian kamu belum diisi",
                      nodeName: keahlianFocusNode,
                      destinationNode: passwordFocusNode,
                    ),
                  ),
                  SizedBox(height: 20),
                  //textformfield password
                  //mau di buat widget tapi bingung karne ad focusNode :D
                  CustomFadeAnimation(
                    1.6,
                    TextFormField(
                      obscureText: true,
                      controller: passCtrl,
                      cursorColor: CustomColor.textFieldColor,
                      focusNode: passwordFocusNode,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (value) => _fieldFocusChange(
                          context, passwordFocusNode, confirmPassFocusNode),
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
                  SizedBox(height: 20),
                  //textformfield password
                  //mau di buat widget tapi bingung karne ad focusNode :D
                  CustomFadeAnimation(
                    1.7,
                    TextFormField(
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      focusNode: confirmPassFocusNode,
                      textInputAction: TextInputAction.done,
                      validator: (value) =>
                          value != passCtrl.text ? "Password tidak sama" : null,
                      cursorColor: CustomColor.textFieldColor,
                      decoration: InputDecoration(
                        labelText: "Konfirmasi Password",
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
                  SizedBox(height: 50),
                  //tombol login
                  CustomFadeAnimation(
                    1.8,
                    CustomButtonWidget(
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            Provider.of<LoginService>(context, listen: false)
                                .register(emailCtrl.text, passCtrl.text,
                                    namaLengkapCtrl.text, keahlianCtrl.text)
                                .then((value) => Navigator.pop(context));
                            //nanti di buat loading untuk menu utama hehe
                          }
                        },
                        title: "Sign Up"),
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

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
