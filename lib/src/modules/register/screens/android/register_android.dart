import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:byneetcourseapp/src/modules/register/widgets/textfield_widget.dart';

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
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Daftarkan dirimu, banyak kelas-kelas terbaik yang bisa kamu pelajari",
                    style: TextStyle(
                      fontSize: 17,
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
                    nodeName: emailFocusNode,
                    destinationNode: namaLengkapFocusNode,
                  ),
                  SizedBox(height: 20),
                  TextfieldWidget(
                    isEmail: false,
                    controller: namaLengkapCtrl,
                    hintText: "Nama Lengkap",
                    validatorText: "Nama kamu belum diisi",
                    nodeName: namaLengkapFocusNode,
                    destinationNode: keahlianFocusNode,
                  ),
                  SizedBox(height: 20),
                  TextfieldWidget(
                    isEmail: false,
                    controller: keahlianCtrl,
                    hintText: "Keahlian, cth: Web Designer",
                    validatorText: "Keahlian kamu belum diisi",
                    nodeName: keahlianFocusNode,
                    destinationNode: passwordFocusNode,
                  ),
                  SizedBox(height: 20),
                  //textformfield password
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
                        focusNode: passwordFocusNode,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (value) => _fieldFocusChange(
                            context, passwordFocusNode, confirmPassFocusNode),
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
                  SizedBox(height: 20),
                  //textformfield password
                  //mau di buat widget tapi bingung karne ad focusNode :D
                  ClayContainer(
                    borderRadius: 15,
                    color: Color(0xFFD2E0EF),
                    curveType: CurveType.none,
                    emboss: true,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: TextFormField(
                        autofocus: true,
                        obscureText: true,
                        keyboardType: TextInputType.text,
                        focusNode: confirmPassFocusNode,
                        textInputAction: TextInputAction.done,
                        validator: (value) => value != passCtrl.text
                            ? "Password tidak sama"
                            : null,
                        cursorColor: Color(0xFFFB1002),
                        decoration: InputDecoration(
                          hintText: "Konfirmasi Password",
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
                      if (formKey.currentState.validate()) {}
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
                            "Sign up",
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
