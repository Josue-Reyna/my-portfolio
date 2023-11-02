import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/widgets/section.dart';
import 'package:my_portfolio/widgets/theme_provider.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  String projectDesc(int i) {
    switch (i) {
      case 0:
        return S.current.xnoShortDesc;
      case 1:
        return S.current.justChatShortDesc;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Section(
      title: S.of(context).projectsTitle,
      description: S.of(context).projectsDesc,
      isFirst: true,
      content: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: null,
          scrollDirection: Axis.horizontal,
        ),
        items: [0, 1].map(
          (i) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                    onTap: () {
                      themeProvider.changePage(i);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          projects[i].title,
                          style: const TextStyle(
                            fontSize: 20,
                            color: white,
                          ),
                        ),
                        height2,
                        Image.asset(
                          projects[i].logo,
                          height: 70,
                        ),
                        height2,
                        Text(
                          projectDesc(i),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: white,
                          ),
                        ),
                      ],
                    ));
              },
            );
          },
        ).toList(),
      ),
    );
  }
}
