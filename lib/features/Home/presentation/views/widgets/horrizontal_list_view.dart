import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/utils/custom_item.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: size.height * 0.31,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: AspectRatio(
                      aspectRatio: 2 / 3,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: state.books[index]);
                        },
                        child: CustomItem(
                          imageUrl: state.books[index].volumeInfo.imageLinks
                                  ?.thumbnail ??
                              'https://images.pexels.com/photos/4238507/pexels-photo-4238507.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        ),
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
