// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

part 'blog.g.dart';

@HiveType(typeId: 0)
class Blog {
  @HiveField(0)
  String id;
  @HiveField(1)
  String imageURL;
  @HiveField(2)
  String title;
  @HiveField(3)
  bool isFavorite;
  Blog({
    required this.id,
    required this.imageURL,
    required this.title,
    required this.isFavorite,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image_url': imageURL,
      'title': title,
      'isFavorite': isFavorite,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] as String,
      imageURL: map['image_url'] as String,
      title: map['title'] as String,
      isFavorite: map['isFavorite'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) =>
      Blog.fromMap(json.decode(source) as Map<String, dynamic>);
}
