import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/utils/constants.dart';

class Skill {
  final String name;
  final List<String> categories;
  final Icon icon;
  final String description;

  Skill({required this.name, required this.categories, required this.icon, required this.description});
}

class SkillsPage extends StatefulWidget {
  const SkillsPage({super.key});

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {

  final List<Skill> allSkills = [
    Skill(name: 'Flutter Development', categories: ['Mobile', 'Frontend'], icon: const Icon(FontAwesomeIcons.flutter, color: Colors.blueAccent,), description: 'Spearheaded the design and development of cross-platform mobile applications using Flutter. Employed agile methodologies, continuous integration, and responsive UI/UX design to deliver scalable, high-performance solutions.'),
    Skill(name: 'Dart Programming', categories: ['Mobile', 'Backend'], icon: const Icon(FontAwesomeIcons.dartLang, color: Colors.blueAccent,), description: 'Engineered robust mobile and backend applications with Dart. Utilized object-oriented principles, efficient state management, and modern development practices to ensure code quality and rapid iteration.'),
    Skill(name: 'UI/UX Design', categories: ['Design'], icon: const Icon(Icons.design_services, color: Colors.pinkAccent), description: 'Crafted intuitive and visually compelling user interfaces by leveraging user-centric design principles and rapid prototyping. Collaborated with multidisciplinary teams to elevate digital experiences and drive user engagement.'),
    Skill(name: 'REST API Integration', categories: ['Backend', 'Mobile'], icon: const Icon(Icons.api, color: Colors.greenAccent), description: 'Seamlessly integrated RESTful APIs to enable dynamic, secure data exchange between mobile apps and backend systems. Employed asynchronous programming and robust authentication protocols to optimize performance.'),
    Skill(name: 'Firebase', categories: ['Backend', 'Mobile'], icon: const Icon(FontAwesomeIcons.fire, color: Colors.orangeAccent), description: 'Implemented Firebase services for real-time database management, authentication, and cloud messaging. Optimized app performance with scalable backend solutions, analytics, and push notifications to boost user retention.'),
    Skill(name: 'State Management (Provider)', categories: ['Mobile'], icon: const Icon(FontAwesomeIcons.layerGroup, color: Colors.purpleAccent), description: 'Utilized Provider for efficient state management in mobile applications, ensuring a clean and modular architecture. Streamlined data flow and enhanced application performance through proactive state handling.'),
    Skill(name: 'Git Version Control', categories: ['General'], icon: const Icon(FontAwesomeIcons.gitAlt, color: Colors.redAccent), description: 'Leveraged Git for robust source code management. Employed branching strategies, continuous integration, and collaborative workflows to maintain code integrity and accelerate development cycles.'),
    Skill(name: 'Problem Solving', categories: ['General'], icon: const Icon(FontAwesomeIcons.lightbulb, color: Colors.yellowAccent), description: 'Applied analytical and innovative approaches to troubleshoot complex technical challenges. Utilized data-driven decision making and agile problem resolution to drive project success and operational excellence.'),
    Skill(name: 'Communication', categories: ['General'], icon: const Icon(Icons.chat, color: Colors.white), description: 'Facilitated clear, effective communication across cross-functional teams. Bridged technical and non-technical stakeholders through comprehensive documentation, agile meetings, and collaborative planning sessions.'),
    Skill(name: 'SQL Databases', categories: ['Backend'], icon: const Icon(FontAwesomeIcons.database, color: Colors.blueAccent), description: 'Engineered and optimized relational databases using SQL. Developed complex queries, maintained data integrity, and implemented performance tuning strategies to support scalable backend systems.'),
    Skill(name: 'NoSQL Databases', categories: ['Backend'], icon: const Icon(Icons.storage, color: Colors.white), description: 'Designed and implemented scalable NoSQL database solutions tailored to dynamic data models. Leveraged flexible schema design and real-time data handling to support high-volume, responsive applications.'),
    Skill(name: 'C#', categories: ['Backend'], icon: const Icon(FontAwesomeIcons.code, color: Colors.greenAccent), description: 'Developed robust backend services and desktop applications using C#. Employed advanced programming paradigms and design patterns to build maintainable, high-performance systems in fast-paced environments.'),
    Skill(name: 'PostgreSQL', categories: ['Backend'], icon: const Icon(FontAwesomeIcons.database, color: Colors.blueAccent), description: 'Configured and optimized PostgreSQL databases to ensure data security and performance. Applied advanced query optimization and indexing strategies to maintain data integrity and enhance system efficiency.'),
  ];

  List<Skill> filteredSkills = [];
  Set<String> selectedCategories = {};

  @override
  void initState() {
    super.initState();
    filteredSkills = allSkills;
  }

  void filterSkills(String category) {
    setState(() {
      if (selectedCategories.contains(category)) {
        selectedCategories.remove(category);
      } else {
        selectedCategories.add(category);
      }

      if (selectedCategories.isEmpty) {
        filteredSkills = allSkills;
      } else {
        filteredSkills = allSkills.where((skill) {
          return skill.categories.any((cat) => selectedCategories.contains(cat));
        }).toList();
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final allCategories = allSkills.expand((skill) => skill.categories).toSet().toList();

    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        padding: contentPadding(context),
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomLeft, end: Alignment.topRight, colors: [Colors.blue[900]!, Colors.grey[800]!])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(child: Text('Skills', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32)),),
            const SizedBox(height: 20,),
            Wrap(
              spacing: 20.0,
              runSpacing: 10,
              children: allCategories.map((category) { 
                final isSelected = selectedCategories.contains(category);
                return AnimatedScale(
                  duration: const Duration(milliseconds: 200),
                  scale: isSelected ? 1.1 : 1.0,
                  child: FilterChip(
                    label: Text(category),
                    labelStyle: const TextStyle(color: Colors.white),
                    selectedColor: highlightColor,
                    selected: selectedCategories.contains(category),
                    onSelected: (isSelected) => filterSkills(category),
                    elevation: isSelected ? 4.0 : 0.0,
                    shadowColor: Colors.black.withOpacity(0.2),
                  ),
                );
              }).toList()
            ),
            const SizedBox(height: 16.0),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child,),
                );
              },
            ),
            AnimationLimiter(
              key: ValueKey(filteredSkills.hashCode),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: List.generate(filteredSkills.length, (index) {
                      final skill = filteredSkills[index];
                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 300),
                        child: FadeInAnimation(
                          child: ScaleAnimation(
                            child: Container(
                              width: 400,
                              constraints: const BoxConstraints(minWidth: 200),
                              child: SkillCard(skill: skill, selectedCategories: selectedCategories),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class SkillCard extends StatefulWidget {
  const SkillCard({
    super.key,
    required this.skill,
    required this.selectedCategories,
  });

  final Skill skill;
  final Set<String> selectedCategories;

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey[900],
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: widget.skill.icon,
            title: Text(widget.skill.name, style: const TextStyle(fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis,),
            subtitle: Text(widget.skill.categories.join(', ')),
            contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            minLeadingWidth: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
            child: Text(widget.skill.description, style: const TextStyle(fontSize: 12),),
          )
        ],
      )
    );
  }
}