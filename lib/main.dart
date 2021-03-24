import 'package:flutter/material.dart';
import 'package:custom_animation_curve_flutter/customCurve.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomAnimationCurve(),
    );
  }
}

class CustomAnimationCurve extends StatefulWidget {
  @override
  _CustomAnimationCurveState createState() => _CustomAnimationCurveState();
}

class _CustomAnimationCurveState extends State<CustomAnimationCurve>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: AnimationCurve());
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
            animation: _animation,
            builder: (BuildContext context, Widget child) {
              return Transform.translate(
                offset: Offset(100 * _animation.value, (-200 * (_animation.value * _animation.value))),
                child: FlutterLogo(
                  size: 100,
                ),
              );
            }),
      ),
    );
  }
}
