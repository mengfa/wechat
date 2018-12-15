import 'package:flutter/material.dart';

import './home/home_screen.dart';

void main() => runApp(MaterialApp(
  title: '微信',
  theme: ThemeData(
    primaryColor: Color(0xff303030)
  ),
  home: HomeScreen(),
));

