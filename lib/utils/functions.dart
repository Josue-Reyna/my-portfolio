import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_portfolio/utils/constants.dart';

List<Widget> skillsLogos(List<String>? toolsUsed) {
  final assets = toolsUsed ?? tools;
  List<Widget> images = [];
  for (var i = 0; i < assets.length; i++) {
    images.add(
      IconButton(
        iconSize: 50,
        onPressed: null,
        icon: Image.asset(
          '$image${assets[i]}',
          height: 50,
        ),
        tooltip: toolsUsed == null ? toolsNames[i] : null,
      ),
    );
  }
  return images;
}

Future<void> launchSite(String link) async {
  final Uri url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
