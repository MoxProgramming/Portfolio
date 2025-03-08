import 'package:flutter/material.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/hero_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/pages/skills_page.dart';
import 'package:portfolio/pages/work_page.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final ScrollController _scrollController = ScrollController();

  int _currentSection = 0;

  List<Widget> pages = [
    HeroPage(key: heroKey,),
    SkillsPage(key: skillsKey,),
    WorkPage(key: workKey),
    ProjectsPage(key: projectKey,),
    ContactPage(key: contactKey,),
  ];

  List<GlobalKey> sectionKeys = [
    heroKey,
    skillsKey,
    workKey,
    projectKey,
    contactKey,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500));
    }
  }

  void _handleScroll() {
    const double appBarHeight = kToolbarHeight;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double visibleHeight = screenHeight - appBarHeight;
    final double viewportCenter = appBarHeight + visibleHeight / 2;

    int activeSection = _currentSection;
    double minDistance = double.infinity;

    for (int i = 0; i < sectionKeys.length; i++) {
      final context = sectionKeys[i].currentContext;
      if (context != null) {
        final box = context.findRenderObject() as RenderBox;
        final top = box.localToGlobal(Offset.zero).dy;
        final centerY = top + box.size.height / 2;
        final distance = (centerY - viewportCenter).abs();
        if (distance < minDistance) {
          minDistance = distance;
          activeSection = i;
        }
      }
    }

    if (activeSection != _currentSection) {
      setState(() {
        _currentSection = activeSection;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ScreenHelper.isMobile(context) ? null : AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          _buildAppBarButton(0, 'Home', heroKey),
          _buildAppBarButton(1, 'Skills', skillsKey),
          _buildAppBarButton(2, 'Work Experience', workKey),
          _buildAppBarButton(3, 'Projects', projectKey),
          _buildAppBarButton(4, 'Contact', contactKey),
        ],
      ),
      bottomNavigationBar: ScreenHelper.isMobile(context) ? BottomNavigationBar(
        currentIndex: _currentSection,
        backgroundColor: primaryBackgroundColor,
        selectedItemColor: highlightColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Skills'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Work Experience'),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Projects'),
          BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Contact'),
        ],
        onTap: (index) => scrollToSection(sectionKeys[index]),
      ) : null,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: pages,
            ),
          ),
          Positioned(
              right: 16,
              top: MediaQuery.of(context).size.height / 2 - 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(pages.length, (index) {
                  return GestureDetector(
                    onTap: () => scrollToSection(sectionKeys[index]),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: 10,
                      height: _currentSection == index ? 16 : 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentSection == index ? highlightColor : Colors.grey
                      ),
                    ),
                  );
                }),
              ),
            )
        ],
      )
    );
  }

  Widget _buildAppBarButton(int index, String text, GlobalKey key) {
    return TextButton(
      onPressed: () => scrollToSection(key),
      child: Text(
        text,
        style: TextStyle(color: _currentSection == index ? highlightColor : Colors.white),
      ),
    );
  }
}