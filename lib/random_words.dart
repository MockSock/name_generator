import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // set variables here to not have to put them in constructor
    // creates random word pair variable
    final _wordPair = <WordPair>[];
    final _biggerFont = const TextStyle(fontSize: 22);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return const Divider();

        final _suggestion = index ~/ 2;
        if (_suggestion >= _wordPair.length) {
          // this is an internal method to the english_words
          // import that lets us make it as needed which is called
          // lazy loading
          _wordPair.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(
            _wordPair[index].asPascalCase,
            // this lets you do a one stop shop on styling, super useful!
            style: _biggerFont,
          ),
        );
      },
    );
  }
}
