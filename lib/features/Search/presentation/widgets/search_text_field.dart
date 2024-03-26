import 'package:book_app/features/Search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIconColor: Colors.white,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Search',
          suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<SearchCubit>(context)
                  .getSearchedBooks(searchKeyWord: searchController.text);
            },
            icon: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
