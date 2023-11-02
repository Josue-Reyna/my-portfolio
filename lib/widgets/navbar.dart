import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/utils/constants.dart';
import 'package:my_portfolio/utils/functions.dart';
import 'package:my_portfolio/widgets/theme_button.dart';
import 'package:my_portfolio/widgets/theme_provider.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Flex(
        direction: size.width < 700 ? Axis.vertical : Axis.horizontal,
        mainAxisAlignment:
            size.width < 700 ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () async => launchSite(linkedInUrl),
            icon: SvgPicture.asset(
              linkedInLogo,
              width: 24,
              height: 24,
              color: themeProvider.isLightMode ? Colors.black : white,
            ),
            tooltip: S.of(context).myLink('LinkedIn'),
          ),
          width1,
          IconButton(
            onPressed: () async => launchSite(gitHubUrl),
            icon: SvgPicture.asset(
              gitHubLogo,
              width: 24,
              height: 24,
              color: themeProvider.isLightMode ? Colors.black : white,
            ),
            tooltip: S.of(context).myLink('Git Hub'),
          ),
          const ThemeButton(),
          IconButton(
            onPressed: () => themeProvider.changeLanguage(),
            icon: const Icon(
              Icons.language,
              size: 24,
            ),
            tooltip: S.of(context).changeLanguage,
          ),
        ],
      ),
    );
  }
}
