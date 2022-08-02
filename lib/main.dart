import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // set variables here to not have to put them in constructor
    // creates random word pair variable
    final wordPair = WordPair.random();
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
        ),
        body: Center(
          // pascal case is just every word capitalized
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}

// You can add dependencies on the command line, the example one is
// flutter pub add english_words
