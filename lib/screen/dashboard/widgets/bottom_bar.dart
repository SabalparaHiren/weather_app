import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screen/dashboard/dashboard_provider.dart';
import 'package:weather_app/utils/color_res.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (con, provider, widget) {
        return SafeArea(
          child: Row(
            children: [
              tab(Icons.home, Icons.home_outlined, 0),
              tab(Icons.today, Icons.today_outlined, 1),
              tab(Icons.history, Icons.history_outlined, 2),
              tab(Icons.map, Icons.map_outlined, 3),
            ],
          ),
        );
      },
    );
  }

  Widget tab(IconData icon1, IconData icon2, int index) {
    return Consumer<DashboardProvider>(
      builder: (con, provider, widget) {
        return Expanded(
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => provider.onBottomBarChange(index),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: index == provider.currentTab
                        ? ColorRes.themeColor.withOpacity(0.55)
                        : Colors.transparent,
                    blurRadius: 40,
                  ),
                ],
              ),
              child: Icon(index == provider.currentTab ? icon1 : icon2),
            ),
          ),
        );
      },
    );
  }
}
