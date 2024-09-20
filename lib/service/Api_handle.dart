import 'package:Elibrary/model/book.dart';
import 'package:Elibrary/model/playlist.dart';
import 'package:Elibrary/model/saveplaylist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Link {
  static const String baseUrl = 'http://10.10.6.140:8002/';

  static String apiUrl(String endpoint) {
    return baseUrl + endpoint;
  }
}

class ApiHandle {
  Future<List<BookModel>> fetchBookItems() async {
    final response = await http.get(Uri.parse(Link.apiUrl('api/items/')));

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List jsonResponse = json.decode(utf8Body);
      return jsonResponse.map((event) => BookModel.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}

class ApiHandlePlaylist {
  Future<List<PlaylistModel>> fetchPlaylistItems() async {
    final response = await http.get(Uri.parse(Link.apiUrl('api/playlist/')));

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List jsonResponse = json.decode(utf8Body);
      return jsonResponse
          .map((event) => PlaylistModel.fromJson(event))
          .toList();
    } else {
      throw Exception('Failed to load playlists');
    }
  }
}

class ApiHandleSavePlaylist {
  final int id;

  ApiHandleSavePlaylist({required this.id});

  Future<List<SaveplaylistModel>> fetchSavePlaylistItems() async {
    final response =
        await http.get(Uri.parse(Link.apiUrl('api/playlistinfo/$id/')));

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List jsonResponse = json.decode(utf8Body);
      return jsonResponse
          .map((event) => SaveplaylistModel.fromJson(event))
          .toList();
    } else {
      throw Exception('Failed to load saved playlists');
    }
  }
}

class ApiHandleSearch {
  final String text;

  ApiHandleSearch({required this.text});

  Future<List<BookModel>> fetchSearch() async {
    final response =
        await http.get(Uri.parse(Link.apiUrl('api/search/$text/')));

    if (response.statusCode == 200) {
      String utf8Body = utf8.decode(response.bodyBytes);
      List jsonResponse = json.decode(utf8Body);
      return jsonResponse.map((event) => BookModel.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load saved playlists');
    }
  }
}
