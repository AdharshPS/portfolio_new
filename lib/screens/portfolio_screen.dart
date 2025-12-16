import 'package:flutter/material.dart';
import 'package:portfolio_new/screens/widgets/about_me_screen.dart';
import 'package:portfolio_new/screens/widgets/contact_me_screen.dart';
import 'package:portfolio_new/screens/widgets/project_screen.dart';
import 'package:portfolio_new/screens/widgets/skills_screen.dart';
import 'package:web/web.dart' as web;

import 'widgets/home_screen.dart';

class PortfolioScrollablePage extends StatefulWidget {
  const PortfolioScrollablePage({super.key});

  @override
  State<PortfolioScrollablePage> createState() =>
      _PortfolioScrollablePageState();
}

class _PortfolioScrollablePageState extends State<PortfolioScrollablePage> {
  @override
  void initState() {
    super.initState();
    const buildVersion = String.fromEnvironment(
      'BUILD_VERSION',
      defaultValue: '0',
    );
    final storage = web.window.localStorage;

    final stored = storage.getItem('build_version');

    if (stored != buildVersion) {
      storage.setItem('build_version', buildVersion);
      web.window.location.reload();
    }
  }

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
