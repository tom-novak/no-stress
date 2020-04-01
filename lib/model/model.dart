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
  String _id;
  String _title;
  String _image;
  String _url;

  Sound();

  Sound.from(this._id, this._title, this._image, this._url);

  String get id => _id;

  String get title => _title;

  String get image => _image;

  String get url => _url;
}
