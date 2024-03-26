import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/faillures.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchBestSalesBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
