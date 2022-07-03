import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/text_styles.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/screen/history/history_provider.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:simple_shadow/simple_shadow.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryProvider>(
      builder: (con, provider, widget) {
        return Expanded(
          child: GridView.builder(
            padding: EdgeInsets.fromLTRB(
                deviceWidth * 0.05, 20, deviceWidth * 0.05, 0),
            itemCount: provider.history.length,
            itemBuilder: (context, index) {
              final Current model = provider.history[index].current!;
              return InkWell(
                onTap: () => provider.onTabChange(index),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: deviceWidth * 0.05,
                      horizontal: deviceWidth * 0.05),
                  decoration: BoxDecoration(
                    color: provider.selectedIndex == index
                        ? ColorRes.themeColor
                        : ColorRes.darkBlue,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: ColorRes.themeColor.withOpacity(0.09),
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${kelToCel(model.temp!).round()}°c",
                                style: customStyle.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: deviceWidth * 0.02),
                              Text(
                                model.weather!.first.main!,
                                style: subTitle,
                              ),
                            ],
                          ),
                          const Spacer(),
                          SimpleShadow(
                            color: ColorRes.themeColor,
                            sigma: 7,
                            child: Image.asset(
                              getImageFromWeather(model.weather!.first.main!),
                              width: deviceWidth * 0.13,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        getDateFormatFromMillS('EEEE', model.dt!),
                        style: header,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        getDateFormatFromMillS('MMM, dd', model.dt!),
                        style: customStyle.copyWith(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
          ),
        );
      },
    );
  }
}
