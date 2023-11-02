import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/widgets/theme_provider.dart';

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    lowerBound: 0,
    upperBound: 1,
    reverseDuration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticInOut,
  );

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return RotationTransition(
      turns: _animation,
      child: IconButton(
        tooltip: S.of(context).theme,
        onPressed: () {
          final provider = Provider.of<ThemeProvider>(context, listen: false);
          provider.toggleTheme(!provider.isLightMode);
        },
        icon: Icon(
          themeProvider.isLightMode ? Icons.light_mode : Icons.dark_mode,
        ),
      ),
    );
  }
}
