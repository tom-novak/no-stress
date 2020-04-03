import 'dart:core';

class Composition {
  String _id;
  String _title;
  String _image;
  List<Track> _tracks;

  Composition();

  Composition.from(this._id, this._title, this._image, this._tracks);

  String get id => _id;

  String get title => _title;

  String get image => _image;

  List<Track> get tracks => _tracks;
}

class Track {
  static const VOLUME_MIN = 0;
  static const VOLUME_MAX = 100;

  String _id;
  int _volume;
  Sound _sound;

  Track();

  Track.from(this._id, this._volume, this._sound);

  String get id => _id;

  int get volume => _volume;

  Sound get sound => _sound;
}

class Sound {
  final String _id;
  final String _title;
  final String _image;
  final String _url;

  const Sound.from(this._id, this._title, this._image, this._url);

  String get id => _id;

  String get title => _title;

  String get image => _image;

  String get url => _url;
}
