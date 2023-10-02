// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorites_bloc.dart';

abstract class FavoritesEvent {}

class ToggleFavoriteBlog extends FavoritesEvent {
  int index;
  ToggleFavoriteBlog({
    required this.index,
  });
}
