import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  Random random = Random();
  return Color.fromARGB(random.nextInt(100), random.nextInt(255),
      random.nextInt(255), random.nextInt(255));
}
