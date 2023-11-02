import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:my_portfolio/generated/l10n.dart';
import 'package:my_portfolio/l10n/l10n.dart';
import 'package:my_portfolio/portfolio.dart';
import 'package:my_portfolio/widgets/theme_provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: "dotenv");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'JR Website',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          darkTheme: MyThemes.darkTheme,
          theme: MyThemes.lightTheme,
          supportedLocales: L10n.all,
          locale: Locale(themeProvider.whatLanguage),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const Portfolio(),
        );
      },
    );
  }
}
