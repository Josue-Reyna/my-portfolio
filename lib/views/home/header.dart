// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/utils/constants.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        height9,
        Container(
          padding: const EdgeInsets.all(16),
          width: size.width < 1050 ? size.width : size.width * 0.75,
          child: Flex(
            direction: size.width < 1050 ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _Intro(),
              height3,
              _MyImage(),
            ],
          ),
        ),
        height8,
      ],
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro();

  void downloadCV(String language) {
    final anchorElement = AnchorElement(
      href: language == 'Regresar' ? pdfCVEs : pdfCVEn,
    );
    anchorElement.download;
    anchorElement.click();
  }

  TypewriterAnimatedText animationText(String text) => TypewriterAnimatedText(
        text,
        cursor: '</>',
        textAlign: TextAlign.end,
        textStyle: const TextStyle(
          fontSize: 30,
        ),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: size.width < 1050
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).intro,
              style: const TextStyle(
                fontSize: 50,
              ),
            ),
            height3,
            Text(
              S.of(context).im,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              pause: const Duration(milliseconds: 2000),
              animatedTexts: [
                animationText(S.of(context).webDev),
                animationText(S.of(context).appDev),
                animationText(S.of(context).uiDesign),
              ],
            ),
            height2,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => downloadCV(S.of(context).goBack),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(70, 20),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.download,
                      size: 17,
                    ),
                    Text('CV'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MyImage extends StatelessWidget {
  const _MyImage();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 50,
      child: Icon(
        Icons.emoji_emotions,
        size: 50,
      ),
    );
  }
}
