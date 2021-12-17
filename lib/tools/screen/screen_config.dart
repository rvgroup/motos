import 'package:flutter/widgets.dart';
import 'package:motos/tools/screen/screen_tool.dart';

class ScreenConfig extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  ScreenConfig({
    required this.builder,
    this.designSize = ScreenTool.defaultSize,
    this.allowFontScaling = false,
    Key? key,
  }) : super(key: key);

  final Widget Function() builder;

  final Size designSize;

  final bool allowFontScaling;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        if (constraints.maxWidth != 0) {
          ScreenTool().init(
            constraints,
            designSize: designSize,
            allowFontScaling: allowFontScaling,
          );
        }
        return builder();
      },
    );
  }
}
