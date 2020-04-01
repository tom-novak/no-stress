import 'package:flutter/material.dart';
import 'package:no_stress/model/model.dart';

class CompositionCard extends StatelessWidget {
  final Composition composition;
  final bool playing;
  final GestureTapCallback onIconPressed;

  const CompositionCard(
      {Key key,
      @required this.composition,
      this.playing = false,
      this.onIconPressed})
      : assert(composition != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      child: Card(
        margin: const EdgeInsets.all(8.0),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              composition.image,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      composition.title,
                      style: theme.textTheme.title,
                    )),
                IconButton(
                  icon: Icon(playing ? Icons.stop : Icons.play_arrow),
                  iconSize: 48,
                  color: theme.accentColor,
                  onPressed: onIconPressed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
