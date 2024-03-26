import 'package:book_app/core/errors/faillures.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String searchKeyWord}) async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$searchKeyWord');
      List<BookModel> books = [];
      if (data['items'] == null) {
        return left(const ServerFailure('No results'));
      } else {
        for (var item in data['items']) {
          books.add(BookModel.fromJson(item));
        }
        return right(books);
      }
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
