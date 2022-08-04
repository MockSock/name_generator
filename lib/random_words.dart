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
    final wordPair = <WordPair>[];
    // for static styling just use const it wont change
    const biggerFont = TextStyle(fontSize: 22.0);

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) {
        if (index.isOdd) return const Divider();

        final suggestion = index ~/ 2;
        if (suggestion >= wordPair.length) {
          // this is an internal method to the english_words
          // import that lets us make it as needed which is called
          // lazy loading
          wordPair.addAll(generateWordPairs().take(10));
        }

        return ListTile(
          title: Text(
            wordPair[index].asPascalCase,
            // this lets you do a one stop shop on styling, super useful!
            style: biggerFont,
          ),
        );
      },
    );
  }
}
