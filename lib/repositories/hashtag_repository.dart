import 'dart:async';

import 'package:insta_tags/models/hashtag_model.dart';

class HashtagRepository {
  final List<Map<String, dynamic>> listHashtags;

  HashtagRepository({
    required this.listHashtags,
  }) {
    List<HashtagModel> hashtags =
        listHashtags.map((e) => HashtagModel(name: e["name"])).toList();

    _hashtagController.add(hashtags);

  }

  final StreamController<List<HashtagModel>> _hashtagController =
    StreamController<List<HashtagModel>>();

  Stream<List<HashtagModel>> get hashtags => _hashtagController.stream;

  Future<void> addNewHashtag(Map<String, dynamic> data) async {
    listHashtags.add(data);

    List<HashtagModel> hashtags =
      listHashtags.map((e) => HashtagModel(name: e["name"])).toList();

    _hashtagController.add(hashtags);

  }

  Future<void> removeHashtag(HashtagModel hashtagModel) async {
    listHashtags.removeWhere((e) => e["name"] == hashtagModel.name);

    List<HashtagModel> hashtags =
        listHashtags.map((e) => HashtagModel(name: e["name"])).toList();

    _hashtagController.add(hashtags);
  }



}