import 'package:no_stress/model/model.dart';
import 'package:no_stress/provider/sound_provider.dart';

class CompositionProvider {
  final _items = <Composition>[
    Composition.from(
        'vneiw', 'Waterfall only', 'assets/images/stream.jpg', <Track>[
      Track.from('track1', Track.VOLUME_MAX, SoundProvider.WATERFALL),
    ]),
    Composition.from(
        'ntrn', 'Waterfall and storm', 'assets/images/stream.jpg', <Track>[
      Track.from('track1', Track.VOLUME_MAX, SoundProvider.WATERFALL),
      Track.from('track2', Track.VOLUME_MAX, SoundProvider.STORM),
    ]),
    Composition.from(
        'vrwb', 'Campfire', 'assets/images/stream.jpg', <Track>[
      Track.from('track1', Track.VOLUME_MAX, SoundProvider.CAMPFIRE),
    ]),
  ];

  List<Composition> getAll() {
    return _items;
  }
}
