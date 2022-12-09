import 'package:flutter/material.dart';
import 'package:simple_splash/simple_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoaded = false;

  @override
  void initState() {
    // Show splash screen 3 seconds
    Future.delayed(const Duration(seconds: 3))
        .then((value) => setState(() => isLoaded = true));
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? const Center(
            child: Text('Done'),
          )
        : SimpleSplash(
            showStatusBar: false,
            aboveLogoChild: Column(
              children: const [
                Text(
                  'Flutter',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 100,
                  child: LinearProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            logo: FlutterLogo(
              size: MediaQuery.of(context).size.shortestSide / 2,
            ),
            belowLogoChild: Column(
              children: const [
                Text(
                  'Building Your Beatiful App',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: 100,
                  child: LinearProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            backgroundGradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Colors.white, Colors.blue],
            ),
          );
  }
}
