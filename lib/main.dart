import 'package:app_ecommerce/splashScreen/animation_screen.dart';
import 'package:app_ecommerce/splashScreen/example_start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    const MaterialColor splashRimColor = const MaterialColor(
      0xFF010035,
      const <int, Color>{
        50: const Color(0xFF010035),
        100: const Color(0xFF010035),
        200: const Color(0xFF010035),
        300: const Color(0xFF010035),
        400: const Color(0xFF010035),
        500: const Color(0xFF010035),
        600: const Color(0xFF010035),
        700: const Color(0xFF010035),
        800: const Color(0xFF010035),
        900: const Color(0xFF010035),
      },
    );

     return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: splashRimColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Stack(
            children: <Widget>[
              Scaffold(
                  body: ExampleStartScreen()
              ),
              IgnorePointer(
                  child: AnimationScreen(
                      color: Theme.of(context).accentColor
                  )
              )
            ]
        )
    );
  }
}


