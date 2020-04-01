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
  onPlayPressed(String compositionId) {}

  @override
  Widget build(BuildContext context) {
    var composition =
        Composition.from('oewn', 'Waterfall', 'images/stream.jpg', List<Track>());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CompositionCard(
              composition: composition,
              playing: true,
              onIconPressed: () => onPlayPressed(composition.id),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
