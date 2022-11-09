class RegisterUserData {
  String? email;
  String? password;
  String? username;
  String? fullname;
  String? image;

  RegisterUserData(
      {this.email, this.password, this.username, this.fullname, this.image});

  RegisterUserData.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    username = json['username'];
    fullname = json['fullname'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['username'] = username;
    data['fullname'] = fullname;
    data['image'] = image;
    return data;
  }
}
