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
      'title': 'Evnt.in: Ticket App',
      'img': 'tes',
      'repo': 'https://github.com/Khoirul-Anam21/ticket-app',
      'tech': ['flutter', 'git'],
      'app': 'flutter-app',
      'spbase-dir': 'main/flutter/ticket-app/',
      'desc':
          'Aplikasi Sederhana untuk pemesanan tiket dengan database dummy. Aplikasi ini saya buat untuk memenuhi submission dari beasiswa Dicoding x IDCamp di path Multiplatform App. '
    },
    {
      'id' : 2,
      'title': 'Personal CV Website',
      'img': 'tes',
      'repo': 'https://github.com/Khoirul-Anam21/my-porto',
      'tech': ['flutter', 'git'],
      'app': 'flutter-app',
      'spbase-dir': 'main/flutter/porto/',
      'desc':
          'Dalang pembunuhan munir adalah...mka21fEb02x01'
    },
    {
      'id' : 3,
      'title': 'Second Hand',
      'img': 'tes',
      'repo': 'https://github.com/Wifaldy/second-hand',
      'tech': ['nodejs', 'git', 'postgres', 'express'],
      'app': 'node-app',
      'spbase-dir': 'main/node/second-hand/',
      'desc':
          'Teng teng teng teng teng coblos gambar kocheng'
    },
    {
      'id' : 4,
      'title': 'Game Data CRUD',
      'img': 'tes',
      'repo': 'https://gitlab.com/Khoirul-Anam/game-app-data',
      'tech': ['nodejs', 'postgres', 'express', 'git'],
      'app': 'node-app',
      'spbase-dir': 'main/node/game-app/',
      'desc':
          'samlekom mamank'
    },
    {
      'id' : 5,
      'title': 'Task Management API',
      'img': 'tes',
      'repo': 'https://github.com/final-project-KMGO-2/hacktiv8_fp_3',
      'tech': ['go', 'postgres', 'git'],
      'app': 'go-app',
      'spbase-dir': 'main/go/fp3/',
      'desc':
          'Consequat tempor exercitation officia mollit officia ipsum ea deserunt Lorem labore exercitation ex incididunt. Exercitation deserunt duis minim cillum duis incididunt cupidatat enim aliqua. Nulla ullamco excepteur ex tempor sunt consequat non sint. Ad nisi officia culpa mollit deserunt. Dolore occaecat irure dolore nulla minim dolore sit sint.'
    },
    {
      'id' : 6,
      'title': 'E-Commerce Simple API',
      'img': 'tes',
      'repo': 'https://github.com/final-project-KMGO-2/hacktiv8_fp4',
      'tech': ['go', 'postgres', 'git'],
      'app': 'go-app',
      'spbase-dir': 'main/go/fp4/',
      'desc':
          'Consequat tempor exercitation officia mollit officia ipsum ea deserunt Lorem labore exercitation ex incididunt. Exercitation deserunt duis minim cillum duis incididunt cupidatat enim aliqua. Nulla ullamco excepteur ex tempor sunt consequat non sint. Ad nisi officia culpa mollit deserunt. Dolore occaecat irure dolore nulla minim dolore sit sint.'
    }
  ];

  static const List<Map> educations = [
    {'title': 'Bachelor of Information System', 'origin': 'Merdeka Malang University', 'date': 'Sep 2019 - Now'},
    {'title': 'Golang for Back End Programmer', 'origin': 'Hacktiv8 - Kampus Merdeka', 'date': 'Aug 2022 - Dec 2022'},
    {'title': 'BackEnd JavaScript Bootcamp', 'origin': 'Binar Academy - Kampus Merdeka', 'date': 'Feb 2022 - Jul 2022'},
    {'title': 'Diploma of English', 'origin': 'Merdeka Malang University - Double Degree', 'date': 'Sep 2019 - Aug 2022'},
    {'title': 'Science Major', 'origin': 'SMAN I Pamekasan', 'date': '2016 - 2019'},
  ];

  static const List<Map> certificates = [];
}
