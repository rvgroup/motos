import 'package:motos/game/game_setting.dart';
import 'package:motos/tools/hive_tool.dart';

class GameState {
  static int score = 0;

  static int record = 0;

  static bool isNewRecord = false;

  static GameStatus gameStatus = GameStatus.start;

  static GameSetting gameSetting = GameSetting();

  static Future<void> updateSetting(GameSetting setting) async {
    gameSetting = setting;
    await HiveTool().set<String>('gameSetting', gameSetting.toJsonStr());
  }

  static bool inited = false;

  static Future<void> init() async {
    score = 0;
    isNewRecord = false;
    gameStatus = GameStatus.start;

    await initSetting();
  }

  static Future<void> initSetting() async {
    if (inited) {
      return;
    }

    final n = await HiveTool().get<int>('record');
    if (n != null) {
      record = n;
    }

    final s = await HiveTool().get<String>('gameSetting');
    if (s != null) {
      gameSetting = GameSetting.fromJsonStr(s);
    }

    inited = true;
  }
}

enum GameStatus {
  over,

  win,

  pause,

  start,
}
