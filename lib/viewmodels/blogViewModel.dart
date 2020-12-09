import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/logic/models/blogResponse.dart';
import 'package:newsapp/utils/apiCall.dart';
import 'package:newsapp/utils/constants.dart' as constants;

enum BlogState { Idle, Busy, Error }

class BlogViewModel with ChangeNotifier {
  BlogState _blogState = BlogState.Idle;
  List<NewsList> _blogResponse = List();

  void setBlogState(BlogState blogState) {
    _blogState = blogState;
    notifyListeners();
  }

  BlogState get getBlogState => _blogState;

  Future<bool> blogState() async {
    setBlogState(BlogState.Busy);
    try {
      http.Response response = await ApiCall().sendGet(constants.blogs);

      if (response.statusCode == 200) {
        _blogResponse =
            BlogResponse.fromJson(json.decode(response.body)).newsList;
      } else {
        print("failed");
      }
    } catch (err) {
      print(err.toString());
    }

    setBlogState(BlogState.Idle);
  }

  List<NewsList> get blogResponses => _blogResponse;
}
