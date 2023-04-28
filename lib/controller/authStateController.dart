import 'dart:convert';
import 'dart:io';

import 'package:String/storage/secureStorage.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:dio/dio.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:String/model/userModel.dart';
import 'package:String/routes/api_routes.dart';
import 'package:String/routes/app_route_names.dart';
import 'package:String/screens/Onboarding/onboardingScreen1.dart';
import 'package:String/screens/Onboarding/onboardingScreen2.dart';
import 'package:String/screens/Onboarding/onboardingScreen3.dart';
import 'package:String/services/api_services.dart';

class AuthStateController extends GetxController{
  // Instant Variables
  String _firstname = "";
  String _lastname = "";
  String _email = "";
  String _emailDelete = "";
  String _password = "";
  String _passwordConfirm = "";

  String _bio = "";
  String _status = "";
  String _height = "";
  String _haircolor = "";
  String _occupation = "";
  String _interests = "";
  String _kids = "";  

  String _location = "";

  String _otp = "";

  bool _isLoading = false;
  bool _hidePassword = true;

  bool _locationOn = false;

  final List<String> _genders = [
    "male",
    "female"
  ];
  final List<String> _datings = [
    "man",
    "woman",
  ];

  File? _selectedImage1;
  File? _selectedImage2;
  File? _selectedImage3;
  File? _selectedImage4;
  File? _selectedImage5;
  File? _selectedImage6;

  List<dynamic> _imageUrls = [];

  int _selectedGender = 0;
  int _selectedDating = 0;

  int _selectedIndex = 0;
  final List<Widget> _onboardingScreens = [
    OnboardingScreen1(),
    OnboardingScreen2(),
    OnboardingScreen3()
  ];

  String _dateOfBirth = "";

  final FlutterSecureStorage _flutterSecureStorage = const FlutterSecureStorage();

  final ImagePicker _imagePicker = ImagePicker();

  MyUser _user = MyUser();

  TextEditingController _dateController = TextEditingController();

  TextEditingController _genderController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _hairColorController = TextEditingController();
  TextEditingController _kidsController = TextEditingController();
  TextEditingController _occupationController = TextEditingController();
  TextEditingController _interestController = TextEditingController();
  TextEditingController _datingController = TextEditingController();
  TextEditingController _statusController= TextEditingController();

  SwiperController _swiperController = SwiperController();

  List<dynamic> _users = [
    // {
    //   "name": "Akintade Oluwaseun",
    //   "image": "images/male1.png",
    //   "age": "18",
    //   "distance": "6km away",
    //   "occupation": "Product Designer at google inc.",
    //   "state": "Canada, Toronto",
    //   "bio": "I love to sing and have fun with my friends. I am also a fan of movies and sex",
    //   "gender": "Male"
    // },
    // {
    //   "name": "Micheal Faraday",
    //   "image": "images/male2.png",
    //   "age": "68",
    //   "distance": "6m away",
    //   "occupation": "Tour Operator at Yes sir tours",
    //   "state": "Wuse, Miami",
    //   "bio": "I love to sing and have fun with my friends. I am also a fan of movies and sex",
    //   "gender": "Male"
    // },
    // {
    //   "name": "Jacob David",
    //   "image": "images/female1.png",
    //   "age": "23",
    //   "distance": "40km away",
    //   "occupation": "Weed Expert at Loud inc",
    //   "state": "Kenya, Toronto",
    //   "bio": "I love to sing and have fun with my friends. I am also a fan of movies and sex",
    //   "gender": "Female"
    // },
    // {
    //   "name": "Godwin Onoja",
    //   "image": "images/female2.png",
    //   "age": "58",
    //   "distance": "6km away",
    //   "occupation": "Django Developer at Jehtad Tech",
    //   "state": "Lagos, Nigeria",
    //   "bio": "I love to sing and have fun with my friends. I am also a fan of movies and sex",
    //   "gender": "Female"
    // },
  ];

  List<dynamic> _activeUserDating = [];

  List<dynamic> _female = [];

  List<dynamic> _male = [];

  List<dynamic> _likedUsers = [];

  List<dynamic> _likedMeUsers = [];

  List<dynamic> _matchedUsers = [];

  final cloudinary = Cloudinary.full(
    apiKey: "729881695894599",
    apiSecret: "iQLHhe3p7GDeb9qxVufzYLMO_G8",
    cloudName: "dxy0fr9yu",
  );

