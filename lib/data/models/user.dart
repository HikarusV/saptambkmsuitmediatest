import 'dart:convert';

class Users {
  String firstName;
  String lastName;
  String email;
  String url;

  Users(
      {this.firstName = 'dagrhj',
      this.lastName = 'lastName',
      this.email = '',
      this.url = 'url'});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'firstName': firstName});
    result.addAll({'lastName': lastName});
    result.addAll({'email': email});
    result.addAll({'url': url});

    return result;
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      firstName: map['user']['first_name'] ?? '',
      url: map['urls']['thumb'] ?? '',
      lastName: map['user']['last_name'] ?? '',
      email: map['user']['username'] ?? 'user',
    );
  }

  factory Users.fromJson(String source) => Users.fromMap(json.decode(source));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['url'] = url;
    return data;
  }
}
