import 'package:motos/game/game_state.dart';
import 'package:motos/game/level/levels.dart';
import 'package:motos/tools/audio_tool.dart';
import 'package:motos/tools/image_tool.dart';

import 'my_game.dart';

class GameOnload {
  MyGame gameRef;
  GameOnload(this.gameRef);

  static bool inited = false;

  static Future<void> init() async {
    await GameState.init();
    await Levels.init();

    if (inited) {
      return;
    }

    await ImageTool.loadAll();
    await AudioTool.loadAll();

    inited = true;
  }

  Future<void> onLoad() async {
    await init();

    /*
    final background = Background.create(gameRef.viewport);
    await gameRef.add(background);
    final deadLine = DeadLine.create(gameRef.viewport);
    await gameRef.add(deadLine);
    GameState.scoreComponent =
        Scores.create(gameRef.viewport, text: GameState.score.toString());
    await gameRef.add(GameState.scoreComponent);
    final settingButton = SettingButton.create(gameRef.viewport);
    await gameRef.add(settingButton);
    await GenerateBall(gameRef).generateBall();
    
    // game controllers
    await gameRef.add(UpdateBallsFalling());
    await gameRef.add(UpdateBallsBounce());
    await gameRef.add(UpdateLevelUp());
    await gameRef.add(UpdateDeadLine());
    await gameRef.add(UpdateGravity());
    */
  }
}
