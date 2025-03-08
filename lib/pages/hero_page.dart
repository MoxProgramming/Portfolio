import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/big_button.dart';
import 'package:portfolio/widgets/color_wave_text.dart';
import 'package:portfolio/widgets/hover_button.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({super.key});

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  final Uri linkedInUri = Uri(scheme: 'https', host: 'www.linkedin.com', path: 'in/ivan-moslavac-0600a6139/');
  final Uri githubUri = Uri(scheme: 'https', host: 'github.com', path: 'MoxProgramming');
  final Uri facebookUri = Uri(scheme: 'https', host: 'www.facebook.com', path: 'ivan.moslavac.71');

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: contentPadding(context),
      child: Column(
        children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Hi, I'm Ivan", style: TextStyle(color: textColor, fontSize: 44),),
                    SizedBox(width: 20,),
                    Icon(Icons.waving_hand,size: 44,
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_pin, color: textColor, size: 24,
                    ),
                    SizedBox(width: 12,),
                    Text('Slatina, Croatia', style: TextStyle(color: textColor, fontSize: 24),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ColorWaveText(
                  colors: [highlightColor, Colors.grey.shade800],
                  stops: const [0, 1],
                  child: const Text('Flutter Developer', style: TextStyle(color: textColor, fontSize: 48), textAlign: TextAlign.center,),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HoverScaleButton(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blueGrey[900]),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.linkedinIn, color: Colors.white,),
                              hoverColor: highlightColor,
                              onPressed: () {
                                launchUrl(linkedInUri);
                              },
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    HoverScaleButton(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blueGrey[900]),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.github, color: Colors.white,),
                              hoverColor: highlightColor,
                              onPressed: () {
                                launchUrl(githubUri);
                              },
                            ))),
                    const SizedBox(
                      width: 20,
                    ),
                    HoverScaleButton(
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.blueGrey[900]),
                            child: IconButton(
                              icon: const FaIcon(FontAwesomeIcons.facebookF, color: Colors.white,),
                              hoverColor: highlightColor,
                              onPressed: () {
                                launchUrl(facebookUri);
                              },
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    IntrinsicWidth(
                      child: BigButton(
                        text: 'Contact Me',
                        icon: const Icon(Icons.mail, color: Colors.white,),
                        onPressed: () {
                          final context = contactKey.currentContext;
                          if (context != null) {
                            Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500));
                          }
                        },
                      ),
                    ),
                    IntrinsicWidth(
                      child: BigButton(
                        text: 'Download Resume',
                        icon: const Icon(Icons.download, color: Colors.white,),
                        onPressed: () {},
                      ),
                    )
                ]),
              ],
            ),
          ),
        ),
      ]),
    );
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
}