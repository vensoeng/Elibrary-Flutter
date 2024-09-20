class PlaylistModel {
  final int id;
  final String title;
  final String img;
  final int count;

  PlaylistModel(
      {required this.id,
      required this.title,
      required this.img,
      required this.count});

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
      id: json['id'],
      title: json['title'],
      img: json['img'],
      count: json['saveplaylists_count'],
    );
  }

  get savplaylistID => null;
}
