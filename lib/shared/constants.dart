import 'package:flutter/material.dart';

const textInputDecoration= InputDecoration(
  fillColor: Colors.white,
  filled: true,
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
    ),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.pink,
    ),
    borderRadius: BorderRadius.all(Radius.circular(28.0)),
  ),
  isDense: true,
  contentPadding: EdgeInsets.all(12.0),
);

