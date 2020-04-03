import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:no_stress/model/model.dart';

class CompositionPlayer {
  Composition _composition;
  var players = <AssetsAudioPlayer>[];

  set composition(Composition composition) {
    _composition = composition;
    stop();
    dispose();
    composition.tracks.forEach((track) {
      var player = AssetsAudioPlayer();
      player.open(track.sound.url);
      player.toggleLoop();
      players.add(player);
    });
  }

  playOrPause() {
    players.forEach((player) => player.playOrPause());
  }

  stop() {
    players.forEach((player) => player.stop());
  }

  dispose() {
    players.forEach((player) => player.dispose());
  }
}
