import 'package:flutter/material.dart';

const kGreen = Color(0xFF009639);
const kGold = Color(0xFFFFB800);

final kariakooTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: kGreen, primary: kGreen),
  useMaterial3: true,
  scaffoldBackgroundColor: const Color(0xFFF5F5F7),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: Colors.white,
    centerTitle: false,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  ),
);
