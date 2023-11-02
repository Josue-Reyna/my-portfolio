import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_portfolio/models/project.dart';

// Colors
const blue = Color.fromARGB(255, 86, 135, 219);
const red = Colors.redAccent;
const yellow = Color.fromARGB(255, 245, 211, 87);
const green = Color.fromARGB(255, 79, 185, 141);
const turquoise = Color.fromARGB(255, 72, 202, 180);
const pink = Colors.pinkAccent;
const magenta = Color(0xff870160);
const black = Color.fromARGB(255, 31, 30, 30);
const white = Color.fromARGB(255, 249, 255, 221);

// Logos
const gitHubLogo = 'assets/logos/github-mark-white.svg';
const linkedInLogo = 'assets/logos/linkedin_logo.svg';

// Links
final linkedInUrl = dotenv.env['LKDN']!;
final gitHubUrl = dotenv.env['GTHB']!;

// EmailJS
final serviceId = dotenv.env['SERVICE_ID']!;
final templateId = dotenv.env['TEMPLATE_ID']!;
final publicKey = dotenv.env['PUBLIC_KEY']!;
final privateKey = dotenv.env['PRIVATE_KEY']!;

// Images
const image = 'assets/images/';

const tools = [
  'flutter_logo.png',
  'supabase_logo.png',
  'dart_logo.png',
  'git_logo.png',
  'angular_logo.png',
  'firebase_logo.png',
  'html_logo.png',
  'typescript_logo.png',
  'dotnet_logo.png',
  'sqlserver_logo.png',
  'css_logo.png',
  'nodejs_logo.png',
  'expressjs_logo.png',
  'mongoDB_logo.png',
  'javascript_logo.png',
  'reactjs_logo.png',
];

const toolsNames = [
  'Flutter',
  'Supabase',
  'Dart',
  'Git',
  'Angular',
  'Firebase',
  'HTML',
  'TypeScript',
  '.Net',
  'Sql Server',
  'CSS',
  'Node',
  'Express',
  'MongoDB',
  'JavaScript',
  'React',
];

// Curriculum
final pdfCVEs = dotenv.env['CV_ES'];
final pdfCVEn = dotenv.env['CV_EN'];

const mx = '${image}mx.png';

// Projects
final projects = [
  Project(
    index: 0,
    title: 'X\'s & O\'s',
    link: 'https://xno-game-v3.web.app',
    gitHub: '',
    logo: '${image}xno_logo.png',
    tools: [
      'flutter_logo.png',
      'dart_logo.png',
      'expressjs_logo.png',
      'nodejs_logo.png',
      'mongoDB_logo.png',
      'socketio_logo.png',
    ],
    images: 'assets/xno-game-screens/',
  ),
  Project(
    index: 1,
    title: 'Just Chat',
    link: 'https://just-chat-app-jr.netlify.app',
    gitHub: '',
    logo: '${image}just_chat_logo.png',
    tools: [
      'flutter_logo.png',
      'dart_logo.png',
      'supabase_logo.png',
      'postgresql_logo.png',
    ],
    images: 'assets/just-chat-screens/',
  ),
];

/* Palettes */

const colorsNeo = [
  Color(0xff5b0060),
  Color(0xff870160),
  Color(0xffac255e),
  Color(0xffca485c),
  Color(0xffe16b5c),
  Color(0xfff39060),
  Color(0xffffb56b),
];

const colorsHome = [
  Color.fromARGB(255, 33, 100, 243),
  Color.fromARGB(255, 9, 147, 228),
  Color.fromARGB(255, 108, 250, 184),
  Color.fromARGB(255, 0, 255, 136),
  Color.fromARGB(255, 0, 255, 115),
];

const colorsPiet = [
  blue,
  yellow,
  red,
];

const colorsTeip = [
  turquoise,
  turquoise,
  pink,
  magenta,
];

const colorsMex = [
  green,
  red,
];

const colorsMexDark = [
  green,
  black,
  red,
];

const newColorPalette1 = [
  Color.fromARGB(255, 34, 192, 195),
  Color.fromARGB(255, 253, 187, 45),
];

const newColorPalette2 = [
  Color.fromARGB(255, 252, 70, 106),
  Color.fromARGB(255, 63, 94, 251),
  Color.fromARGB(255, 252, 70, 106),
];

const newColorPalette3 = [
  Color.fromARGB(255, 238, 174, 202),
  Color.fromARGB(255, 148, 187, 233),
];

const newColorPalette4 = [
  Color.fromARGB(255, 131, 35, 180),
  red,
  Color.fromARGB(255, 252, 176, 69),
];

const colorPalette1 = [colorsHome, colorsNeo];
const colorPalette2 = [colorsPiet, colorsTeip];
const colorPalette3 = [colorsMex, colorsMexDark];
const colorPalette4 = [newColorPalette1, newColorPalette2];
const colorPalette5 = [newColorPalette3, newColorPalette4];

const allNewColors = [
  newColorPalette1,
  newColorPalette2,
  newColorPalette3,
  newColorPalette4,
  colorsPiet,
];

const allDaColors = [
  colorPalette1,
  colorPalette2,
  colorPalette3,
  colorPalette4,
  colorPalette5,
];

// Heights
const height1 = SizedBox(height: 10);
const height2 = SizedBox(height: 20);
const height3 = SizedBox(height: 30);
const height4 = SizedBox(height: 40);
const height5 = SizedBox(height: 50);
const height6 = SizedBox(height: 60);
const height7 = SizedBox(height: 70);
const height8 = SizedBox(height: 80);
const height9 = SizedBox(height: 90);
const heightX = SizedBox(height: 100);

// Widths
const width1 = SizedBox(width: 10);
const width2 = SizedBox(width: 20);
const width3 = SizedBox(width: 30);
const width4 = SizedBox(width: 40);
const width5 = SizedBox(width: 50);
const width6 = SizedBox(width: 60);
const width7 = SizedBox(width: 70);
const width8 = SizedBox(width: 80);
const width9 = SizedBox(width: 90);
const widthX = SizedBox(width: 100);
