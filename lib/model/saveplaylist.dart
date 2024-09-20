import 'package:Elibrary/model/book.dart';

class SaveplaylistModel {
  int id;
  int playlistId;
  int bookId;
  BookModel book;
  SaveplaylistModel({
    required this.id,
    required this.playlistId,
    required this.bookId,
    required this.book,
  });
  factory SaveplaylistModel.fromJson(Map<String, dynamic> json) {
    return SaveplaylistModel(
      id: json['id'],
      playlistId: json['playlist_id'],
      bookId: json['book_id'],
      book: BookModel.fromJson(json['book']),
    );
  }
}
