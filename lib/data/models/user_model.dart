// Data models in this project were written manually due to issues with json_serializable
// when parsing the data, which caused problems with data display. I am confident that
// this can be resolved, but due to time constraints, I had to opt for a quicker solution
// (although not the most optimal or correct one) and implement the data parsing logic manually.

class UserModel {
  final String email;
  final Name name;
  final Picture picture;

  UserModel({
    required this.email,
    required this.name,
    required this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null &&
        json['results'] is List &&
        json['results'].isNotEmpty) {
      final userJson = json['results'][0];

      if (userJson['email'] == null ||
          userJson['name'] == null ||
          userJson['picture'] == null) {
        throw Exception(
          'One or more required fields are missing in the response',
        );
      }

      final nameJson = userJson['name'];
      final name = Name.fromJson(nameJson);

      final pictureJson = userJson['picture'];
      final picture = Picture.fromJson(pictureJson);

      return UserModel(
        email: userJson['email'],
        name: name,
        picture: picture,
      );
    } else {
      throw Exception('No results found in response');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name.toJson(),
      'picture': picture.toJson(),
    };
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  // Constructor
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      title: json['title'] ?? '',
      first: json['first'] ?? '',
      last: json['last'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'first': first,
      'last': last,
    };
  }
}

class Picture {
  final String large;
  final String medium;
  final String thumbnail;

  Picture({
    required this.large,
    required this.medium,
    required this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) {
    return Picture(
      large: json['large'] ?? '',
      medium: json['medium'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'large': large,
      'medium': medium,
      'thumbnail': thumbnail,
    };
  }
}
