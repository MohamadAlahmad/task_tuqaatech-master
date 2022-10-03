import 'package:flutter/material.dart';

class Globals {
  static final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

  static Map<int, Color> colorCodes = {
    50: const Color.fromRGBO(237, 111, 26, 0.1),
    100: const Color.fromRGBO(237, 111, 26, 0.2),
    200: const Color.fromRGBO(237, 111, 26, 0.3),
    300: const Color.fromRGBO(237, 111, 26, 0.4),
    400: const Color.fromRGBO(237, 111, 26, 0.5),
    500: const Color.fromRGBO(237, 111, 26, 0.6),
    600: const Color.fromRGBO(237, 111, 26, 0.7),
    700: const Color.fromRGBO(237, 111, 26, 0.8),
    800: const Color.fromRGBO(237, 111, 26, 0.9),
    900: const Color.fromRGBO(237, 111, 26, 1),
  };

  static MaterialColor orangeColor = MaterialColor(0xFFED6F1A, colorCodes);
  static Map<int, Color> colorCodesgreyColor = {
    50: const Color.fromRGBO(45, 45, 46, 0.1),
    100: const Color.fromRGBO(45, 45, 46, 0.2),
    200: const Color.fromRGBO(45, 45, 46, 0.3),
    300: const Color.fromRGBO(45, 45, 46, 0.4),
    400: const Color.fromRGBO(45, 45, 46, 0.5),
    500: const Color.fromRGBO(45, 45, 46, 0.6),
    600: const Color.fromRGBO(45, 45, 46, 0.7),
    700: const Color.fromRGBO(45, 45, 46, 0.8),
    800: const Color.fromRGBO(45, 45, 46, 0.9),
    900: const Color.fromRGBO(45, 45, 46, 1),
  };

  static MaterialColor greyColor =
      MaterialColor(0xFF2D2D2E, colorCodesgreyColor);

  // static Color greyColor = const Color(0xFF2D2D2E);
  static Color backgroundColor = const Color(0xFFF2F1F0);

  static final theme = ThemeData(
    primarySwatch: greyColor,
    unselectedWidgetColor: greyColor,
    textTheme: TextTheme(
        displaySmall: const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600),
        displayMedium: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        displayLarge: const TextStyle(
            color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        titleSmall: TextStyle(
            color: greyColor, fontSize: 18, fontWeight: FontWeight.bold),
        titleMedium: TextStyle(
            color: greyColor, fontSize: 22, fontWeight: FontWeight.bold),
        titleLarge: TextStyle(
            color: greyColor, fontSize: 38, fontWeight: FontWeight.bold)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 6),
      alignLabelWithHint: true,
      hintStyle: TextStyle(
          color: greyColor.withOpacity(0.5),
          fontSize: 16.0,
          fontWeight: FontWeight.bold),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: greyColor)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: greyColor)),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(width: 2, color: greyColor)),
      labelStyle: TextStyle(
          color: greyColor, fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    appBarTheme: AppBarTheme(
        color: orangeColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        centerTitle: true,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 28 , fontWeight: FontWeight.bold)),
    buttonTheme: ButtonThemeData(
      padding: EdgeInsets.zero,
      minWidth: double.infinity,
      height: 50,
      buttonColor: orangeColor,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  );
}

class MyAssets {
  static const String background = 'assets/img/background.png';
  static const String backgroundWithWhite = 'assets/img/background1.png';
  static const String background_welcome = 'assets/img/background_welcome.png';
  static const String welcome = 'assets/img/welcome.svg';
  //SVG ICONS

  static const String date = '''<svg id="calendar-date-fill" xmlns="http://www.w3.org/2000/svg" width="23.33" height="23.33" viewBox="0 0 23.33 23.33">
  <path id="Path_5155" data-name="Path 5155" d="M5.833.729a.729.729,0,0,0-1.458,0v.729H2.916A2.916,2.916,0,0,0,0,4.374V5.833H23.33V4.374a2.916,2.916,0,0,0-2.916-2.916H18.956V.729a.729.729,0,0,0-1.458,0v.729H5.833ZM0,7.291H23.33V20.414a2.916,2.916,0,0,1-2.916,2.916H2.916A2.916,2.916,0,0,1,0,20.414ZM13.613,18.649A2.318,2.318,0,0,1,11.13,16.6h1a1.445,1.445,0,0,0,1.533,1.2c1.231,0,1.9-1.236,1.9-3.155h-.04A2.033,2.033,0,0,1,13.5,15.79a2.418,2.418,0,0,1-2.444-2.581,2.563,2.563,0,0,1,2.62-2.638c1.709,0,2.848,1.07,2.848,3.89,0,2.632-1.082,4.186-2.916,4.186Zm.1-3.709a1.709,1.709,0,0,0,1.726-1.721,1.624,1.624,0,0,0-1.691-1.794,1.649,1.649,0,0,0-1.7,1.765,1.605,1.605,0,0,0,1.668,1.75ZM9.4,10.725V18.5H8.413V11.778H8.4c-.423.227-1.288.758-1.834,1.133V11.9a18.373,18.373,0,0,1,1.914-1.174H9.4Z" transform="translate(0)" fill="#2d2d2d" fill-rule="evenodd"/>
</svg>
''';

