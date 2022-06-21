import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screen/homePage.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 //for window manager
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    // await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    await windowManager.setBackgroundColor(Colors.transparent);
    await windowManager.setSize(Size(600, 600));
    await windowManager.center();
    await windowManager.show();
    await windowManager.focus();
    //await windowManager.setAlwaysOnTop(true);
    await windowManager.isResizable();

    await windowManager.setSkipTaskbar(false);
  });

  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('shopping_box');
  await Hive.openBox('raqba_box');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'LesCalc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: CalculatorPage(),
    );
  }
}
