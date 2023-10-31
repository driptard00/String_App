import 'package:String/screens/Auth/otpVerificationScreen.dart';
import 'package:String/screens/Main/female/holderScreen.dart';
import 'package:get/get.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:String/screens/Auth/authIntroScreen.dart';
import 'package:String/screens/Auth/createAccount.dart';
import 'package:String/screens/Auth/dateOfBirth.dart';
import 'package:String/screens/Auth/genderScreen.dart';
import 'package:String/screens/Auth/imageUploadSuccess.dart';
import 'package:String/screens/Auth/photoScreen.dart';
import 'package:String/screens/Auth/signinScreen.dart';
import 'package:String/screens/Auth/signupScreen.dart';
import 'package:String/screens/Auth/userNameScreen.dart';
import 'package:String/screens/Auth/verifyEmail.dart';
import 'package:String/screens/Main/Home/MatchProfile/matchProfileScreen.dart';
import 'package:String/screens/Main/Profile/preferencesScreen.dart';
import 'package:String/screens/Main/Profile/Settings/settingsScreen.dart';
import 'package:String/screens/Main/Profile/Settings/stringPremium.dart';
import 'package:String/screens/Main/holderScreen.dart';
import 'package:String/screens/Onboarding/OnboardingScreens.dart';
import '../screens/Auth/forgotPasswordScreen.dart';
import '../screens/Auth/enterPasswordScreen.dart';
import '../screens/Main/Chat/chatRoom.dart';
import '../screens/Main/Profile/editProfile.dart';
import '../screens/Splash/splashScreen.dart';

// ================ APP ROUTES ===============

List<GetPage> getPage = [

  // SPLASH SCREEN
  GetPage(
    name: splashScreen, 
    page: ()=> SplashScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),

  // ONBOARDING SCREEN 
  GetPage(
    name: onboardingScreens, 
    page: ()=> OnboardingScreens(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),

  // AUTH SCREENS
  GetPage(
    name: authIntroScreen, 
    page: ()=> AuthIntroScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: createAccount, 
    page: ()=> CreateAccount(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: signupScreen, 
    page: ()=> SignUpScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: signinScreen, 
    page: ()=> SignInScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: userNameScreen, 
    page: ()=> UserNameScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 
  GetPage(
    name: genderScreen, 
    page: ()=> GenderScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: dateOfBirth, 
    page: ()=> DateOfBirthScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: photoScreen, 
    page: ()=> PhotoScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ), 
  GetPage(
    name: verifyEmailScreen, 
    page: ()=> VerifyEmailScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 
  GetPage(
    name: imageUploadSuccess, 
    page: ()=> ImageUploadSuccess(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 
  GetPage(
    name: forgotPasswordScreen, 
    page: ()=> ForgotPasswordScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 
  GetPage(
    name: enterPasswordScreen, 
    page: ()=> ResetPasswordScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 
  GetPage(
    name: otpVerificationScreen, 
    page: ()=> OtpVerificationScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 

  // Main Screen 
  GetPage(
    name: holderScreen, 
    page: ()=> HolderScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  
  GetPage(
    name: matchProfileScreen, 
    page: ()=> MatchProfileScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 2)
  ), 
  GetPage(
    name: stringPremium, 
    page: ()=> StringPremiumScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  
  GetPage(
    name: settingsScreen, 
    page: ()=> SettingScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  
  GetPage(
    name: preferencesScreen, 
    page: ()=> PreferencesScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  

  GetPage(
    name: chatRoom, 
    page: ()=> ChatRoom(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  

  GetPage(
    name: editProfile, 
    page: ()=> EditProfileScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  

  GetPage(
    name: femaleHoldersScreen, 
    page: ()=> FemaleHolderScreen(),
    transition: Transition.cupertino,
    transitionDuration: const Duration(seconds: 1)
  ),  




];