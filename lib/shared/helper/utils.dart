// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:html_unescape/html_unescape.dart';
// import 'package:intl/intl.dart';
// import 'package:sumbermarket/modules/screen_navigator/bloc/screen_navigation_bloc.dart';
// import 'package:sumbermarket/widgets/widgets.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../shared.dart';

import 'package:flutter/material.dart';

class Utils {
  static Color getLevelColor(String value) {
    switch (value.toLowerCase()) {
      case "usual":
        return Colors.blue;
        break;
      case "important":
        return Colors.orange;
        break;
      case "essential":
        return Colors.red;
        break;
      default:
        return Colors.blue;
        break;
    }
  }
}
