// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppRoute {
  String route;
  Widget page;
  dynamic bloc;
  AppRoute({
    required this.route,
    required this.page,
    required this.bloc,
  });
}
