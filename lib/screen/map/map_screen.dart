import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/common/helper.dart';
import 'package:weather_app/common/widgets/loaders.dart';
import 'package:weather_app/screen/map/map_provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MapProvider>(
      builder: (con, provider, widget) {
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    initialUrlRequest: URLRequest(
                      url: Uri.parse(provider.mapUrl),
                    ),
                    onLoadStart: provider.onLoadStart,
                    onLoadStop: provider.onLoadStop,
                    onWebViewCreated: provider.onWebViewCreated,
                  ),
                  if (provider.loader)
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