  // Getters
  int get selectedIndex => _selectedIndex;
  List<Widget> get onboardingScreens => _onboardingScreens;
  String get firstname => _firstname;
  String get lastname => _lastname;
  String get email => _email;
  String get emailDelete => _emailDelete;
  String get password => _password;
  String get passwordConfirm => _passwordConfirm;
  String get dateOfBirth => _dateOfBirth;
  String get bio => _bio;
  String get status => _status;
  String get height => _height;
  String get haircolor => _haircolor;
  String get occupation => _occupation;
  String get interests => _interests;
  String get kids => _kids;
  String get location => _location;

  int get userItemIndex => _userItemIndex;

  int _userItemIndex = 0;

  bool get isLoading => _isLoading;
  bool get hidePassword => _hidePassword;

  bool get locationOn => _locationOn;

  File? get selectedImage1 => _selectedImage1;
  File? get selectedImage2 => _selectedImage2;
  File? get selectedImage3 => _selectedImage3;
  File? get selectedImage4 => _selectedImage4;
  File? get selectedImage5 => _selectedImage5;
  File? get selectedImage6 => _selectedImage6;

  List get imageUrls => _imageUrls;


  FlutterSecureStorage get flutterSecureStorage => _flutterSecureStorage;
  ImagePicker get imagePicker => _imagePicker;

  SwiperController get swiperController => _swiperController;

  TextEditingController get nameController => _genderController;
  TextEditingController get bioController => _bioController;
  TextEditingController get heightController => _heightController;
  TextEditingController get hairColorController => _hairColorController;
  TextEditingController get kidsController => _kidsController;
  TextEditingController get occupationController => _occupationController;
  TextEditingController get interestsController => _interestController;
  TextEditingController get datingController => _datingController;
  TextEditingController get statusController => _statusController;

  List get genders => _genders;
  List get datings => _datings;

  String get otp => _otp;

  int get selectedGender => _selectedGender;
  int get selectedDating => _selectedDating;

  MyUser get user => _user;

  TextEditingController get dateController => _dateController;

  List get users => _users;

  List get activeUserDating => _activeUserDating;

  List get female => _female;

  List get male => _male;

  List get likedUsers => _likedUsers;

  List get likedMeUsers => _likedMeUsers;

  List get matchedUsers => _matchedUsers;

  // Setters
  updateFirstname(value) {
    _firstname = value;
    update();
  }  
  updateLastname(value) {
    _lastname = value;
    update();
  }  
  updateEmail(value) {
    _email = value;
    update();
  }
  updateEmailDelete(value) {
    _emailDelete = value;
    update();
  }  
  updatePassword(value) {
    _password = value;
    update();
  }
  updatePasswordConfirm(value) {
    _passwordConfirm = value;
    update();
  }
  updateSelectedIndex(value) {
    _selectedIndex = value;
    update();
  }
  updateSelectedGender(value) {
    _selectedGender = value;
    update();
  }
  updateSelectedDating(value) {
    _selectedDating = value;
    update();
  }
  updateSelectedDate(value) {
    _dateOfBirth = value;
    update();
  }
  updateSelectedImage1(value) {
    _selectedImage1 = value;
    update();
  }
  updateSelectedImage2(value) {
    _selectedImage2 = value;
    update();
  }
  updateSelectedImage3(value) {
    _selectedImage3 = value;
    update();
  }
  updateSelectedImage4(value) {
    _selectedImage4 = value;
    update();
  }
  updateSelectedImage5(value) {
    _selectedImage5 = value;
    update();
  }
  updateSelectedImage6(value) {
    _selectedImage6 = value;
    update();
  }
  updateImageUrls(value) {
    _imageUrls.add(value);
    update();
  }
  updaterUserItemIndex(value) {
    _userItemIndex = value;
    print("USERITEMINDEX$_userItemIndex");
    update();
  }
  updateActiveUserDating(value){
    _activeUserDating = value;
    update();
  }
  updateIsLoading(value) {
    _isLoading = value;
    update();
  }
  toggleHidePassword() {
    _hidePassword = !_hidePassword;
    update();
  }
  toggleLocation() {
    _locationOn = !_locationOn;
    update();
  }
  updateLocation(value) {
    _location = value;
    update();
  }
  removeUser(int index) {
    _male.removeAt(index);
    // _swiperController.next();
    update();
  }
  updateUsersList(value) {
    _users = value;
    update();
  }
  updateFemaleUsers(value) {
    _female = value;
    update();
  }
  updateMaleUsers(value) {
    _male = value;
    update();
  }
  updateLikedUsers(value) {
    _likedUsers = value;
    update();
  }
  updateBio(value) {
    _bio = value;
    update();
  }
  updateHeight(value) {
    _height = value;
    update();
  }
  updateHairColor(value) {
    _haircolor = value;
    update();
  }
  updateKids(value) {
    _kids = value;
    update();
  }
  updateOccupation(value) {
    _occupation = value;
    update();
  }
  updateInterests(value) {
    _interests = value;
    update();
  }
  updateStatus(value) {
    _status = value;
    update();
  }
  updateOtp(value) {
    _otp = value;
    update();
  }


