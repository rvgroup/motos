import 'dart:math';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:motos/motos_game.dart';

class Background extends Component {
  final MotosGame game;

  static const _starsCount = 100;

  final paintBg = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.black;

  final paintStar = Paint()
    ..strokeWidth = 1
    ..style = PaintingStyle.fill
    ..color = Colors.white;

  List<Offset> points = [];

  Background(this.game) {
    generateStars();

    //!!!
    //resize();
  }

  @override
  void render(Canvas canvas) {
    var w = game.screenSize!.storage[0];
    var h = game.screenSize!.storage[1];

    canvas.drawRect(
      Rect.fromLTWH(0, 0, w, h),
      paintBg,
    );

    canvas.drawPoints(PointMode.points, points, paintStar);
  }

  /*
  void resize() {
    generateStars();
  }
  */

  @override
  void update(double dt) {
    super.update(dt);

    //!!!
    //print('update');
  }

  generateStars() {
    var w = game.screenSize!.storage[0];
    var h = game.screenSize!.storage[1];

    if (w > 0) {
      var rnd = Random();

      for (var i = 0; i < _starsCount; i++) {
        var x = rnd.nextDouble() * w;
        var y = rnd.nextDouble() * h;

        var p = Offset(x, y);

        points.add(p);
      }
    }
  }
}
