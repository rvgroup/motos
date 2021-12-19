import 'dart:ui';

import 'package:flame/input.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:motos/components/background.dart';
import 'package:motos/components/play_area.dart';
import 'package:motos/game/game_init.dart';

import '../components/hero.dart';

class MyGame extends Forge2DGame with TapDetector {
  Vector2? screenSize;
  double? tileSize;

  bool? hide;

  late PlayArea playArea;
  late Background background;
  late Hero hero;

  late Vector2 viewportSize;

  MyGame(
    double width,
    double height, {
    this.hide,
  }) : super(gravity: Vector2(0, -10.0), zoom: 1) {
    hide ??= false;
    viewportSize = Vector2(width, height);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    GameInit(this).init(viewportSize);

    background = Background(this);
    add(background);

    playArea = PlayArea(this);
    add(playArea);

    hero = Hero(playArea.cellSize);
    add(hero);
  }

  @override
  void render(Canvas canvas) {
    if (hide!) {
      return;
    }

    super.render(canvas);
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    screenSize = canvasSize;
    tileSize = screenSize!.storage.first / 9;
  }

  @override
  void onTapDown(TapDownInfo info) {
    super.onTapDown(info);
    final pos = info.eventPosition.game;

    bool isHandled = false;

    /*
    if (startButton.containsPoint(pos)) {
      print('pos2');
    }
    */
  }

  @override
  void onDetach() {
    super.onDetach();
  }
}
