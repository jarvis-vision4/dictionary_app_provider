import 'package:dictionary_sqlite_provider/pages/word_details.dart';
import 'package:flutter/material.dart';

import '../model/word_model.dart';
import '../notifier/dictionary_notifier.dart';
import 'package:provider/provider.dart';

class WordList extends StatelessWidget {
  const WordList({super.key, required this.resultList});
  final List<WordModel> resultList;
  @override
  Widget build(BuildContext context) {
    DictionaryNotifier dictionaryNotifier = Provider.of<DictionaryNotifier>(
      context,
      listen: false,
    );
    return ListView.builder(
      itemCount: resultList.length,
      itemBuilder: (context, index) {
        WordModel word = resultList[index];
        int? fav = word.favourite;
        return Card(
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return WordDetails(index: index, wordModel: word);
                  },
                ),
              );
            },
            leading: Text('${index + 1}'),
            title: Text(word.eng),
            subtitle: Text(word.type),
            trailing: IconButton(
              onPressed: () {
                int updatedFav = fav == 1 ? 0 : 1;
                dictionaryNotifier.updateFavourite(updatedFav, word.id);
              },
              icon: fav == 1
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
          ),
        );
      },
    );
  }
}
