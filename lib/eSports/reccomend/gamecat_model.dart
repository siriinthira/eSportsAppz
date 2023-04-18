// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GameCatModel {
  String title;
  String description;
  String image_url;
  GameCatModel({
    required this.title,
    required this.description,
    required this.image_url,
  });

  GameCatModel copyWith({
    String? title,
    String? description,
    String? image_url,
  }) {
    return GameCatModel(
      title: title ?? this.title,
      description: description ?? this.description,
      image_url: image_url ?? this.image_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image_url': image_url,
    };
  }

  factory GameCatModel.fromMap(Map<String, dynamic> map) {
    return GameCatModel(
      title: map['title'] as String,
      description: map['description'] as String,
      image_url: map['image_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GameCatModel.fromJson(String source) => GameCatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GameCatModel(title: $title, description: $description, image_url: $image_url)';

  @override
  bool operator ==(covariant GameCatModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description &&
      other.image_url == image_url;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode ^ image_url.hashCode;
}
