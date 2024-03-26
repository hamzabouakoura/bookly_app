import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/Home/data/repos/search_repo_impl.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/Home/presentation/views/book_details_view.dart';
import 'package:book_app/features/Home/presentation/views/home_view.dart';
import 'package:book_app/features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:book_app/features/Search/presentation/views/search_view.dart';
import 'package:book_app/features/Splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';

  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
