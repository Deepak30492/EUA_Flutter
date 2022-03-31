import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uhi_eua_flutter_app/theme/theme.dart';

class AppShadows {
  static List<BoxShadow> shadow1 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.10),
      blurRadius: 10,
      offset: const Offset(2, 2),
    ),
  ];

  static List<BoxShadow> shodow2 = [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 4.0,
      offset: const Offset(2.0, 2.0),
    ),
  ];
}
