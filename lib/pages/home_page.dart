import 'package:flutter/material.dart';
import 'package:motos/game/game_life.dart';
import 'package:motos/pages/about_page.dart';
import 'package:motos/pages/game_page.dart';
import 'package:motos/tools/navigator_tool.dart';
import 'package:motos/tools/screen/screen_config.dart';
import '../tools/screen/screen_extension.dart';
import 'package:motos/widgets/base_widget.dart';

class HomePage extends StatelessWidget {
  void _start() {
    GameLife.start();
  }

  void _about() {
    NavigatorTool.push(const AboutPage());
  }

  Future<void> _setting() async {
    /* !!!
    await GameState.initSetting();
    await NavigatorTool.push(
      GameSettingPage(
        fromHome: true,
      ),
    );
    */
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
                lExpanded(
                  child: _bottomAction(),
                ),
                //!!!
                //_hideGame(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _hideGame() => Offstage(
        child: Container(
          width: 1,
          height: 1,
          child: GamePage(hide: true),
        ),
      );

  Widget _topAction() => Container(
        padding: EdgeInsets.all(5.vw),
        child: Row(
          children: [
            lIconButton(
              Icons.info,
              size: 10.vw,
              color: Colors.black,
              onTap: _about,
            ),
            lExpanded(),
            lIconButton(
              Icons.settings,
              size: 10.vw,
              color: Colors.black,
              onTap: _setting,
            ),
          ],
        ),
      );

  Widget _bottomAction() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          lButton(
            'START',
            onTap: _start,
            height: 5.vw * 2.2,
            colorBg: Colors.black,
            colorText: Colors.white,
          ),
        ],
      );
}
