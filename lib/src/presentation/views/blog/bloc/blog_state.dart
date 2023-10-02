// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'blog_bloc.dart';

class BlogState {}

class BlogLoading extends BlogState {}

class BlogLoaded extends BlogState {
  int index;

  BlogLoaded({
    required this.index,
  });
}
