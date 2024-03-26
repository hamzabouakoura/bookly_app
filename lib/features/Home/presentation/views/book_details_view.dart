import 'package:book_app/features/Home/data/models/book_model/book_model.dart';
import 'package:book_app/features/Home/presentation/manager/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(
        category:
            widget.bookModel.volumeInfo.categories?[0] ?? 'computer science');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(
        bookModel: widget.bookModel,
      ),
    );
  }
}
