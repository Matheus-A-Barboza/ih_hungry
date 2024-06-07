import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:im_hungry/firebase_options.dart';

login(email, password) async{

  Firebase.initializeApp(
    
    options: DefaultFirebaseOptions.currentPlatform
  );
  try {
  var auth = FirebaseAuth.instance;
  await auth.signInWithEmailAndPassword(
    email: email, password: password);
  print('ok');

  return true;
  } catch (e) {
    return false;
    
  }

}

register(email, password, user, phonenumber) async{

  Firebase.initializeApp(
    
    options: DefaultFirebaseOptions.currentPlatform
  );
  try {
  var auth = FirebaseAuth.instance;
  await auth.createUserWithEmailAndPassword(
    email: email, password: password);
  print('ok');

  return true;
  } catch (e) {
    return false;
    
  }

}

// createUser() async{

//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform
//   );
//   var db = FirebaseFirestore.instance;
//   await db.collection('Users').doc('1').set({
//     'name':'Matheus',
//     'age':'22',
//     'job':'Web Developer',
//   });
// }