// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

abstract class HomeEvent {}

class FetchBlogs extends HomeEvent {}

class DisplayDetailedBlog extends HomeEvent {}

class AddBlogToFavorites extends HomeEvent {
  int index;
  AddBlogToFavorites({
    required this.index,
  });
}
