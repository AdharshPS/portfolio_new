import 'package:flutter/material.dart';
import 'package:portfolio_new/screens/portfolio_screen.dart';
import 'package:web/web.dart' as web;

const env = String.fromEnvironment('ENV', defaultValue: 'dev');
const buildVersion = String.fromEnvironment('BUILD_VERSION', defaultValue: '0');
String get appTitle {
  return env == 'prod' ? 'Adharsh PS Portfolio' : 'Adharsh PS Portfolio (DEV)';
}

void setBrowserTitle() {
  web.document.title = appTitle;
}

void handleBuildVersionChange() {
  try {
    final storage = web.window.localStorage;
    final stored = storage.getItem('build_version');

    if (stored != buildVersion) {
      storage.setItem('build_version', buildVersion);
      web.window.location.reload();
    }
  } catch (_) {
    // Ignore storage errors (private mode, etc.)
  }
}

void main() {
  setBrowserTitle();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: PortfolioScrollablePage(),
    );
  }
}
