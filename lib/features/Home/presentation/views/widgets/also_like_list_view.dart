import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/custom_error_widget.dart';
import 'package:book_app/core/utils/custom_item.dart';
import 'package:book_app/core/utils/custom_loading.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AlsoLikeListView extends StatelessWidget {
  const AlsoLikeListView({super.key, this.displyedId});

  final String? displyedId;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: size.height * 0.15,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: GestureDetector(
                          onTap: state.books[index].id == displyedId
                              ? () {}
                              : () {
                                  GoRouter.of(context).push(
                                      AppRouter.kBookDetailsView,
                                      extra: state.books[index]);
                                },
                          child: CustomItem(
                            imageUrl: state.books[index].volumeInfo.imageLinks
                                    ?.thumbnail ??
                                '',
                          )),
                    ),
                  );
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        } else {
          return const CustomLoadingWidge();
        }
      },
    );
  }
}
