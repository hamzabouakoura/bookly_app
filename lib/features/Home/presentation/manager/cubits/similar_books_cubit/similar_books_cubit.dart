import 'package:bloc/bloc.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  HomeRepo homeRepo;

  Future<void> getSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books: books));
    });
  }
}
