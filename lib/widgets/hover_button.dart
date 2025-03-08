import 'package:flutter/material.dart';

class HoverScaleButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final double scaleFactor;
  final Duration animationDuration;

  const HoverScaleButton({
    super.key,
    required this.child,
    this.onPressed,
    this.scaleFactor = 1.1,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<HoverScaleButton> createState() => _HoverScaleButtonState();
}

class _HoverScaleButtonState extends State<HoverScaleButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEvent event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (PointerEvent event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedScale(
          scale: _isHovering ? widget.scaleFactor : 1.0,
          duration: widget.animationDuration,
          curve: Curves.easeInOut,
          child: widget.child,
        ),
      ),
    );
  }
}