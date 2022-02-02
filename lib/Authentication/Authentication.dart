import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();

  Future <void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed In';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}


///for User data =>
//final user = context.watch <User>();
///for signIn =>
//final msg = await context.read <AuthenticationService>().signIn(email: email, password: password);
///for signUp =>
//final msg = await context.read <AuthenticationService>().signUp(email: email, password: password);
///for signOut =>
//context.read<AuthenticationService>().signOut();

/// Use provider to get access of all of those
/*
    MultiProvider(
    providers: [
    Provider<AuthenticationService>(
    create: (_) => AuthenticationService(FirebaseAuth.instance),
    ),
    StreamProvider(
    create: (context) =>
    context.read<AuthenticationService>().authStateChanges,
    initialData: null,
    )
    ],
    child: MaterialApp(),
    );
*/