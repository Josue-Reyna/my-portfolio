import 'package:flutter/material.dart';
import 'package:my_portfolio/views/home/contact.dart';
import 'package:my_portfolio/views/home/footer.dart';
import 'package:my_portfolio/views/home/header.dart';
import 'package:my_portfolio/views/home/projects.dart';
import 'package:my_portfolio/views/home/skills.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Header(),
        Projects(),
        Skills(),
        Contact(),
        Footer(),
      ],
    );
  }
}
