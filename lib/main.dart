import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/presentation/home/view/home_screen.dart';

import 'core/utility/color_constant.dart';

bool shouldUseFirestoreEmulator = true;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyAj5KinSE0KBVHcg2x0E_Cl6yE1t6UXdyM',
    appId: '1:650225274631:android:01aa822503a5f640c33fa2',
    messagingSenderId: '650225274631',
    projectId: 'foodapp-6c762',
    storageBucket: 'foodapp-6c762.appspot.com',
  ));
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ConstantColor.primaryColor,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
