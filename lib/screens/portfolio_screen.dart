import 'package:flutter/material.dart';
import 'package:portfolio_new/screens/widgets/about_me_screen.dart';
import 'package:portfolio_new/screens/widgets/contact_me_screen.dart';
import 'package:portfolio_new/screens/widgets/project_screen.dart';
import 'package:portfolio_new/screens/widgets/skills_screen.dart';
import 'widgets/home_screen.dart';

class PortfolioScrollablePage extends StatelessWidget {
  const PortfolioScrollablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: HomeScreen(),
            ),
            const AboutMe(),
            const SkillsScreen(),
            const ProjectsScreen(),
            const ContactMe(),
          ],
        ),
      ),
    );
  }
}
