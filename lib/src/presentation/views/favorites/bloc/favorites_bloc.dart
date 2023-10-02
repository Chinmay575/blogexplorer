import 'package:bloc/bloc.dart';
import 'package:blogexplorer/src/config/global.dart';
import 'package:blogexplorer/src/domain/models/blog.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState()) {
    on<ToggleFavoriteBlog>((event, emit) {
      Blog b = Global.box.getAt(event.index);
      b.isFavorite = !b.isFavorite;
      Global.box.putAt(event.index, b);
    });
  }
}
