import 'dart:io';

import 'package:flutter/material.dart';

class Appcolors {
  static Color primaryColor = Colors.brown;
  static Color secondaryColor = Colors.brown;
}

class Contact {
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? phone_num;
  final File? image;
  Contact({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.phone_num,
    required this.image,
  });
}
