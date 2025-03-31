import 'package:flutter/material.dart';

import '../details_page.dart';

Route createRoute() {
  return PageRouteBuilder(
    pageBuilder:
        (context, animation, secondaryAnimation) => const DetailsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(position: animation.drive(tween), child: child);
    },
  );
}
