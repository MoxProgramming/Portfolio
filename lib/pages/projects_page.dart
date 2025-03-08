import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/big_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Uri googlePlayUri = Uri(scheme: 'https', host: 'play.google.com', path: 'store/apps/details', queryParameters: {'id': 'com.mox.izi_biz'});
    final Uri websiteUri = Uri(scheme: 'https', host: 'www.moxdev.hr', path: 'izi-biz');

    return Container(
      width: double.infinity,
      padding: contentPadding(context),
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Colors.blue[900]!, Colors.grey[800]!])),
      child: Column(
        children: [
          const Center(child: Text('Biggest Project', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),),
          const SizedBox(height: 20,),
          Center(
            child: Card(
              color: Colors.blueGrey[900],
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('images/logo-no-background.png', width: 200,),
                    const SizedBox(height: 20,),
                    const Text('Izi Biz', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                    const SizedBox(height: 20,),
                    const Text('App for independently managing a business,', textAlign: TextAlign.center,),
                    const SizedBox(height: 20,),
                    const Text('Built using Flutter and Firebase'),
                    const SizedBox(height: 20,),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        IntrinsicWidth(
                          child: BigButton(text: 'Google Play', icon: const Icon(FontAwesomeIcons.googlePlay, color: Colors.white,), onPressed: () {
                            launchUrl(googlePlayUri);
                          }),
                        ),
                        IntrinsicWidth(
                          child: BigButton(text: 'Visit Website', icon: const Icon(FontAwesomeIcons.arrowUpRightFromSquare, color: Colors.white,), onPressed: () {
                            launchUrl(websiteUri);
                          }),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}