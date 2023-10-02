import 'package:blogexplorer/src/data/remote/api.dart';
import 'package:blogexplorer/src/domain/models/blog.dart';
import 'package:blogexplorer/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class Global 
{

  static late Box box;

  static init() async
  {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    Hive.registerAdapter(BlogAdapter());
    box = await Hive.openBox<Blog>(AppStrings.storage);
   
    await API.fetchBlogs();
  }
}