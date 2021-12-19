import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_forge2d/position_body_component.dart';
import 'package:flutter/foundation.dart';
import 'package:sensors/sensors.dart';

class Hero extends PositionBodyComponent {
  final Vector2 position = Vector2(150, 150);
  double cellSize;

  late StreamSubscription<AccelerometerEvent> listener1;

  Hero(this.cellSize) : super(size: Vector2.all(cellSize)) {
    //position = Vector2(150, 150);
    //size = Vector2.all(cellSize);

    //var angle1 = 45 * (pi / 180);
    //angle = angle1;

    listener1 = accelerometerEvents.listen(onAccelerometerEvent);
  }

  @override
  onLoad() async {
    await super.onLoad();
    //sprite = await Sprite.load('hero/hero_0.png');
    //position: Vector2(150, 150)

    var angle1 = 45 * (pi / 180);

    final sprite = await gameRef.loadSprite('hero/hero_0.png');
    positionComponent =
        SpriteComponent(sprite: sprite, size: size, angle: angle1);
  }

  onAccelerometerEvent(AccelerometerEvent event) {
    if (kDebugMode) {
      //print(event);
    }
  }

  @override
  Body createBody() {
    final shape = PolygonShape();

    final vertices = [
      Vector2(-size.x / 2, -size.y / 2),
      Vector2(size.x / 2, -size.y / 2),
      Vector2(0, size.y / 2),
    ];
    shape.set(vertices);

    final fixtureDef = FixtureDef(shape)
      ..userData = this // To be able to determine object in collision
      ..restitution = 0.4
      ..density = 1.0
      ..friction = 0.5;

    final bodyDef = BodyDef()
      ..position = position
      ..angle = (position.x + position.y) / 2 * pi
      ..type = BodyType.dynamic;

    return world.createBody(bodyDef)..createFixture(fixtureDef);
  }
}
