import 'package:dictionary_sqlite_provider/widgets/word_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/word_model.dart';
import '../notifier/dictionary_notifier.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DictionaryNotifier>(context, listen: false).getFavWords();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite List')),
      body: Consumer<DictionaryNotifier>(
        builder: (_, notifier, _) {
          List<WordModel> favList = notifier.favWordList;
          return WordList(resultList: favList);
        },
      ),
    );
  }
}
