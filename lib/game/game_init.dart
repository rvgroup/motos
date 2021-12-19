import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/services.dart';
import 'package:motos/components/boundaries.dart';
import 'package:motos/tools/size_tool.dart';

import 'my_game.dart';

class GameInit {
  MyGame gameRef;
  GameInit(this.gameRef);

  Future<void> init(Vector2 size) async {
    await Flame.device.fullScreen();
    //await Flame.device.setLandscape();

    //final scale = 10.0;
    final gravity = Vector2(0, -1) * size.gravitySize;
    gameRef.world.setGravity(gravity);

    //gameRef.viewport = Viewport(size, scale);
    gameRef.camera.viewport = FixedResolutionViewport(size);
    final boundaries = createBoundaries(gameRef.camera.viewport);
    boundaries.forEach(gameRef.add);

    //gameRef.addContactCallback(BallWallContactCallback());
    //gameRef.addContactCallback(BallBallContactCallback());
  }

  static dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }
}
