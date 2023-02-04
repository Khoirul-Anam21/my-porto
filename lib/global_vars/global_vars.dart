export 'screen_size.dart';

class PersonalData {
  static const String cvURL =
      'https://docs.google.com/document/d/1B09vjlvs6BRPIiXFsgUlOEos6JMNCoZjHxe3PVf8WVA/edit?usp=sharing';

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

  // desc project mengandung deskripsi, jugul, gambar, link repo, tech stack

  static const List<Map> projects = [
    {
      'id' : 1,
      'title': 'Sample Project',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['nodejs', 'express', 'git', 'postgres'],
      'desc':
          'Bruh bruh sdfasd dfadfan fdafdnfdan fdaf fdafadn fadfa fdafadf fafadfaf'
    },
    {
      'id' : 2,
      'title': 'Sample Project Dua',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['nodejs', 'express'],
      'desc':
          'Dalang pembunuhan munir adalah...'
    },
    {
      'id' : 3,
      'title': 'Sample Project Tiga',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['go', 'git', 'postgres'],
      'desc':
          'Teng teng teng teng teng coblos gambar kocheng'
    },
    {
      'id' : 4,
      'title': 'Sample Project Empat',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['flutter'],
      'desc':
          'samlekom'
    },
    {
      'id' : 5,
      'title': 'Sample Project Lima',
      'img': 'tes',
      'repo': 'github.com',
      'tech': ['nodejs', 'postgres'],
      'desc':
          'cok'
    },
  ];
}
