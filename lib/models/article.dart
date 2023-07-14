import 'package:flutter/material.dart';

class Article {
  final String title;
  final String description;
  final String subtitle;
  late dynamic path;

  Article({
    required this.title,
    required this.description,
    required this.subtitle,
    this.path,
  });
}