import 'package:assignmentcopy/pages/confirmation.dart';
import 'package:assignmentcopy/pages/home.dart';
import 'package:assignmentcopy/pages/loading.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(

  initialRoute: '/',
  routes: {
    '/': (context)=>Loading(),
    '/home': (context)=>Home(),
    '/confirmation': (context)=> Confirmation(),
  },
));