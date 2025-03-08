import 'package:flutter/material.dart';

class ColorWaveText extends StatefulWidget {
  final Widget child;
  final List<Color> colors;
  final List<double> stops;

  const ColorWaveText({super.key, required this.child, required this.colors, required this.stops});

  @override
  ColorWaveTextState createState() => ColorWaveTextState();
}

class ColorWaveTextState extends State<ColorWaveText> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat();
    _animation = Tween<double>(begin: -1, end: 1).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  colors: widget.colors,
                  stops: widget.stops,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  tileMode: TileMode.repeated,
                ).createShader(rect.translate(_animation.value * rect.width, _animation.value * rect.height));
              },
              blendMode: BlendMode.modulate,
              child: widget.child,
            );
          },
        );
  }
}