import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class IDSFfFirebaseUser {
  IDSFfFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

IDSFfFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<IDSFfFirebaseUser> iDSFfFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<IDSFfFirebaseUser>((user) => currentUser = IDSFfFirebaseUser(user));