  static const String message =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30">
  <path id="bxs-message-detail" d="M30,3H6A3,3,0,0,0,3,5.988V24.012A3,3,0,0,0,6,27h4.5v6l9.527-6H30a3,3,0,0,0,3-2.988V5.988A3,3,0,0,0,30,3ZM21,19.5H10.5v-3H21Zm4.5-6h-15v-3h15Z" transform="translate(-3 -3)" fill="#2d2d2d"/>
</svg>
''';

  static const String search =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 36 36">
  <path id="search" d="M24.923,15.231a9.334,9.334,0,0,0-2.845-6.847,9.338,9.338,0,0,0-6.847-2.846A9.332,9.332,0,0,0,8.383,8.383a9.332,9.332,0,0,0-2.845,6.848,9.339,9.339,0,0,0,2.845,6.847,9.333,9.333,0,0,0,6.848,2.845,9.33,9.33,0,0,0,6.847-2.845A9.344,9.344,0,0,0,24.923,15.231ZM36,33.231A2.807,2.807,0,0,1,33.231,36a2.571,2.571,0,0,1-1.947-.822l-7.421-7.4a14.815,14.815,0,0,1-8.632,2.683,14.961,14.961,0,0,1-5.917-1.2A14.912,14.912,0,0,1,1.2,21.148a15.176,15.176,0,0,1,0-11.834A14.912,14.912,0,0,1,9.314,1.2a15.176,15.176,0,0,1,11.834,0,14.912,14.912,0,0,1,8.113,8.113,14.943,14.943,0,0,1,1.2,5.917,14.812,14.812,0,0,1-2.683,8.632L35.2,31.284A2.65,2.65,0,0,1,36,33.231Z" fill="#f2f2f2"/>
</svg>
''';

