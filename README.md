# Simple Splash

Help you easier to create a splah screen for Flutter app.

## Usage

``` dart
SimpleSplash(
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
```
