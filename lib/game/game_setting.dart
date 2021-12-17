import 'dart:convert';

import 'package:motos/game/game_state.dart';

class GameSetting {
  bool? music;

  GameSetting({this.music}) {
    music ??= true;
  }

  GameSetting.fromJson(Map<String, dynamic> json) {
    music = json['music'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['music'] = music;
    return data;
  }

  String toJsonStr() => jsonEncode(toJson());

  static GameSetting fromJsonStr(String result) {
    return GameSetting.fromJson(jsonDecode(result));
  }

  Future<void> update() async => GameState.updateSetting(this);
}
