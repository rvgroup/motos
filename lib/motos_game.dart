import 'package:flame/game.dart';
import 'package:motos/bgm.dart';
import 'package:motos/components/background.dart';
import 'package:motos/components/play_area.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/hero.dart';

class MotosGame extends FlameGame {
  final SharedPreferences storage;

  Vector2? screenSize;
  double? tileSize;

  late PlayArea playArea;

  MotosGame(this.storage) {
    initialize();
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Background(this));

    playArea = PlayArea(this);
    add(playArea);

    add(Hero(playArea.cellSize));
  }

  Future<void> initialize() async {
    onGameResize(Vector2.zero());

    BGM.play(BGMType.home);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    screenSize = canvasSize;
    tileSize = screenSize!.storage.first / 9;
  }

  //void onTapDown(TapDownDetails details) {}
}
