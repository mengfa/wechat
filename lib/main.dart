import 'package:flutter/material.dart';
import 'constants.dart' show AppColors;
import './home/home_screen.dart';

void main() => runApp(Center(
  child:   MaterialApp(
        title: '微信',
        theme: ThemeData.light().copyWith(
            primaryColor: Color(AppColors.AppBarColor),
            cardColor: Color(AppColors.AppBarColor)),
        home: HomeScreen(),
      ),
));
