import 'package:bloc/bloc.dart';
import 'package:blogexplorer/src/config/global.dart';

import '../../../../domain/models/blog.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogState()) {
    on<DetailedBlogView>(
      (event, emit) {
        emit(BlogLoading());
        emit(BlogLoaded(
          index:event.index,
        ));
      },
    );
    on<AddToFavorites>(
      (event, emit) async {
        Blog b = Global.box.getAt(event.index);
        b.isFavorite = !b.isFavorite;
        Global.box.putAt(event.index, b);
        emit(BlogLoaded(index: event.index));
        print(Global.box.getAt(event.index).isFavorite);
      },
    );
  }
}
