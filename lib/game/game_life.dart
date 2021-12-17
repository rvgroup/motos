import 'package:motos/game/game_onload.dart';
import 'package:motos/game/game_state.dart';
import 'package:motos/pages/game_over_page.dart';
import 'package:motos/pages/game_page.dart';
import 'package:motos/tools/audio_tool.dart';
import 'package:motos/tools/navigator_tool.dart';

import 'my_game.dart';

class GameLife {
  MyGame gameRef;
  GameLife(this.gameRef);

  static void start() async {
    await GameOnload.init();
    await NavigatorTool.push(GamePage());
  }

  void pause() {
    gameRef.pauseEngine();
    GameState.gameStatus = GameStatus.pause;
  }

  void resume() {
    gameRef.resumeEngine();
    GameState.gameStatus = GameStatus.start;
  }

  ///win
  void win() {
    AudioTool.win();
    GameState.gameStatus = GameStatus.win;
    NavigatorTool.push(GameOverPage(
      gameRef,
      isWin: true,
    ));
  }

  ///game over
  void dead() {
    AudioTool.dead();
    GameState.gameStatus = GameStatus.over;
    NavigatorTool.push(GameOverPage(
      gameRef,
      isWin: false,
    ));
  }

  void restart() {
    pause();
    NavigatorTool.replace(GamePage());
  }

  void back2Home() {
    NavigatorTool.pop();
  }

  /* !!!
  void setting() async {
    pause();
    await NavigatorTool.push(GameSettingPage(
      fromHome: false,
    ));
    resume();
  }
  */
}
