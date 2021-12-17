import 'package:flame/flame.dart';

class ImageTool {
  static Future<void> loadAll() async {
    await Flame.images.loadAll(<String>[
      'bg/background.png',
      'hero/hero_0.png',
      'ui/start-button.png',
    ]);
  }
}
