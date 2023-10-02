import 'package:bloc/bloc.dart';

import '../../../../config/global.dart';
import '../../../../domain/models/blog.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<FetchBlogs>((event, emit) async {
      emit(HomeLoading());
      emit(HomeLoaded());
    });
    on<DisplayDetailedBlog>(
      (event, emit) {
        emit(NavigateToDetailedView());
      },
    );
    on<AddBlogToFavorites>(
      (event, emit) {
        emit(HomeLoading());
        Blog b = Global.box.getAt(event.index);
        b.isFavorite = !b.isFavorite;
        Global.box.putAt(event.index, b);
        emit(HomeLoaded());
      },
    );
  }
}
