import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class FireAuth {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String email, String pass, String name, String phone, Function onSuccess) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      //
      _createUser(user.uid, name, phone, onSuccess);
      print(user);
    }).catchError((err) {
      // TODO
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess) {
    var user = {
      "name": name,
      "phone": phone,
    };
    var ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(userId).set(user).then((user) {
      // success
      onSuccess();
    }).catchError((err) {
      //TODO
    });
  }
}
