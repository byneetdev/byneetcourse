import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class ForgotPasswordAndroid extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
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
                  SizedBox(height: 40),
                  Text(
                    "Lupa Password",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Jika kamu menekan reset, maka kamu akan mendapatkan password baru melalui email kamu",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 28),
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
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (value) =>
                            value.isEmpty ? "Email kamu belum diisi" : null,
                        cursorColor: Color(0xFFFB1002),
                        decoration: InputDecoration(
                          hintText: "Email address",
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
                            "Reset",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
