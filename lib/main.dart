import 'package:blogexplorer/src/config/global.dart';
import 'package:blogexplorer/src/config/router.dart';
import 'package:blogexplorer/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppRouter.allBlocProviders()],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppStrings.home,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
  