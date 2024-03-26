import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/custom_error_widget.dart';
import 'package:book_app/core/utils/custom_loading.dart';
import 'package:book_app/features/Home/presentation/views/widgets/custom_item_card.dart';
import 'package:book_app/features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(
            child: Text('Find your book now !'),
          );
        } else if (state is SearchSuccess) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books![index]);
                    },
                    child: CustomItemCard(
                      book: state.books![index],
                    ),
                  ),
                );
              });
        } else if (state is SearchFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidge();
        }
      },
    );
  }
}
