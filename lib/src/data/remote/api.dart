import 'dart:convert';

import 'package:blogexplorer/src/config/global.dart';
import 'package:blogexplorer/src/domain/models/blog.dart';
import 'package:blogexplorer/src/utils/constants.dart';
import 'package:http/http.dart' as http;

class API {
  static fetchBlogs() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
          "http://intent-kit-16.hasura.app/api/rest/blogs/",
        ),
        headers: {
          'User-Agent': 'PostmanRuntime/7.33.0',
          AppStrings.adminSecretKey: AppStrings.adminSecret,
        },
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body) as Map<String, dynamic>;
        for (var i in result['blogs']) {
          i['isFavorite'] = false;
          if (!Global.box.values.contains(Blog.fromMap(i))) {
            await Global.box.add(Blog.fromMap(i));
          }
        }
      } else {
        print("Request Failed with status code ${response.statusCode}");
      }
    } on Exception catch (e) {
      print("Error occured: $e");
    }
  }
}
