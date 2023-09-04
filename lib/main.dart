import 'package:String/services/firebase/firebase_api_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:String/routes/app_route.dart';
import 'package:String/routes/app_route_names.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseApiService().initNotifications(); 
  
  runApp(  
    const MyApp()  
  );
  
}
class MyApp extends StatelessWidget {
  const MyApp ({super.key});
 
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp( 
      title: 'String', 
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: splashScreen,
      getPages: getPage,
    );   
  }
}
