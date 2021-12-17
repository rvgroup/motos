import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:motos/game/game_state.dart';

class AudioTool {
  static Future<void> loadAll() async {
    if (kIsWeb) {
      return;
    }

    await FlameAudio.audioCache.loadAll([
      'boom.mp3',
      'boom1.mp3',
      'boom2.mp3',
      'cheer.mp3',
      'coin.wav',
      'fall.mp3',
      'mix.wav',
    ]);
  }

  static int boomCount = 0;

  static void play(String path) async {
    if (!GameState.gameSetting.music!) {
      return;
    }

    await FlameAudio.play(path);
  }

  static void fall() => play('fall.mp3');
  static void win() => play('cheer.mp3');
  static void dead() => play('boom1.mp3');
}
