import 'dart:collection';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:motos/models/cell.dart';
import 'package:motos/models/cell_type.dart';

import '../motos_game.dart';

class PlayArea extends Component {
  final MotosGame game;

  int cols = 15;
  int rows = 15;

  var map = HashMap<String, Cell>();
  var x0 = 20.0;
  var y0 = 20.0;
  var cellSize = 25.0;

  var testData1 = [
    "1212121212121",
    "2121212121212",
    "1212121212121",
    "2121212121212",
    "1212121212121",
    "2121033021212",
    "1212300312121",
    "2121300321212",
    "1212033012121",
    "2121212121212",
    "1212121212121",
    "2121212121212",
    "1212121212121",
    "2121212121212",
  ];

  Vector2? canvasSize;

  PlayArea(this.game) {
    //!!!
  }

  @override
  void render(Canvas canvas) {
    for (var cell in map.values) {
      cell.render(canvas);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  void initPos0() {
    var xSize = cols * cellSize;
    var ySize = rows * cellSize;

    var p1 = canvasSize![0];
    var p2 = canvasSize![1];
    x0 = (p1 - xSize) * 0.5;
    y0 = (p2 - ySize) * 0.5;
  }

  void readMap(List<String> data) {
    map.clear();

    var rowInfo = data[0];
    rows = data.length;
    cols = rowInfo.length;

    initPos0();

    for (var row = 0; row < data.length; row++) {
      rowInfo = data[row];

      for (var col = 0; col < rowInfo.length; col++) {
        var cellInfo = rowInfo[col];
        var cellKey = '${row}_$col';

        CellType cellType = CellType.none;

        switch (cellInfo) {
          case "1":
            cellType = CellType.type1;
            break;

          case "2":
            cellType = CellType.type2;
            break;

          case "3":
            cellType = CellType.type3;
            break;

          default:
        }

        if (cellType != CellType.none) {
          var rect = _getCellCoord(row, col);
          var cell = Cell(cellType, rect);

          map[cellKey] = cell;
        }
      }
    }
  }

  @override
  void onGameResize(Vector2 canvasSize) {
    super.onGameResize(canvasSize);

    print('onGameResize');

    this.canvasSize = canvasSize;

    if (map.isEmpty) {
      readMap(testData1);
    }
  }

  Vector4 _getCellCoord(int row, int col) {
    var cellX0 = (x0 + col * cellSize).toDouble();
    var cellX1 = cellX0 + cellSize - 1;
    var cellY0 = (y0 + row * cellSize).toDouble();
    var cellY1 = cellY0 + cellSize - 1;

    return Vector4(cellX0, cellY0, cellX1, cellY1);
  }
}
