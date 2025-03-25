import 'package:flutter/material.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ExpansionTileController monoTileController = ExpansionTileController();
    final ExpansionTileController moxTileController = ExpansionTileController();

    Widget buildMonoChips() {
      return const Wrap(
        spacing: 10,
        children: [
          Chip(label: Text('C#', style: TextStyle(color: Colors.purple)), side: BorderSide(color: Colors.purple),),
          Chip(label: Text('Entity Framework', style: TextStyle(color: Colors.blue),), side: BorderSide(color: Colors.blue),),
          Chip(label: Text('Angular', style: TextStyle(color: Colors.red),), side: BorderSide(color: Colors.red),),
          Chip(label: Text('PostgreSQL', style: TextStyle(color: Colors.blueAccent),), side: BorderSide(color: Colors.blueAccent),),
        ],
      );
    }

    Widget buildMoxChips() {
      return const Wrap(
        spacing: 10,
        children: [
          Chip(label: Text('Dart', style: TextStyle(color: Colors.blue),), side: BorderSide(color: Colors.blue),),
          Chip(label: Text('Flutter', style: TextStyle(color: Colors.indigoAccent)), side: BorderSide(color: Colors.indigoAccent),),
          Chip(label: Text('Firebase', style: TextStyle(color: Colors.redAccent),), side: BorderSide(color: Colors.redAccent),),
        ],
      );
    }

    return Container(
      padding: contentPadding(context),
      child: Column(
        children: [
          const Center(child: Text('Work Experience', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),),
          const SizedBox(height: 20,),
          Card(
            color: Colors.blueGrey[900],
            child: ExpansionTile(
              controller: monoTileController,
              tilePadding: const EdgeInsets.all(20),
              collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: ScreenHelper.isWorkExperience(context) ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mono Software', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('November 2018 - May 2019', style: TextStyle(fontSize: 12),),              
                  buildMonoChips()
                ],
              ) : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mono Software', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('November 2018 - May 2019', style: TextStyle(fontSize: 12),),
                ],
              ),
              trailing: ScreenHelper.isWorkExperience(context) ? null : buildMonoChips(),
              controlAffinity: ListTileControlAffinity.leading,
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expansionAnimationStyle: AnimationStyle(
                curve: Easing.emphasizedAccelerate,
                reverseCurve: Easing.emphasizedAccelerate,
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
              ),
              childrenPadding: const EdgeInsets.all(20),
              onExpansionChanged: (value) {
                (value == true && moxTileController.isExpanded) ? moxTileController.collapse() : null;
              },
              children: const [
                Text('Software Engineer'),
                Text('Built web applications using Angular, C# .NET (Entity framework), PostgreSQL and Git Version Control using SourceTree. '),
              ],
            )
          ),
          Container(
            width: 2,
            height: 40,
            margin: const EdgeInsets.symmetric(vertical: 20),
            color: Colors.grey,
          ),
          Card(
            color: Colors.blueGrey[900],
            child: ExpansionTile(
              controller: moxTileController,
              tilePadding: const EdgeInsets.all(20),
              collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              title: ScreenHelper.isWorkExperience(context) ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Mox', style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text('August 2021 - Today', style: TextStyle(fontSize: 12),),
                  buildMoxChips()
                ],
              ) : const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mox', style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('August 2021 - Today', style: TextStyle(fontSize: 12),),
                ],
              ),
              trailing: ScreenHelper.isWorkExperience(context) ? null : buildMoxChips(),
              controlAffinity: ListTileControlAffinity.leading,
              expandedAlignment: Alignment.centerLeft,
              expandedCrossAxisAlignment: CrossAxisAlignment.start,
              expansionAnimationStyle: AnimationStyle(
                curve: Easing.emphasizedAccelerate,
                reverseCurve: Easing.emphasizedAccelerate,
                duration: const Duration(milliseconds: 500),
                reverseDuration: const Duration(milliseconds: 500),
              ),
              childrenPadding: const EdgeInsets.all(20),
              onExpansionChanged: (value) {
                (value == true && monoTileController.isExpanded) ? monoTileController.collapse() : null;
              },
              children: const [
                Text('Flutter Developer'),
                Text('Building cross platform applications for clients using Dart, Flutter and a Firebase NoSQL database.'),
              ],
            )
          ),
        ],
      ),
    );
  }
}