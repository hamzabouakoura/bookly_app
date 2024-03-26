import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/Home/data/repos/home_repo_impl.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/best_sales_cubit/best_sales_cubit.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => BestSalesCubit(
            getIt.get<HomeRepoImp>(),
          )..getBestSalesBooks(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImp>(),
          )..getFeaturedBooks(),
        ),
      ], child: const HomeViewBody()),
    );
  }
}
