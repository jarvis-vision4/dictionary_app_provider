import 'package:dictionary_sqlite_provider/model/word_model.dart';
import 'package:flutter/material.dart';

import '../notifier/dictionary_notifier.dart';
import 'package:provider/provider.dart';

class WordDetails extends StatefulWidget {
  const WordDetails({super.key, required this.index, required this.wordModel});
  final int index;
  final WordModel wordModel;
  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    WordModel wordModel = widget.wordModel;
    DictionaryNotifier dictionaryNotifier = Provider.of<DictionaryNotifier>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(wordModel.eng),
        actions: [
          Consumer<DictionaryNotifier>(
            builder: (_, notifier, _) {
              int? fav = notifier.wordList[widget.index].favourite;

              return IconButton(
                onPressed: () {
                  int updatedFav = fav == 1 ? 0 : 1;

                  dictionaryNotifier.updateFavourite(updatedFav, wordModel.id);
                },
                icon: fav == 1
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_outline),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(wordModel.eng, style: textTheme.titleLarge),
              Divider(),
              Text(wordModel.type, style: textTheme.bodyLarge),
              Divider(),
              Text(wordModel.myan, style: textTheme.titleLarge),
            ],
          ),
        ),
      ),
    );
  }
}
