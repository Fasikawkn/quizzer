class ScoreData {
  String? picture;
  String? username;
  String? category;
  String? date;
  String? score;
  int? total;

  ScoreData(
      {this.picture,
      this.username,
      this.category,
      this.date,
      this.score,
      this.total});

  ScoreData.fromJson(Map<String, dynamic> json) {
    picture = json['picture'];
    username = json['username'];
    category = json['category'];
    date = json['date'];
    score = json['score'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['picture'] = picture;
    data['username'] = username;
    data['category'] = category;
    data['date'] = date;
    data['score'] = score;
    data['total'] = total;
    return data;
  }
}
