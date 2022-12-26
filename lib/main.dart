import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:password_generator/game.dart';
import 'package:password_generator/screens/splash_page.dart';
import 'package:password_generator/utilities/google-sign_methods.dart';
import 'package:provider/provider.dart';

// FirebaseMessaging messaging = FirebaseMessaging.instance;
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print("Handling a background message: ${message.messageId}");
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCOSbXgXJ4UAzCZGKSK7eOVMWo6oRWTRok",
          authDomain: "attendance-f0435.firebaseapp.com",
          projectId: "attendance-f0435",
          storageBucket: "attendance-f0435.appspot.com",
          messagingSenderId: "G-44CEPBL5XX",
          appId: "1:756840676965:web:537f854f3ef9aa5b91d08c",
          measurementId: "G-44CEPBL5XX"));

  // NotificationSettings settings = await messaging.requestPermission(
  //   alert: true,
  //   announcement: false,
  //   badge: true,
  //   carPlay: false,
  //   criticalAlert: false,
  //   provisional: false,
  //   sound: true,
  // );
  // // messaging.getToken().then((value) => print(value));
  // messaging.getInitialMessage().then(
  //   (message) {
  //     if (message != null) {
  //       print(message.data);
  //     } else {
  //       print("No Notification");
  //     }
  //   },
  // );
  // print('User granted permission: ${settings.authorizationStatus}');

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<InternetConnectionStatus>(
      initialData: InternetConnectionStatus.connected,
      create: (_) {
        return InternetConnectionChecker().onStatusChange;
      },
      child: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'RT-Tech',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const GameScreen(),
        ),
      ),
    );
  }
}
