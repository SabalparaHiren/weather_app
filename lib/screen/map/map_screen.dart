import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/map/widget/map_bloc.dart';
import 'package:weather_app/screen/map/widget/map_event.dart';
import 'package:weather_app/screen/map/widget/map_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(state.mapUrl!),
                    ),
                    onLoadStart: (con, uri) =>
                        context.read<MapBloc>().add(ChangeMapLoader(true)),
                    onLoadStop: (con, uri) =>
                        context.read<MapBloc>().add(ChangeMapLoader(false)),
                    onWebViewCreated: (con) =>
                        context.read<MapBloc>().add(ChangeMapLoader(true)),
                  ),
                  if (state.loader == true)
                    const FullScreenLoader(enableBgColor: true)
                  else
                    const SizedBox(),
                ],
              ),
            ),
            SizedBox(height: deviceHeight * 0.02)
          ],
        );
      },
    );
  }
}
