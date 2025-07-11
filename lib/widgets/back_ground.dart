import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final bool isLoginView;
  const Background({
    super.key,
    this.isLoginView = false,
    required this.child,
    this.topImage = "assets/images/main_top.png",
    this.bottomImage = "assets/images/login_bottom.png",
    this.bottomLeftImage = "assets/images/main_bottom.png",
  });

  final String topImage, bottomImage, bottomLeftImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(topImage, width: 120),
            ),
            isLoginView
                ? Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(bottomImage, width: 120),
                )
                : Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(bottomLeftImage, width: 80),
                ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
