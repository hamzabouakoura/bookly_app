import 'package:bloc/bloc.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());

  SearchRepo searchRepo;
  Future<void> getSearchedBooks({required String searchKeyWord}) async {
    emit(SearchLoading());
    var result =
        await searchRepo.fetchSearchedBooks(searchKeyWord: searchKeyWord);
    result.fold((failure) {
      emit(SearchFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books: books));
    });
  }
}
