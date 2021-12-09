import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:motos/models/cell_type.dart';

class Cell {
  CellType type;

  Vector4 rect;
  late double x0;
  late double x1;
  late double y0;
  late double y1;
  late double w;
  late double h;

  Paint? paintBg;
  Paint? paintTR;
  Paint? paintLB;

  Paint? paint1;

  // 474751
  // DEDEFF

  Cell(this.type, this.rect) {
    x0 = rect.storage[0];
    y0 = rect.storage[1];
    x1 = rect.storage[2];
    y1 = rect.storage[3];
    w = x1 - x0;
    h = y1 - y0;

    paintBg = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = _getTypeColor(type);

    paintTR = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = const Color(0xffDEDEFF);
    //..color = Colors.red;

    paintLB = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = const Color(0xff474751);
    //..color = Colors.blue;

    paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 1
      ..color = Colors.red;
  }

  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(x0 + 1, y0 + 1, w - 1, h - 1),
      paintBg!,
    );

    var p1 = Offset(x0 + 1, y0);
    var p2 = Offset(x1, y0);
    var p3 = Offset(x1, y1 - 1);
    //canvas.drawLine(p1, p2, paintTR!);
    //canvas.drawLine(p2, p3, paintTR!);
    canvas.drawPoints(PointMode.lines, [p1, p2, p3], paintTR!);

    var p11 = Offset(x0, y0 + 1);
    var p21 = Offset(x0, y1);
    var p31 = Offset(x1 - 1, y1);
    //canvas.drawLine(p11, p21, paintLB!);
    //canvas.drawLine(p21, p31, paintLB!);
    canvas.drawPoints(PointMode.lines, [p11, p21, p31], paintLB!);

    var pLT = Offset(x0, y0);
    var pRB = Offset(x1, y1);
    canvas.drawPoints(PointMode.points, [pLT, pRB], paintBg!);
  }

  Color _getTypeColor(CellType type) {
    switch (type) {
      case CellType.type1:
        return const Color(0xffB8B8AE);
      case CellType.type2:
        return const Color(0xffB897FF);
      case CellType.type3:
        return const Color(0xff9797FF);
      default:
        return Colors.white;
    }
  }
}
