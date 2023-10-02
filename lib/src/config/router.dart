import 'package:blogexplorer/src/domain/models/route.dart';
import 'package:blogexplorer/src/presentation/views/blog/bloc/blog_bloc.dart';
import 'package:blogexplorer/src/presentation/views/blog/blog_page.dart';
import 'package:blogexplorer/src/presentation/views/favorites/bloc/favorites_bloc.dart';
import 'package:blogexplorer/src/presentation/views/favorites/favorites_page.dart';
import 'package:blogexplorer/src/presentation/views/home/bloc/home_bloc.dart';
import 'package:blogexplorer/src/presentation/views/home/home_page.dart';
import 'package:blogexplorer/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static List<AppRoute> routes() => [
        AppRoute(
          route: AppStrings.home,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (context) => HomeBloc(),
          ),
        ),
        AppRoute(
          route: AppStrings.blog,
          page: const BlogPage(),
          bloc: BlocProvider(
            create: (context) => BlogBloc(),
          ),
        ),
        AppRoute(
          route: AppStrings.favPage,
          page: const FavoritesPage(),
          bloc: BlocProvider(
            create: (context) => FavoritesBloc(),
          ),
        ),
      ];

  static MaterialPageRoute onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => settings.name == element.route);
      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => result.first.page,
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => const NoRoute(),
        );
      }
    }
    return MaterialPageRoute(
      builder: (context) => const NoRoute(),
    );
  }

  static List<dynamic> allBlocProviders() {
    List<dynamic> blocProviders = [];
    for (var i in routes()) {
      blocProviders.add(i.bloc);
    }
    return blocProviders;
  }
}

class NoRoute extends StatelessWidget {
  const NoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
