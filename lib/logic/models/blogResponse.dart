class BlogResponse {
  List<NewsList> newsList;
  bool success;

  BlogResponse({this.newsList, this.success});

  BlogResponse.fromJson(Map<String, dynamic> json) {
    if (json['newsList'] != null) {
      newsList = new List<NewsList>();
      json['newsList'].forEach((v) {
        newsList.add(new NewsList.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.newsList != null) {
      data['newsList'] = this.newsList.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class NewsList {
  int id;
  String topic;
  String body;

  NewsList({this.id, this.topic, this.body});

  NewsList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topic = json['topic'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['topic'] = this.topic;
    data['body'] = this.body;
    return data;
  }
}
