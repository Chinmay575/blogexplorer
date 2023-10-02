import 'dart:ui';

import 'package:blogexplorer/src/config/global.dart';
import 'package:blogexplorer/src/presentation/views/blog/bloc/blog_bloc.dart';
import 'package:blogexplorer/src/presentation/views/home/bloc/home_bloc.dart';
import 'package:blogexplorer/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(FetchBlogs());
    super.initState();
  }

  late double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 8,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppStrings.favPage);
              },
              child: Container(
                height: 56,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(15),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Favorites',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is HomeLoaded) {
            if (Global.box.isEmpty) {
              return Container(
                child: const Center(
                  child:
                      Text("Try connecting to Internet or restarting the app"),
                ),
              );
            } else {
              return Container(
                child: ListView.builder(
                  itemCount: Global.box.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<BlogBloc>(context).add(
                              DetailedBlogView(index: index),
                            );
                            Navigator.pushNamed(context, AppStrings.blog);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 25,
                              right: 25,
                              top: 25,
                            ),
                            width: deviceWidth,
                            height: deviceHeight * 0.3,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.outer,
                                  color: Colors.grey,
                                  offset: Offset(5, 5),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  height: deviceHeight * 0.225,
                                  width: deviceWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        Global.box.getAt(index).imageURL,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 15,
                                  ),
                                  child: Text(
                                    Global.box.getAt(index).title,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 40,
                          right: 40,
                          child: ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<HomeBloc>(context).add(AddBlogToFavorites(index: index));
                                  },
                                  child: Icon(
                                    (!Global.box.getAt(index).isFavorite) ? Icons.favorite_border : Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          } else {
            return Container(
              child: const Center(
                child: Text("Error"),
              ),
            );
          }
        },
      ),
    );
  }
}