  static const String home =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="24.825" height="27.242" viewBox="0 0 24.825 27.242">
  <path id="home" d="M30.062,13.626l-11.7-9.058a.9.9,0,0,0-1.116.009L5.926,13.635a.9.9,0,0,0-.338.7v16.38a.9.9,0,0,0,.9.9h6.731a.9.9,0,0,0,.9-.9V20.69h7.754V30.719a.9.9,0,0,0,.9.9h6.732a.9.9,0,0,0,.9-.9V14.339a.9.9,0,0,0-.35-.713Z" transform="translate(-5.588 -4.379)" fill="#ff6f00"/>
</svg>
''';

  static const String arrow =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="15.893" height="9.532" viewBox="0 0 15.893 9.532">
  <path id="arrow-down-b" d="M6.894,12.477l.09.1,6.755,7.773a1.256,1.256,0,0,0,.954.427,1.273,1.273,0,0,0,.954-.427L22.395,12.6l.114-.129a.766.766,0,0,0,.134-.432.8.8,0,0,0-.824-.785H7.574a.8.8,0,0,0-.824.785.757.757,0,0,0,.144.442Z" transform="translate(-6.75 -11.249)"/>
</svg>
''';
  static const String editImage =
      '''<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 32.96 32.63"><defs><style>.cls-1,.cls-2{fill:#2d2d2d;}.cls-2{fill-rule:evenodd;}</style></defs><g id="Layer_2" data-name="Layer 2"><g id="Layer_1-2" data-name="Layer 1"><path class="cls-1" d="M28.69,8.77l-4.5-4.5L8.86,19.6a1.16,1.16,0,0,0-.27.44L6.78,25.47a.57.57,0,0,0,.14.58.55.55,0,0,0,.57.13l5.43-1.81a1.05,1.05,0,0,0,.44-.27L28.69,8.77Zm3.94-5.53a1.12,1.12,0,0,1,0,1.59L30.28,7.18l-4.5-4.5L28.13.33a1.12,1.12,0,0,1,1.59,0l2.91,2.91Z"/><path class="cls-2" d="M0,29.25a3.38,3.38,0,0,0,3.38,3.38H28.13a3.38,3.38,0,0,0,3.37-3.38V15.75a1.13,1.13,0,0,0-2.25,0v13.5a1.13,1.13,0,0,1-1.12,1.13H3.38a1.13,1.13,0,0,1-1.13-1.13V4.5A1.12,1.12,0,0,1,3.38,3.38H18a1.13,1.13,0,1,0,0-2.25H3.38A3.37,3.37,0,0,0,0,4.5Z"/></g></g></svg>''';
  static const String image =
      '''<svg id="image" xmlns="http://www.w3.org/2000/svg" width="36" height="31.5" viewBox="0 0 36 31.5">  <path id="Path_3" data-name="Path 3" d="M31.5,4.5H4.5a2.25,2.25,0,0,0-2.25,2.25v22.5A2.25,2.25,0,0,0,4.5,31.5h27a2.25,2.25,0,0,0,2.25-2.25V6.75A2.25,2.25,0,0,0,31.5,4.5ZM4.5,2.25A4.5,4.5,0,0,0,0,6.75v22.5a4.5,4.5,0,0,0,4.5,4.5h27a4.5,4.5,0,0,0,4.5-4.5V6.75a4.5,4.5,0,0,0-4.5-4.5H4.5Z" transform="translate(-0.005 -2.25)" fill="#2d2d2d" fill-rule="evenodd"/>  <path id="Path_4" data-name="Path 4" d="M23.958,17.2a1.125,1.125,0,0,1,1.3-.209l8.5,4.381V31.5H2.255V27l5.954-5.3a1.125,1.125,0,0,1,1.417-.14l5.985,3.989,8.348-8.348Z" transform="translate(-0.005 -2.25)" fill="#2d2d2d"/>  <path id="Path_5" data-name="Path 5" d="M10.13,15.75a3.375,3.375,0,1,0-3.375-3.375A3.375,3.375,0,0,0,10.13,15.75Z" transform="translate(-0.005 -2.25)" fill="#2d2d2d" fill-rule="evenodd"/></svg>''';
  static const String password =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="22.417" height="12.236" viewBox="0 0 22.417 12.236">  <path id="key" d="M11.9,8.944H22.417v4.11H20.41v4.063H16.3V13.054H11.9A6.305,6.305,0,0,1,9.656,15.97a5.867,5.867,0,0,1-3.537,1.147,5.9,5.9,0,0,1-4.326-1.792A5.894,5.894,0,0,1,0,11,5.9,5.9,0,0,1,1.792,6.673,5.9,5.9,0,0,1,6.118,4.881,5.867,5.867,0,0,1,9.655,6.028,6.305,6.305,0,0,1,11.9,8.944Zm-5.783,4.11A2.039,2.039,0,0,0,8.173,11,2.04,2.04,0,0,0,6.118,8.944,2.04,2.04,0,0,0,4.063,11a2.04,2.04,0,0,0,2.055,2.055Z" transform="translate(0 -4.881)" fill="rgba(45,45,45,0.5)"/></svg>''';
  static const String check =
      '<svg xmlns="http://www.w3.org/2000/svg" width="8.84" height="7.034" viewBox="0 0 8.84 7.034">  <g id="check" transform="translate(-9.182 -10.676)">    <path id="Path_1" data-name="Path 1" d="M16.632,10.919a.811.811,0,1,1,1.158,1.136l-4.317,5.4a.811.811,0,0,1-1.168.022L9.445,14.611a.811.811,0,1,1,1.146-1.146l2.265,2.263,3.755-4.785.022-.024Z" fill="#f2f2f2" fill-rule="evenodd"/>  </g></svg>';
  static const String email =
      '''<svg xmlns="http://www.w3.org/2000/svg" width="22.417" height="17.955" viewBox="0 0 22.417 17.955"><path id="email" d="M20.16,1.75a2.24,2.24,0,0,1,2.257,2.257v13.44A2.241,2.241,0,0,1,20.16,19.7H2.257a2.179,2.179,0,0,1-1.6-.656A2.176,2.176,0,0,1,0,17.448V4.007a2.179,2.179,0,0,1,.656-1.6,2.176,2.176,0,0,1,1.6-.656Zm0,4.515V4.007L11.182,9.625,2.257,4.007V6.265l8.925,5.565Z" transform="translate(0 -1.75)" fill="#2d2d2d"/></svg>''';

//
}

class MyStrings {
  static const String title = 'Task Tuqaatech';
  static const String welcome = 'Welcome';
  static const String login2Continue = 'Please login to continue';
  static const String login = 'Login';
  static const String signup = 'Signup';
  static const String cannotLaunchUri = "Cann't launch the url";
  static const String noPermission = "No permission";
  static const String error = "An error accourd";
  static const String between =  "Between";
  static const String to =  "To";
  static const String date = "Date: / / ";

//FOOTER
  static const String haveAccount = 'Already have an account ? ';
  static const String dontHaveAccount = "Doesn't have an account ";
  static const String createAccount = 'Create account';

//SIGNIN
  static const String email = 'Email';
  static const String password = 'Password';
  static const String rememberMe = 'Remember me';
//SIGNUP
  static const String name = 'Name';
  static const String age = 'Age';
  static const String gender = 'Gender';
  static const String country = 'Country';
  static const String city = 'City';
  static const String phone = 'Phone number';
  static const String rePassword = 'Reenter password';
//
//
}
