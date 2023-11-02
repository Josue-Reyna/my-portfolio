import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/utils/functions.dart';
import 'package:my_portfolio/widgets/theme_provider.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({
    super.key,
    required this.project,
  });

  final Project project;

  String projectContent() {
    switch (project.index) {
      case 0:
        return S.current.xnoDesc;
      case 1:
        return S.current.justChatDesc;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          height2,
          IconButton(
            onPressed: () => themeProvider.changePage(-1),
            icon: const Icon(Icons.keyboard_return),
            tooltip: S.current.goBack,
          ),
          height2,
          Text(
            project.title,
            style: const TextStyle(fontSize: 50),
          ),
          size.width < 1050 ? height4 : height7,
          Flex(
            direction: size.width < 1050 ? Axis.vertical : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 500,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        projectContent(),
                        textAlign: size.width < 1050
                            ? TextAlign.center
                            : TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  height3,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => launchSite(project.link),
                        iconSize: 65,
                        icon: Image.asset(
                          project.logo,
                          width: 65,
                          height: 65,
                        ),
                        tooltip: S.current.goTo(project.title),
                      ),
                      width2,
                      Material(
                        color: black,
                        borderRadius: BorderRadius.circular(10),
                        child: IconButton(
                          onPressed: () => launchSite(project.gitHub),
                          iconSize: 50,
                          icon: SvgPicture.asset(
                            gitHubLogo,
                            width: 50,
                            height: 50,
                          ),
                          tooltip: S.current.gitRepository,
                        ),
                      ),
                    ],
                  ),
                  height3,
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    width: (project.tools.length + 3) * 50,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: skillsLogos(project.tools),
                      ),
                    ),
                  ),
                ],
              ),
              size.width < 1050 ? height5 : width5,
              Container(
                height: 500,
                width: 400,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width < 700 ? 16 : 48,
                ),
                decoration: const BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 500,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: null,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: [0, 1, 2, 3, 4, 5].map(
                    (i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return InkWell(
                            child: Image.asset(
                              '${project.images}${themeProvider.whatLanguage}/${i + 1}.png',
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
          height2,
        ],
      ),
    );
  }
}
