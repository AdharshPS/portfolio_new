import 'package:flutter/material.dart';
import 'package:portfolio_new/constants/image_constants.dart';

class ProjectConstants {
  static final List<ProjectModel> projects = [
    ProjectModel(
      title: 'NoteFlow',
      description:
          'NoteFlow is a lightweight notes application built with Flutter, following Clean Architecture principles. It supports creating, editing, deleting, and sharing notes, with an offline-first design powered by Hive for fast local storage. The app includes AI integration to improve and correct note content, and uses GitHub Actions for CI/CD with automated builds and releases via GitHub Releases.',
      gitHubUrl: 'https://github.com/AdharshPS/notes',
      imagePath: ImageConstants.notesImage,
      gradient: [Color(0xFF2C5364), Color(0xFF0F2027)],
    ),
    ProjectModel(
      title: 'Paws (Pet Sales App)',
      description:
          'PAWS is a user-to-user pet marketplace where users can list pets for sale, browse available pets, and connect directly with sellers or buyers. Built with Firebase, the app supports secure authentication, real-time data handling, and image storage.',
      gitHubUrl: 'https://github.com/AdharshPS/paws_app',
      imagePath: ImageConstants.pawsImage,
      gradient: [Color(0xFF4568DC), Color(0xFFB06AB3)],
    ),
    ProjectModel(
      title: 'Netflix UI Clone',
      description:
          'A visually accurate clone of the Netflix interface built using Flutter. The app replicates the home screen, movie categories, banners, and detail pages with smooth scrolling and responsive layouts. Designed to showcase UI development skills and component structuring in Flutter.',
      gitHubUrl: 'https://github.com/AdharshPS/Netflix',
      imagePath: ImageConstants.netflixImage,
      gradient: [Color(0xFF43C6AC), Color(0xFF191654)],
    ),
  ];
}

class ProjectModel {
  final String title;
  final String description;
  final String imagePath;
  final String gitHubUrl;
  final List<Color> gradient;
  ProjectModel({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.gitHubUrl,
    required this.gradient,
  });
}
