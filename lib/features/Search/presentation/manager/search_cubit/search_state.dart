part of 'search_cubit.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookModel>? books;

  const SearchSuccess({required this.books});
}

class SearchFailure extends SearchState {
  final String errorMessage;

  const SearchFailure({required this.errorMessage});
}
