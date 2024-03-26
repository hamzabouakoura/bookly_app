part of 'best_sales_cubit.dart';

 class BestSalesState extends Equatable {
  const BestSalesState();

  @override
  List<Object> get props => [];
}

 class BestSalesInitial extends BestSalesState {}
 class BestSalesSuccess extends BestSalesState {
  final List<BookModel> books;

 const BestSalesSuccess({required this.books});
 }
 class BestSalesLoading extends BestSalesState {}
 class BestSalesFailure extends BestSalesState {
  final String errorMessage;

 const BestSalesFailure({required this.errorMessage});
 }
