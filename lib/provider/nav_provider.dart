import 'package:flutter/material.dart';
import 'package:Elibrary/model/playlist.dart';
import 'package:Elibrary/service/Api_handle.dart';

class PlaylistProvider with ChangeNotifier {
  List<PlaylistModel> _playlistItems = [];

  List<PlaylistModel> get playlistItems => _playlistItems;

  PlaylistProvider() {
    fetchPlaylists();
  }

  Future<void> fetchPlaylists() async {
    ApiHandlePlaylist apiHandle = ApiHandlePlaylist();
    _playlistItems = await apiHandle.fetchPlaylistItems();
    notifyListeners();
  }
}
