import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/best_sales_cubit/best_sales_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'custom_item_card.dart';

class VerticalListView extends StatelessWidget {
  const VerticalListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSalesCubit, BestSalesState>(
      builder: (context, state) {
        if (state is BestSalesSuccess) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: state.books[index].volumeInfo.imageLinks == null
                        ? CustomItemCard(
                            book: state.books[index + 1],
                          )
                        : CustomItemCard(
                            book: state.books[index],
                          ),
                  ),
                );
              });
        } else if (state is BestSalesFailure) {
          return Text(state.errorMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
