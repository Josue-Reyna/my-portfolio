import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/views/home_view.dart';
import 'package:my_portfolio/widgets/navbar.dart';
import 'package:my_portfolio/views/project_view.dart';
import 'package:my_portfolio/widgets/theme_provider.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: themeProvider.isLightMode
                ? themeProvider.randomColor.first
                : themeProvider.randomColor.last,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  themeProvider.home
                      ? const Home()
                      : ProjectView(
                          project: projects[themeProvider.page],
                        ),
                ],
              ),
            ),
            Positioned(
              right: size.width < 500 ? 10 : 50,
              top: size.width < 500 ? 10 : 30,
              child: const Navbar(),
            ),
          ],
        ),
      ),
    );
  }
}
