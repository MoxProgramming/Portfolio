import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/hover_button.dart';

class BigButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback? onPressed;

  const BigButton({required this.text, required this.icon, this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return HoverScaleButton(
      scaleFactor: 1.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundBuilder: (context, states, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: statesToDecoration(states),
              child: child,
            );
          },
        ).copyWith(
          side: WidgetStateBorderSide.resolveWith(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.hovered)) {
                return const BorderSide(color: Colors.yellow, width: 1);
              }
              return null;
            }
          )
        ),
        child: Row(children: [
          icon,
          const SizedBox(width: 12,),
          Text(text, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        ],),
      ),
    );
  }
}

Decoration? statesToDecoration(Set<WidgetState> states) {
    if(states.contains(WidgetState.pressed)) {
      return const BoxDecoration(
        gradient: LinearGradient(colors: <Color>[highlightColor, Colors.red]),
      );
    }
    return BoxDecoration(
      gradient: LinearGradient(colors: switch (states.contains(WidgetState.hovered)) {
        true => <Color>[highlightColor, Colors.red],
        false => <Color>[Colors.blueGrey, highlightColor]
      })
    );
  }