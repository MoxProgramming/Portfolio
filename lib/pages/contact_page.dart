import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/widgets/hover_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});


  @override
  Widget build(BuildContext context) {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: 'mox.programiranje@gmail.com');

    return Container(
      padding: contentPadding(context),
      width: double.infinity,
      child: Center(
        child: Card(
          color: Colors.blueGrey[900],
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(padding: const EdgeInsets.symmetric(horizontal: 16), child: const Text('Contact Information', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                const SizedBox(height: 12,),
                ContactInfo(icon: const Icon(Icons.mail), title: 'Email', info: 'mox.programiranje@gmail.com', onTap: () => launchUrl(emailLaunchUri)),
                const SizedBox(height: 12,),
                const ContactInfo(icon: Icon(Icons.phone), title: 'Phone', info: '+385 99 775 9518'),
                const SizedBox(height: 12,),
                const ContactInfo(icon: Icon(Icons.person_pin_circle), title: 'Location', info: 'Slatina, Croatia'),
              ],
          ),
          ),
        ),
      ),
    );
  }
}

class ContactInfo extends StatelessWidget {
  final Icon icon;
  final String title;
  final String info;
  final Function()? onTap;

  const ContactInfo({
    required this.icon,
    required this.info,
    required this.title,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return HoverScaleButton(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Text(info, style: const TextStyle(fontWeight: FontWeight.bold),)
                ]
              ,)
            ],
          ),
        ),
      ),
    );
  }
}

