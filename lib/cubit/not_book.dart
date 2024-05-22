import 'package:bloc/bloc.dart';
enum BookmarkState { bookmarked, notBookmarked }

class NotBook extends Cubit<BookmarkState> {
  NotBook() : super(BookmarkState.notBookmarked);
  void toggleBookmark() {
    if (state == BookmarkState.bookmarked) {
      emit(BookmarkState.notBookmarked); 
    } else {
      emit(BookmarkState.bookmarked); 
    }
  }
}
