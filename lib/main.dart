import 'package:flutter/material.dart';
import 'package:no_stress/widget/composition_card.dart';

import 'model/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Stress',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Compositions'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = List<Composition>.generate(
      1000,
      (i) => Composition.from('composition $i', 'Waterfall $i',
          'images/stream.jpg', List<Track>()));
  var actualPlayingId;

  onPlayPressed(String compositionId) {
    setState(() {
      if (actualPlayingId == compositionId) {
        actualPlayingId = null;
      } else {
        actualPlayingId = compositionId;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            return CompositionCard(
              composition: item,
              playing: item.id == actualPlayingId,
              onIconPressed: () => onPlayPressed(item.id),
            );
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
