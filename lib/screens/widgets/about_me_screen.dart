import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio_new/constants/image_constants.dart';
import 'package:portfolio_new/constants/text_constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 800;

    return VisibilityDetector(
      key: const Key('about-me-section'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_visible) {
          setState(() {
            _visible = true; // triggers the animations
          });
        }
      },
      child: Container(
        width: double.infinity,
        color: Colors.grey[50],
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 40 : 80,
        ),
        child: Column(
          children: [
            // Title with fadeInDown
            _visible
                ? FadeInUpBig(
                    duration: const Duration(seconds: 1),

                    child: Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: isMobile ? 32 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),

            SizedBox(height: isMobile ? 20 : 40),

            // Divider
            _visible
                ? FadeIn(
                    duration: const Duration(seconds: 1),
                    child: Container(
                      width: 120,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),

            SizedBox(height: isMobile ? 30 : 60),

            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _visible
                    ? FadeInLeft(
                        duration: const Duration(seconds: 1),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.asset(
                            ImageConstants.myImage,
                            width: isMobile ? 150 : 180,
                            height: isMobile ? 150 : 180,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),

                SizedBox(width: isMobile ? 0 : 50, height: isMobile ? 30 : 0),

                isMobile
                    ? _aboutMeText(isMobile, _visible)
                    : Expanded(child: _aboutMeText(isMobile, _visible)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _aboutMeText(bool isMobile, bool visible) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      visible
          ? FadeInRight(
              duration: const Duration(seconds: 1),
              child: Text(
                StringConstants.aboutMeIntro,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
            )
          : const SizedBox.shrink(),
      const SizedBox(height: 20),
      visible
          ? FadeInRight(
              duration: const Duration(seconds: 1),
              delay: const Duration(milliseconds: 200),
              child: Text(
                StringConstants.aboutMeIntroJourney,
                style: TextStyle(
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.black54,
                  height: 1.6,
                ),
              ),
            )
          : const SizedBox.shrink(),
      const SizedBox(height: 20),
      visible
          ? FadeInUp(
              duration: const Duration(seconds: 1),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(milliseconds: 500),
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Developer',
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    ],
  );
}
