import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/Home/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImp>(
    HomeRepoImp(
      getIt.get<ApiService>(),
    ),
  );
  getIt.registerSingleton<SearchRepoImpl>(
      SearchRepoImpl(getIt.get<ApiService>()));
}
