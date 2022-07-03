import 'dart:io';

import 'package:weather_app/common/helper.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  final bool? enableBgColor;

  const FullScreenLoader({Key? key, this.enableBgColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceHeight,
      width: deviceWidth,
      decoration: enableBgColor == true
          ? const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorRes.bgColor1,
                  ColorRes.bgColor2,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            )
          : null,
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class SmallLoader extends StatelessWidget {
  const SmallLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS
          ? const CupertinoActivityIndicator()
          : const CircularProgressIndicator(),
    );
  }
}

class SmartLoader extends StatelessWidget {
  const SmartLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Platform.isIOS
            ? const CupertinoActivityIndicator()
            : const CircularProgressIndicator(),
      ),
    );
  }
}