  // Date Picker
  Future<void> showDateTimePicker (BuildContext context) async{
    var dob = await showDatePicker(
      context: context, 
      initialDate: (_dateOfBirth != "") ? 
      (DateTime.parse(_dateOfBirth)) : 
      (DateTime.now()),
      firstDate: DateTime(1950, 01, 01), 
      lastDate: DateTime(2023, 01, 01).add(const Duration(days: 365)),
      builder:(context, child) => Theme(
        data: ThemeData().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Color(0xffFEDC00),
            onPrimary: Colors.black,
            surface: Color(0xffFEDC00),
            onSurface: Colors.black,
          )
        ), 
        child: child!
      ),
    );
    if(dob != null){
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      String formattedDate = dateFormat.format(dob);

      updateSelectedDate(formattedDate);
      _dateController.text = formattedDate;

       update();
    }
  }

  // CALCULATE AGE
  int calculateAge(String dateOfBirth) {
    DateTime dob = DateTime.parse(dateOfBirth);
    DateTime currentDate = DateTime.now();
    Duration difference = currentDate.difference(dob);
    int age = (difference.inDays / 365.25).floor();
    return age;
  }

  // GET IMAGE
  Future<void> getImageOne(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,
      );
      if (_pickedImage != null) {
        updateSelectedImage1(File(_pickedImage.path));
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: selectedImage1!.path,
            fileBytes: selectedImage1!.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
          )
        );
        if(response.isSuccessful) {
          print('Get your image from with ${response.secureUrl}'); 
          updateImageUrls(response.secureUrl); 
        }

      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }

    update();
  }

  // GET IMAGE TWO
  Future<void> getImageTwo(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,
      );
      if (_pickedImage != null) {
        updateSelectedImage2(File(_pickedImage.path));
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: selectedImage2!.path,
            fileBytes: selectedImage2!.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
          )
        );
        if(response.isSuccessful) {
          print('Get your image from with ${response.secureUrl}'); 
          updateImageUrls(response.secureUrl); 
        }
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // GET IMAGE THREE
  Future<void> getImageThree(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,

      );
      if (_pickedImage != null) {
        updateSelectedImage3(File(_pickedImage.path));
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: selectedImage3!.path,
            fileBytes: selectedImage3!.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
          )
        );
        if(response.isSuccessful) {
          print('Get your image from with ${response.secureUrl}'); 
          updateImageUrls(response.secureUrl); 
        }
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // GET IMAGE FOUR
  Future<void> getImageFour(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,
      );
      if (_pickedImage != null) {
        updateSelectedImage4(File(_pickedImage.path));
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: selectedImage4!.path,
            fileBytes: selectedImage4!.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
          )
        );
        if(response.isSuccessful) {
          print('Get your image from with ${response.secureUrl}'); 
          updateImageUrls(response.secureUrl); 
        }
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // GET IMAGE FIVE
  Future<void> getImageFive(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,
      );
      if (_pickedImage != null) {
        updateSelectedImage5(File(_pickedImage.path));
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: selectedImage5!.path,
            fileBytes: selectedImage5!.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
          )
        );
        if(response.isSuccessful) {
          print('Get your image from with ${response.secureUrl}'); 
          updateImageUrls(response.secureUrl); 
        }
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // GET IMAGE SIX
  Future<void> getImageSix(ImageSource imageSource) async {
    try {
      var _pickedImage = await _imagePicker.pickImage(
        source: imageSource,

      );
      if (_pickedImage != null) {
        updateSelectedImage6(File(_pickedImage.path));
        final response = await cloudinary.uploadResource(
          CloudinaryUploadResource(
            filePath: selectedImage6!.path,
            fileBytes: selectedImage6!.readAsBytesSync(),
            resourceType: CloudinaryResourceType.image,
          )
        );
        if(response.isSuccessful) {
          print('Get your image from with ${response.secureUrl}'); 
          updateImageUrls(response.secureUrl); 
        }
      } else {
        Fluttertoast.showToast(
          msg: "No image selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 15.0
        );
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // GET LOCATION
  Future<String> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Geolocator.openLocationSettings();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately. 
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    String locationName = '${placemarks.first.locality}, ${placemarks.first.country}';

    updateLocation(locationName);

    print(locationName);

    return locationName;
  }

  // Google Sign up
  // Future<void> signUpWithGoogle() async{
  //   // Begin interactive sign in process
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  //   if (gUser == null) {
  //     return;
  //   }

  //   // Obtain auth details from request
  //   final GoogleSignInAuthentication gAuth = await gUser.authentication;

  //   // Create a new credential for user
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken
  //   );

  //   print(credential);

  //   try {
  //     // Finally lets sign in
  //     UserCredential? userCredentials =  await FirebaseAuth.instance.signInWithCredential(credential);
  //     print(userCredentials.user);

  //     if (userCredentials.user != null) {
 
  //       updateFirstname(userCredentials.user!.displayName?.split(" ").first);
  //       updateLastname(userCredentials.user!.displayName?.split(" ").last);
  //       updateEmail(userCredentials.user!.email);

  //       Get.toNamed(enterPasswordScreen);
  //       final GoogleSignInAccount? gUser = await GoogleSignIn().disconnect();
  //     }

  //   } catch (e) {
  //     print(e);
  //   }

  //   update();
  // }

  // SIGN UP USER
  Future<void> signUpUser() async{
    updateIsLoading(true);

    Map<String, dynamic> signUpUserDetails = {
      "name": "$_firstname $_lastname",
      "email": "$_email",
      "password": "$_password",
    };

    print("DETAILS:::$signUpUserDetails");

    var response = await ApiServices.signUpUserService(signUpUserDetails, signUpUserRoute);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");


    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      String userId = responseData["data"]["user"]["_id"];
      String token = responseData["data"]["token"];

      await LocalStorage().storeUserId(userId);
      await LocalStorage().storeUserToken(token);
      
      Fluttertoast.showToast(
        msg: "Sign up Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
      Get.offAllNamed(otpVerificationScreen);
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // LOGIN USER
  Future<void> loginUser() async{
    updateIsLoading(true);

    Map<String, dynamic> loginUserDetails = {
      "email": "$_email",
      "password": "$_password",
    };

    print("DETAILS:::$loginUserDetails");


    var response = await ApiServices.loginUserService(loginUserDetails, loginUserRoute);
    var responseData = response!.data;
    var responseUser = responseData["data"]["user"];


    print("RESPONSEDATA:::$responseData");
    print("RESPONSEUSER:::$responseUser");

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      String userId = responseUser["_id"];
      String token = responseData["token"];
      print(token);

      String userIdMain = await LocalStorage().fetchUserId();
      String tokenMain = await LocalStorage().fetchUserToken();

      if (userIdMain == "" && tokenMain == "") {
        await LocalStorage().storeUserId(userId);
        await LocalStorage().storeUserToken(token);
      } else {
        null;
      }

      Fluttertoast.showToast(
        msg: "Login Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

      (responseData["data"]["user"]["profileSet"])?
      Get.offAllNamed(holderScreen)
      :
      Get.offAllNamed(genderScreen);

    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["error"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }
  
  // SET PROFILE 
  Future<void> createProfile() async{
    updateIsLoading(true);

    Map<String, dynamic> setProfileDetails = {
      "Gender": _genders[_selectedGender],
      "dating": _datings[_selectedDating],
      "dob": _dateOfBirth,
      "bio": _bio,
      "stat": _status,
      "height": _height,
      "haircolor": _haircolor,
      "occupation": _occupation,
      "interests": _interests,
      "kids": _kids,
    };

    print("DETAILS:::$setProfileDetails");

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.createUserProfileService(setProfileDetails, createProfileRoute, userId);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Profile Set Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
      Get.offAllNamed(photoScreen);
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // SET PROFILE 
  Future<void> editProfile() async{
    updateIsLoading(true);

    Map<String, dynamic> setProfileDetails = {
      "Gender": _genderController.text,
      "dating": _datingController.text,
      "dob": _dateController.text,
      "bio": _bioController.text,
      "Status": _statusController.text,
      "height": _heightController.text,
      "haircolor": _hairColorController.text,
      "occupation": _occupationController.text,
      "interests": _interestController.text,
      "kids": _kidsController.text,
    };

    print("DETAILS:::$setProfileDetails");

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.createUserProfileService(setProfileDetails, createProfileRoute, userId);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isSuccess = responseData["status"];

    if(isSuccess){
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: "Profile Saved Successfully!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );

      _user = MyUser.fromMap(responseData["data"]);
      
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

   // SET PROFILE IMAGE
  Future<void> setImage() async{
    updateIsLoading(true);

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.setUserImageService(addImageRoute, userId, _imageUrls);
    var responseData = response!.data;
    print(responseData);
 

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);
      await LocalStorage().deleteUserStorage();
      Get.offAllNamed(imageUploadSuccess);
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["error"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  } 

   // VERIFY EMAIL
  Future<void> verifyEmail() async{
    updateIsLoading(true);

    Map<String, dynamic> _otpDetails = {
      "otpCode": _otp
    };

    var response = await ApiServices.verifyEmailService(_otpDetails, verifyEmailRoute);

    var responseData = response!.data;
    print(responseData);
 
    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);
      await LocalStorage().deleteUserStorage();
      
      Get.offAllNamed(genderScreen);
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["error"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  } 

  // DELETE USER 
  Future<void> deleteUser() async{
    
    updateIsLoading(true);

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.deleteUserService(deleteUserRoute, userId);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isSuccess = responseData["status"];

    if(isSuccess){
      updateIsLoading(false);

      await _flutterSecureStorage.delete(key: "LoggedInUser");

      Fluttertoast.showToast(
        msg: "Delete Successful!!!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
      Get.offAllNamed(signinScreen);
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // FORGOT PASSWORD
  Future<void> forgotPassword() async{
    
    updateIsLoading(true);

    Map<String, dynamic> forgotPasswordDetails = {
      "email": _email
    };

    var response = await ApiServices.forgotPasswordService(forgotPasswordDetails, forgotPasswordRoute);
    var responseData = response!.data;

    print("RESPONSEDATA:::$responseData");

    bool isSuccess = responseData["status"];

    if(isSuccess){
      updateIsLoading(false);

      await _flutterSecureStorage.delete(key: "LoggedInUser");

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }else{
      updateIsLoading(false);

      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }

    update();

  }

  // GET ALL USERS
  Future<void> getAllUser() async{
    updateIsLoading(true);

    var response = await ApiServices.getAllUserService(getAllUsersRoute);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess) {
      updateIsLoading(false);

      List<dynamic> usersData = responseData["data"];

      print(usersData);

      updateUsersList(usersData);

      updateMaleUsers( _users.where((males) => males["Gender"] == "male").toList());

      updateFemaleUsers(_users.where((females) => females["Gender"] == "female").toList());

      (_user.dating == "man") ? 
      (updateActiveUserDating(_male)) : 
      (_user.dating == "woman") ?
      (updateActiveUserDating(_female)) :
      (updateActiveUserDating(_users));

    } else {
      updateIsLoading(false);

      print("No user found");
    }

    update();

  }

  // LIKE USER
  Future<void> likeUser(String otherId) async{

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.likeUserService(likeUserRoute, userId, otherId);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateLikedUsers(responseData["updater"]["likes"]);
      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }

    // UNLIKE USER
  Future<void> disLikeUser(String otherId) async{

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.unLikeUserService(unLikeUserRoute, userId, otherId);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      
      Fluttertoast.showToast(
        msg: responseData["message"],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 15.0
      );
    }
  }

  // LOGOUT AUTH
  Future<void> logoutAuth() async{

    await LocalStorage().deleteUserStorage();

    Fluttertoast.showToast(
      msg: "Logout Successful!!!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 15.0
    );

    Get.offAllNamed(signinScreen);
  }

  // GET USER PROFILE
  Future<void> getUserProfile() async{
    updateIsLoading(true);

    String userId = await LocalStorage().fetchUserId();

    var response = await ApiServices.getUserProfileService(getProfileRoute, userId);
    var responseData = response!.data;

    print(responseData);

    bool isSuccess = responseData["success"];

    if(isSuccess){
      updateIsLoading(false);

      _user = MyUser.fromMap(responseData["data"]);

      _genderController.text = _user.gender!;
      _bioController.text = _user.bio!;
      _heightController.text = _user.height!;
      _hairColorController.text = _user.haircolor!;
      _kidsController.text = _user.kids!;
      _occupationController.text = _user.occupation!;
      _interestController.text = _user.interests!;
      _datingController.text = _user.dating!;
      _dateController.text = _user.dob!.toString().split(" ").first;
      _statusController.text = _user.status!;

      updateLikedUsers(responseData["data"]["likes"]);

      print("LIKED USERS: ${responseData["data"]["likes"]}");

      update();
    }
  }

}