import 'package:dictionary_sqlite_provider/notifier/dictionary_notifier.dart';
import 'package:dictionary_sqlite_provider/widgets/word_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/word_model.dart';

class ResultList extends StatelessWidget {
  const ResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DictionaryNotifier>(
      builder: (_, notifier, _) {
        List<WordModel> resultList = notifier.wordList;
        return WordList(resultList: resultList);
      },
    );
  }
}
