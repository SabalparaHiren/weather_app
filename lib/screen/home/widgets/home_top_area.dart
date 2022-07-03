import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/service/pref_service.dart';
import 'package:weather_app/utils/pref_keys.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTopArea extends StatelessWidget {
  const HomeTopArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: deviceHeight * 0.03),
        Text(PrefService.getString(PrefKeys.locality), style: title),
        SizedBox(height: deviceHeight * 0.02),
        Text(
          DateFormat('MMMM dd, yyyy').format(DateTime.now()),
          style: subHeader,
        ),
      ],
    );
  }
}
