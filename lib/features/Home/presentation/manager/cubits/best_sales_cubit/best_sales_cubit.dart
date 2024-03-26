import 'package:bloc/bloc.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_sales_state.dart';

class BestSalesCubit extends Cubit<BestSalesState> {
  BestSalesCubit(this.homeRepo) : super(BestSalesInitial());

  final HomeRepo homeRepo;

  Future<void> getBestSalesBooks() async {
    emit(BestSalesLoading());
    var result = await homeRepo.fetchBestSalesBooks();
    result.fold((failure) {
      emit(BestSalesFailure(errorMessage: failure.errorMessage));
    }, (books) {
      emit(BestSalesSuccess(books: books));
    });
  }
}
