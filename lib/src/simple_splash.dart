import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'background_decoration.dart';

class SimpleSplash extends StatefulWidget {
  ///  Background color of the splash view.
  final Color? backgroundColor;

  /// Logo of the splash view.
  final Widget? logo;

  /// This widget will show above the [logo].
  final Widget? aboveLogoChild;

  /// This widget will show below the [logo].
  final Widget? belowLogoChild;

  /// Show and hide app status/navigation bar on the splash view.
  final bool showStatusBar;

  /// Gradient background of the splash view.
  final Gradient? backgroundGradient;

  /// Background image of the splash view.
  final BackgroundImageDecoration? backgroundImageDecoration;

  const SimpleSplash({
    Key? key,
    this.backgroundImageDecoration,
    this.backgroundColor,
    this.backgroundGradient,
    this.logo,
    this.aboveLogoChild,
    this.belowLogoChild,
    this.showStatusBar = false,
  }) : super(key: key);

  @override
  State<SimpleSplash> createState() => _SimpleSplashState();
}

class _SimpleSplashState extends State<SimpleSplash> {
  /// [hideStatusBar] is used to hide status bar on the splash view.
  hideStatusBar(bool value) {
    if (value == false) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [],
      );
    } else {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: [
          SystemUiOverlay.bottom,
          SystemUiOverlay.top,
        ],
      );
    }
  }

  @override
  void initState() {
    hideStatusBar(widget.showStatusBar);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          gradient: widget.backgroundGradient,
          color: widget.backgroundColor,
          image: widget.backgroundImageDecoration,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.aboveLogoChild != null) ...[
              widget.aboveLogoChild!,
              const SizedBox(height: 12),
            ],
            if (widget.logo != null)
              SizedBox(
                width: size.shortestSide / 2,
                height: size.shortestSide / 2,
                child: widget.logo,
              ),
            if (widget.belowLogoChild != null) ...[
              const SizedBox(height: 12),
              widget.belowLogoChild!,
            ],
          ],
        ),
      ),
    );
  }
}
