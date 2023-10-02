import 'package:blogexplorer/src/config/global.dart';
import 'package:blogexplorer/src/presentation/views/blog/bloc/blog_bloc.dart';
import 'package:blogexplorer/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({super.key});

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  void initState() {
    super.initState();
  }

  late double deviceHeight, deviceWidth;
  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<BlogBloc, BlogState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BlogLoaded) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppStrings.home);
                },
                icon: Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<BlogBloc>().add(
                          AddToFavorites(
                            index: state.index,
                          ),
                        );
                  },
                  icon: (!Global.box.getAt(state.index).isFavorite)
                      ? const Icon(
                          Icons.favorite_border,
                        )
                      : const Icon(
                          Icons.favorite,
                        ),
                ),
                IconButton.filled(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
              backgroundColor: Colors.black,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: deviceWidth,
                    height: deviceHeight * 0.25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          Global.box.getAt(state.index).imageURL,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    Global.box.getAt(state.index).title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is BlogLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}
