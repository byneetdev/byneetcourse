import 'package:byneetcourseapp/src/modules/account/account_service.dart';
import 'package:byneetcourseapp/src/modules/account/models/account_model_purin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class LoginService with ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  GoogleSignIn _googleSignIn;
  Status _status = Status.Uninitialized;
  AccountModel _account;
  String _errorCode;

  LoginService.instance()
      : _auth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn() {
    _auth.onAuthStateChanged.listen(_onAuthStateChanged);
  }

  Status get status => _status;
  FirebaseUser get user => _user;
  AccountModel get account => _account;
  String get errorCode => _errorCode;

  Future<bool> register(
      String email, String password, String nama, String keahlian) async {
    List<String> cekcekemail =
        await _auth.fetchSignInMethodsForEmail(email: email);
    if (cekcekemail != null && cekcekemail.length > 0) {
      print(cekcekemail.toString());
      return false;
    }
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        AccountService().setDocument(value.user.uid, {
          "nama": nama,
          "keahlian": keahlian,
          "urlImg":
              "https://firebasestorage.googleapis.com/v0/b/byneet-course.appspot.com/o/98987.png?alt=media&token=8e0bef42-c551-4baa-8696-7de6a720bd43"
        }).then((_) => AccountService()
            .getDocumentById(value.user.uid)
            .then((value) => _account = value));

        notifyListeners();
      });
      //.catchError((onError) {
      //   print(errorCode);
      //   // _errorCode = onError.toString();
      //   // notifyListeners();
      //   return false;
      // }, test: (bol) => false);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      _status = Status.Authenticating;
      notifyListeners();
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await _auth.signInWithCredential(credential);

      return true;
    } catch (e) {
      print(e);
      _status = Status.Unauthenticated;
      notifyListeners();
      return false;
    }
  }

  Future signOut() async {
    _auth.signOut();
    _googleSignIn.signOut();
    _status = Status.Unauthenticated;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }

  Future<void> _onAuthStateChanged(FirebaseUser firebaseUser) async {
    if (firebaseUser == null) {
      _status = Status.Unauthenticated;
    } else {
      _user = firebaseUser;

      //tiap login/buka app,getdata detail user, lalu disimpan di Accountservice:AccountDetail; dak jadi ak boros mana wkwkw
      // AccountService().getDocumentById(firebaseUser.uid);
      await AccountService().cekDataUser(firebaseUser.uid, <String, dynamic>{
        "nama": user.displayName,
        "urlImg":
            "https://firebasestorage.googleapis.com/v0/b/byneet-course.appspot.com/o/98987.png?alt=media&token=8e0bef42-c551-4baa-8696-7de6a720bd43"
      }).then((value) async {
        _account = value;
        print('login sukses');
        _status = Status.Authenticated;
      });
    }
    notifyListeners();
  }
}
