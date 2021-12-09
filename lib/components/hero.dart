import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:sensors/sensors.dart';

class Hero extends SpriteComponent {
  double cellSize;

  late StreamSubscription<AccelerometerEvent> listener1;

  Hero(this.cellSize) {
    position = Vector2(150, 150);
    size = Vector2.all(cellSize);

    var angle1 = 45 * (pi / 180);
    angle = angle1;

    listener1 = accelerometerEvents.listen(onAccelerometerEvent);
  }

  @override
  onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('hero/hero_0.png');
  }

  onAccelerometerEvent(AccelerometerEvent event) {
    print(event);
  }
}
