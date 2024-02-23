import 'package:flutter/material.dart';
import 'package:ra_app_m_vil/widgets/login_header.dart';

class Background extends StatelessWidget {
  final Widget widget;
  final String title;
  const Background({super.key, required this.widget, required this.title});

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginHeder(
            title: title,
          ),
          widget
        ],
      ),
    );
  }
}
