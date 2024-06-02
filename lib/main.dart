  import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_cripto/utils/utils.dart';
import 'package:my_cripto/presentation/views/home/home.dart';

class Main {}

void main() async{
    final _logger = appLogger(Main);

  runZonedGuarded(
    ()async{
      WidgetsFlutterBinding.ensureInitialized();

      
      runApp(const ProviderScope(child: MyApp(),));
    },
    (error, stackTrace)=> _logger.e(
        error.toString(),
      stackTrace: stackTrace,
      functionName: "main",
    )
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
      ),
      home: const HomeView(),
    );
  }
}


class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
