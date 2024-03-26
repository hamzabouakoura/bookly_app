import 'package:book_app/core/errors/faillures.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String searchKeyWord});
}
