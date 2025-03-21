import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../responsive.dart';

ButtonStyle buttonStyle(context) {
  return TextButton.styleFrom(
    padding: EdgeInsets.symmetric(
      horizontal: defaultPadding * 1.5,
      vertical: defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
    ),
  );
}

ThemeData ThemeDark(context) {
  return ThemeData.dark().copyWith(
      useMaterial3: false,
      // backgroundColor: bgColor,
      dialogTheme: DialogTheme(backgroundColor: bgColor),
      scaffoldBackgroundColor: bgColor,
      textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
          .apply(
              fontFamily: 'Regular',
              bodyColor: Colors.white,
              displayColor: Colors.white70),
      canvasColor: secondaryColor,
      cardColor: secondaryColor,
      dividerColor: secondaryColor,
      cardTheme: const CardTheme(
        elevation: 5.0,
        color: secondaryColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))), //设置圆角
      ),
      iconTheme: IconTheme.of(context).copyWith(
        color: Colors.white54,
        size: 18,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
        foregroundColor: Colors.blue, // 设置按钮文本颜色为蓝色
      )),
      drawerTheme: DrawerTheme.of(context).copyWith(scrimColor: Colors.blue),
      buttonTheme: ButtonTheme.of(context).copyWith(buttonColor: Colors.blue),
      inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(foregroundColor:Colors.white,backgroundColor: Colors.blue )),
  );
}

ThemeData ThemeLight(context) {
  return ThemeData.light().copyWith(
    useMaterial3: false,
    dialogTheme: DialogTheme(backgroundColor: Colors.white),
    scaffoldBackgroundColor: Colors.white,
    canvasColor:  Colors.white,
    cardColor: Colors.white,
    dividerColor: Colors.white60,
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
      fontFamily: 'Regular',
      //bodyColor: Colors.black,
      //displayColor: Colors.black45,
    ),
    iconTheme: IconTheme.of(context).copyWith(
      color: Colors.black54,
      size: 18,
    ),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.blue, // 设置按钮文本颜色为蓝色
        )),
    cardTheme: const CardTheme(
      elevation: 5.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))), //设置圆角
    ),
    drawerTheme: DrawerTheme.of(context).copyWith(scrimColor: Colors.blue),
    buttonTheme: ButtonTheme.of(context).copyWith(buttonColor: Colors.blue),
    inputDecorationTheme: InputDecorationTheme(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(foregroundColor:Colors.white,backgroundColor: Colors.blue )),
  );
}

const outlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(width: 1, color: Colors.blueGrey),
  borderRadius: BorderRadius.all(Radius.circular(defaultPadding / 2)),
);

