// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_bloc.dart';

abstract class BlogEvent {}

class DetailedBlogView extends BlogEvent {
  int index;
  DetailedBlogView({
    required this.index,
  });
}

class AddToFavorites extends BlogEvent {
  int index;

  AddToFavorites({
    required this.index,
  });
}
