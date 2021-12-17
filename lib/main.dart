import 'package:flutter/material.dart';
import 'package:motos/pages/home_page.dart';
import 'package:motos/tools/navigator_tool.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //!!!
  //await Flame.device.fullScreen();
  //await Flame.device.setLandscape();

  runApp(const MyApp());
  //SystemTool.keepPortrait();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motos game',
      navigatorObservers: [NavigatorTool()],
      home: HomePage(),
    );
  }
}
