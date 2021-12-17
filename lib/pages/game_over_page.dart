import 'package:flutter/material.dart';
import 'package:motos/game/game_life.dart';
import 'package:motos/game/game_state.dart';
import 'package:motos/game/my_game.dart';
import 'package:motos/tools/navigator_tool.dart';
import 'package:motos/tools/share_tool.dart';

// ignore: must_be_immutable
class GameOverPage extends StatelessWidget {
  MyGame gameRef;
  bool? isWin;

  GameOverPage(
    this.gameRef, {
    this.isWin,
  }) {
    isWin ??= true;
  }

  void _share() async {
    await ShareTool.share('Share ${GameState.record}!');
  }

  void _retry() {
    NavigatorTool.pop();
    GameLife(gameRef).restart();
  }

  void _home() {
    NavigatorTool.pop();
    GameLife(gameRef).back2Home();
  }

/* !!!
  void _setting() => NavigatorTool.push(
        GameSettingPage(
          fromHome: false,
        ),
      );
*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
