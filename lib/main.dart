import 'package:commic_app/app/data/provider/comic_provider.dart';
import 'package:commic_app/app/ui/pages/my_app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ComicProvider()),
    ],
    child: const MyApp(),
  ));
}
