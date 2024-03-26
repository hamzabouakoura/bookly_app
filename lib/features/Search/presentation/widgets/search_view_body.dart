import 'package:book_app/features/Search/presentation/widgets/search_list_view.dart';
import 'package:book_app/features/Search/presentation/widgets/search_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SearchTextField(),
        SizedBox(
          height: 10,
        ),
        Text('Results'),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SearchListView(),
        )),
      ],
    );
  }
}
