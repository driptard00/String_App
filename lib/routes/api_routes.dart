// ================== API ROUTE =================

// BASE URL
String baseUrl = "https://string-backend-8df798bd9174.herokuapp.com";

// AUTH ROUTE
String signUpUserRoute = "/api/auth/signup"; // SIGN UP USER ROUTE
String loginUserRoute = "/api/auth/login"; // LOGIN USER ROUTE
String verifyEmailRoute = "/api/auth/verify";  // VERIFY EMAIL ROUTE
String forgotPasswordRoute = "/api/auth/forgotpassword"; // FORGOT PASSWORD ROUTE
String resendVerification = "/api/auth/resendverification"; // RESEND OTP
String logoutRoute = "/api/auth/logout"; // LOGOUT ROUTE

// USER ROUTE
String getAllUsersRoute = "/api/user/getusers"; // GET ALL USERS ROUTE
String likeUserRoute = "/api/user/"; // LIKE USER ROUTE
String unLikeUserRoute = "/api/user/"; // UNLIKE USER ROUTE

// PROFILE ROUTE
String getProfileRoute = "/api/user/getprofile/"; // GET USER PROFILE ROUTE
String addImageRoute = "/api/user/add/"; // SET USER IMAGE ROUTE
String createProfileRoute = "/api/user/createprofile/"; // CREATE USER PROFILE ROUTE
String deleteUserRoute = "/api/user/deleteprofile/"; // CREATE MESSAGE ROUTE
String editProfileImageRoute = "/api/user/edit/"; // RESEND OTP

// CHAT ROUTES
String getConversationsRoute = "/api/chat/chats"; // GET CONVERSATIONS ROUTE
String createChatRoute = "/api/chat/create"; // CREATE CHAT
String createMessageRoute = "/api/message"; // CREATE MESSAGE ROUTE
String loadMessageRoute = "/api/message/"; // LOAD MESSAGES ROUTE
String sendAsSeenMessageRoute = "/api/message/"; // LOAD MESSAGES ROUTE

// HEART TOP UP ROUTE
String heartTopUpRoute = "/api/payment/top/"; // HEART TOP UP ROUT
String verifyPaymentRoute = "/api/payment/verify/"; // VERIFY PAYMENT ROUTE

// FCM ROUTE
String updateFcmRoute = "/api/user/update-fcm-token";