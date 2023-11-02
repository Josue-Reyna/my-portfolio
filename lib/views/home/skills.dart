import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/utils/functions.dart';
import 'package:my_portfolio/widgets/section.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      title: S.of(context).skillsTitle,
      description: S.of(context).skillsDesc,
      isFirst: false,
      content: Wrap(
        spacing: 30,
        runSpacing: 30,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: skillsLogos(null),
      ),
    );
  }
}
