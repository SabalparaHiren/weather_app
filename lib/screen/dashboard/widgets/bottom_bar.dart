import 'package:weather_app/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_event.dart';
import 'package:weather_app/screen/dashboard/bloc/dashboard_state.dart';
import 'package:weather_app/utils/color_res.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }

  Widget tab(IconData icon1, IconData icon2, int index) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Expanded(
          child: InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => context
                .read<DashboardBloc>()
                .add(ChangeDashboardTab(index, context)),
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: index == state.currentTab
                        ? ColorRes.themeColor.withOpacity(0.55)
                        : Colors.transparent,
                    blurRadius: 40,
                  ),
                ],
              ),
              child: Icon(index == state.currentTab ? icon1 : icon2),
            ),
          ),
        );
      },
    );
  }
}
