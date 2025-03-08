import 'dart:math';
import 'package:portfolio/utils/constants.dart';
import 'package:flutter/material.dart';

class AnimatedJobCard extends StatefulWidget {
  final String company;
  final String title;
  final String duration;
  final List<String> responsibilities;
  final Color accentColor;

  const AnimatedJobCard({
    super.key,
    required this.company,
    required this.title, required this.duration,
    required this.responsibilities,
    required this.accentColor
  });

  @override
  State<AnimatedJobCard> createState() => _AnimatedJobCardState();
}

class _AnimatedJobCardState extends State<AnimatedJobCard> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: widget.accentColor,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.company, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                Text(widget.title, style: const TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 4,),
                Text(widget.duration),
              ],
            )
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: widget.responsibilities.map((reponsibility) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.check_circle, size: 8, color: widget.accentColor,),
                    const SizedBox(width: 8),
                    Expanded(child: Text(reponsibility))
                  ],
                ),
              )).toList(),
            ),
          )
        ],
      )
    );
  }
}


class SkillsCard extends StatefulWidget {
  const SkillsCard({super.key, required this.grade, required this.skill});

  final double grade;
  final String skill;

  @override
  State<SkillsCard> createState() => _SkillsCardState();
}

class _SkillsCardState extends State<SkillsCard> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this
    );

    _progressAnimation = Tween<double>(begin: 0, end: widget.grade).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linearToEaseOut
      )
    );

    if (mounted) _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder:(context, child) {
      return Card(
        elevation: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 4
                      ),
                    ),
                    child: CustomPaint(
                      painter: CirclePaint(_progressAnimation.value / 10),
                    ),
                  ),
                  Text('${(widget.grade)}', style: const TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),)
                ]
              ),
            ),
            const SizedBox(height: 10,),
            Text(widget.skill, style: const TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold),)
          ],
        ),
      );
      }
    );
  }
}

class CirclePaint extends CustomPainter {
    final double value;

    CirclePaint(this.value);

    @override
    void paint(Canvas canvas, Size size) {
      final area = Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2);

      canvas.drawArc(area, -pi / 2, 2 * pi * value, true, Paint()..color = highlightColor);
  }

  @override
  bool shouldRepaint(covariant CirclePaint oldDelegate) => oldDelegate.value != value;
}

  // GridView.builder(
  //   physics: const NeverScrollableScrollPhysics(),
  //   shrinkWrap: true,
  //   padding: const EdgeInsets.only(top: 20),
  //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
  //     maxCrossAxisExtent: 450,
  //     crossAxisSpacing: 20,
  //     mainAxisSpacing: 20,
  //     mainAxisExtent: null
  //   ),
  //   itemCount: filteredSkills.length,
  //   itemBuilder: (context, index) {
  //     final skill = filteredSkills[index];
  //     return AnimationConfiguration.staggeredGrid(
  //         position: index,
  //         duration: const Duration(milliseconds: 300),
  //         columnCount: 2,
  //         child: FadeInAnimation(
  //           child: ScaleAnimation(
  //             // scale: 1.5,
  //             child: IntrinsicHeight(child: SkillCard(skill: skill, selectedCategories: selectedCategories)),
  //           ),
  //         ),
  //       );
  //   },
  // )

  /* class WaveTextAnimation extends StatefulWidget {
  @override
  _WaveTextAnimationState createState() => _WaveTextAnimationState();
}

class _WaveTextAnimationState extends State<WaveTextAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Adjust duration for smoother flow
    )..repeat();

    // Initialize the animation
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.red, // Repeat the first color to make it cyclic
              ],
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
              begin: Alignment(-1.0, 0.0),
              end: Alignment(1.0, 0.0),
              transform: GradientRotation(
                2 * 3.14159 * _animation.value, // Smooth cyclic rotation
              ),
              tileMode: TileMode.mirror, // Mirror the gradient for smooth looping
            ).createShader(bounds);
          },
          child: Text(
            'Flowing Colors',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
} */