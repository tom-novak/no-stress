import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:no_stress/model/model.dart';
import 'package:no_stress/player/composition_player.dart';
import 'package:no_stress/provider/composition_provider.dart';
import 'package:no_stress/theme/theme.dart';
import 'package:no_stress/widget/composition_card.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (_, theme) {
          return MaterialApp(
            title: 'No Stress',
            theme: theme,
            home: MyHomePage(
              title: 'Compositions',
              player: CompositionPlayer(),
              compositionProvider: CompositionProvider(),
            ),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage(
      {Key key,
      this.title,
      @required this.player,
      @required this.compositionProvider})
      : super(key: key);

  final String title;
  final CompositionProvider compositionProvider;
  final CompositionPlayer player;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _items;
  var _actualPlayingId;

  @override
  void initState() {
    _items = widget.compositionProvider.getAll();
  }

  @override
  void dispose() {
    widget.player.stop();
    widget.player.dispose();
  }

  onPlayPressed(Composition composition) {
    setState(() {
      if (_actualPlayingId == composition.id) {
        _actualPlayingId = null;
        context.bloc<ThemeBloc>().add(ThemeEvent.toggle);
        widget.player.stop();
      } else {
        _actualPlayingId = composition.id;
        widget.player.composition = composition;
        context.bloc<ThemeBloc>().add(ThemeEvent.toggle);
        widget.player.playOrPause();
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
          itemCount: _items.length,
          itemBuilder: (context, index) {
            var item = _items[index];
            return CompositionCard(
              composition: item,
              playing: item.id == _actualPlayingId,
              onIconPressed: () => onPlayPressed(item),
            );
          }),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
