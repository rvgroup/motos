import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motos/bgm.dart';
import 'package:motos/motos_game.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  await Flame.device.setLandscape();

  var storage = await SharedPreferences.getInstance();

  await initResources();

  var myGame = MotosGame(storage);
  runApp(GameWidget(
    game: myGame,
  ));

  /*
  TapGestureRecognizer tapper = TapGestureRecognizer();
  tapper.onTapDown = myGame.onTapDown;
  flameUtil.addGestureRecognizer(tapper);
  */

  WidgetsBinding.instance!.addObserver(BGMHandler());
}

initResources() async {
  await Flame.images.loadAll(<String>[
    'bg/background.png',
    'hero/hero_0.png',
  ]);

  //Flame.audio.disableLog();
  await BGM.preload();

  await FlameAudio.bgm.loadAll(<String>[
    /*
    'sfx/haha1.ogg',
    'sfx/haha2.ogg',
    'sfx/haha3.ogg',
    'sfx/haha4.ogg',
    'sfx/haha5.ogg',
    'sfx/ouch1.ogg',
    'sfx/ouch2.ogg',
    'sfx/ouch3.ogg',
    'sfx/ouch4.ogg',
    'sfx/ouch5.ogg',
    'sfx/ouch6.ogg',
    'sfx/ouch7.ogg',
    'sfx/ouch8.ogg',
    'sfx/ouch9.ogg',
    'sfx/ouch10.ogg',
    'sfx/ouch11.ogg',
    */
  ]);
}
