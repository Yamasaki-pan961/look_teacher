import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pushPage(BuildContext context, Widget page) {
  Navigator.of(context)
      .push<Widget>(MaterialPageRoute(builder: (context) => page));
}
