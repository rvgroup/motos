import 'package:flutter/material.dart';
import 'package:motos/tools/navigator_tool.dart';
import 'package:motos/tools/screen/screen_config.dart';
import 'package:motos/tools/screen/screen_extension.dart';
import 'package:motos/tools/url_tool.dart';
import 'package:motos/widgets/base_widget.dart';
import 'package:motos/widgets/pulse.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  void _back() {
    NavigatorTool.pop();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenConfig(
      builder: () => Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                _topAction(),
                lExpanded(),
                lExpanded(flex: 10),
                lText(
                  'A',
                  bold: true,
                  size: 18,
                  color: Colors.grey[600],
                ),
                lExpanded(),
                lText(
                  'Motos game',
                  bold: true,
                  size: 36,
                  color: Colors.black,
                ),
                lExpanded(),
                lText(
                  'by',
                  bold: true,
                  size: 18,
                  color: Colors.grey[600],
                ),
                lExpanded(),
                lText(
                  'RVGroup',
                  bold: true,
                  size: 36,
                  color: Colors.black,
                ),
                lExpanded(flex: 10, child: _homeSite()),
                _madeWithLove(),
                lExpanded(),
                _bottomAction(),
                lExpanded(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _homeSite() {
    const url = 'https://wikipedia.org/wiki/Motos';

    return GestureDetector(
      onTap: () {
        UrlTool.open(url);
      },
      child: lText(
        url,
        color: Colors.blue,
      ),
    );
  }

  Widget _topAction() => Container(
        padding: EdgeInsets.all(5.vw),
        child: Row(
          children: [
            lIconButton(
              Icons.chevron_left,
              size: 10.vw,
              color: Colors.black,
              onTap: _back,
            ),
            lExpanded(),
          ],
        ),
      );

  Widget _madeWithLove() => Row(
        children: [
          lExpanded(),
          lText(
            'Made with ',
            bold: true,
            size: 18,
            color: Colors.grey[600],
          ),
          Pulse(
            child: Icon(
              Icons.favorite,
              size: 5.vw,
              color: Colors.red,
            ),
          ),
          lExpanded(),
        ],
      );

  Widget _bottomAction() => Row(
        children: [
          lExpanded(),
          lText(
            'Powered by',
            bold: true,
            size: 18,
            color: Colors.grey[600],
          ),
          lWidth(5.vw),
          FlutterLogo(size: 8.vw),
          Icon(
            Icons.close,
            size: 5.vw,
            color: Colors.black54,
          ),
          Image.asset(
            'assets/images/ui/flame.png',
            width: 8.vw,
          ),
          lExpanded(),
        ],
      );
}
