// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class GamersModel {
  //  //generate data class
  String id;
  String name;
  String phone;
  String email;
  String game;
  String image_url;
  String experience;
  String description;
  String url;
  GamersModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.game,
    required this.image_url,
    required this.experience,
    required this.description,
    required this.url,
  });

  GamersModel copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    String? game,
    String? image_url,
    String? experience,
    String? description,
    String? url,
  }) {
    return GamersModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      game: game ?? this.game,
      image_url: image_url ?? this.image_url,
      experience: experience ?? this.experience,
      description: description ?? this.description,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'game': game,
      'image_url': image_url,
      'experience': experience,
      'description': description,
      'url': url,
    };
  }

  factory GamersModel.fromMap(Map<String, dynamic> map, String id) {
    print(map['url']);
    return GamersModel(
      id: id,
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      game: map['game'] as String,
      image_url: map['image_url'] as String,
      experience: map['experience'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  // factory GamersModel.fromJson(String source) =>
  //     GamersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GamersModel(id: $id, name: $name, phone: $phone, email: $email, game: $game, image_url: $image_url, experience: $experience, description: $description, url: $url)';
  }

  @override
  bool operator ==(covariant GamersModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.phone == phone &&
        other.email == email &&
        other.game == game &&
        other.image_url == image_url &&
        other.experience == experience &&
        other.description == description &&
        other.url == url;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        game.hashCode ^
        image_url.hashCode ^
        experience.hashCode ^
        description.hashCode ^
        url.hashCode;
  }
}

/*

factory GamersModel.fromMap(Map<String, dynamic> map, String id) {
    return GamersModel(
      id: id,
      name: map['name'] as String,
      phone: map['phone'] as String,
      email: map['email'] as String,
      game: map['game'] as String,
      image_url: map['image_url'] as String,
      experience: map['experience'] as String,
      description: map['description'] as String,
    );
  }

 */