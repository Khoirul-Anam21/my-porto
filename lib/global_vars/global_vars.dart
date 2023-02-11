export 'screen_size.dart';

class PersonalData {
  static const String cvURL =
      'https://docs.google.com/document/d/1B09vjlvs6BRPIiXFsgUlOEos6JMNCoZjHxe3PVf8WVA/edit?usp=sharing';
  static const String githubURL = 'https://github.com/Khoirul-Anam21';
  static const String gitlabURL = 'https://gitlab.com/Khoirul-Anam';

  static const List<Map> skills = [
    {'name': 'NodeJS', 'svg': 'assets/icons8-nodejs.svg', 'slug': 'nodejs'},
    {'name': 'Golang', 'svg': 'assets/icons8-golang.svg', 'slug': 'go'},
    {
      'name': 'Express.js',
      'svg': 'assets/icons8-express-js.svg',
      'slug': 'express'
    },
    {
      'name': 'Flutter & Dart',
      'svg': 'assets/icons8-flutter.svg',
      'slug': 'flutter'
    },
    {'name': 'Git/Github', 'svg': 'assets/icons8-github.svg', 'slug': 'git'},
    {
      'name': 'PostgreSQL',
      'svg': 'assets/icons8-postgresql.svg',
      'slug': 'postgres'
    },
  ];

  static const List<Map> appTitles = [
    {'name': 'Flutter Application', 'slug': 'flutter-app', 'img': 'assets/bg-project-btns/flutter-ss.png'},
    {'name': 'Node.js Application', 'slug': 'node-app', 'img': 'assets/bg-project-btns/node-ss.png'},
    {'name': 'Golang Application', 'slug': 'go-app', 'img': 'assets/bg-project-btns/go-ss.png'},
  ];

  // desc project mengandung deskripsi, jugul, gambar, link repo, tech stack

  static const List<Map> projects = [
    {
      'id' : 1,
      'title': 'Sample Project',
      'img': 'tes',
      'repo': 'https://github.com',
      'tech': ['nodejs', 'express', 'git', 'postgres'],
      'app': 'flutter-app',
      'desc':
          'Bruh bruh sdfasd dfadfan fdafdnfdan fdaf fdafadn fadfa fdafadf fafadfaf'
    },
    {
      'id' : 2,
      'title': 'Sample Project Dua',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['nodejs', 'express'],
      'app': 'node-app',
      'desc':
          'Dalang pembunuhan munir adalah...mka21fEb02x01'
    },
    {
      'id' : 3,
      'title': 'Sample Project Tiga',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['go', 'git', 'postgres'],
      'app': 'go-app',
      'desc':
          'Teng teng teng teng teng coblos gambar kocheng'
    },
    {
      'id' : 4,
      'title': 'Sample Project Empat',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['flutter'],
      'app': 'flutter-app',
      'desc':
          'samlekom'
    },
    {
      'id' : 5,
      'title': 'Sample Project Lima',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['nodejs', 'postgres'],
      'app': 'node-app',
      'desc':
          'Consequat tempor exercitation officia mollit officia ipsum ea deserunt Lorem labore exercitation ex incididunt. Exercitation deserunt duis minim cillum duis incididunt cupidatat enim aliqua. Nulla ullamco excepteur ex tempor sunt consequat non sint. Ad nisi officia culpa mollit deserunt. Dolore occaecat irure dolore nulla minim dolore sit sint.'
    },
  ];
}
