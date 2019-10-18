import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

///
/// Desc           :  flutter first app example
/// Author         :  Jetictors
/// Time           :  2019/10/17 11:24
/// Email          :  zhengxcfutures@gmail.com
/// Version        :  v-1.0.1
///
class RandomWordPage extends StatefulWidget{

  RandomWordPage({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _RandomWordPageState createState() => new _RandomWordPageState();

}

class _RandomWordPageState extends State<RandomWordPage>{

  final _suggestions = <WordPair>[];
  final _biggerFont = new TextStyle(fontSize: 16.0, color: Colors.red);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        backgroundColor: Colors.red,
        centerTitle: true,
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, i){
        if (i.isOdd) return new Divider();

        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(5));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair){

    final _isAdd = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        _isAdd ? Icons.favorite : Icons.favorite_border,
        color: _isAdd ? Colors.red : null,
      ),
      onTap: (){
        setState(() {
          if(_isAdd){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved(){
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final divided = ListTile
                .divideTiles(
              context: context,
              tiles: tiles,
            ).toList();

            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Word'),
                backgroundColor: Colors.red,
              ),
              body: new ListView(children: divided),
            );
          },
      ),
    );
  }

}