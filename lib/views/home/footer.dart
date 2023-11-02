import 'package:flutter/material.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/utils/constants.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        height5,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).madeIn,
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
            Image.asset(
              mx,
              scale: 20,
            ),
            Text(
              '${S.of(context).withLove} ${Theme.of(context).primaryColor == black ? '🖤' : '🤍'}',
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        const Text(
          '&',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        height1,
        const FlutterLogo(size: 30),
        height9,
      ],
    );
  }
}
