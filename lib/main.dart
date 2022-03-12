import 'package:flutter/material.dart';
import 'package:listview_builder/app_provider.dart';
import 'package:listview_builder/home_page.dart';
import 'package:listview_builder/repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const AppProviders());
}

class AppProviders extends StatelessWidget {
  const AppProviders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider(create: (_) => Counter(repository)),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListBuilder',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}
