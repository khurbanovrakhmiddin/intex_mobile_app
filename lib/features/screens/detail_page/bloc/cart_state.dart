part of 'cart_bloc.dart';abstract class CartState extends Equatable {  const CartState();}class CartInitial extends CartState {  @override  List<Object> get props => [];}class FetchNext extends CartState{  @override  List<Object?> get props =>[];}class LoadedCatalogState extends CartState {  final List<Catalog> catalog;  const LoadedCatalogState(this.catalog);  @override  List<Object> get props => [catalog];}class Loading extends CartState {  @override  List<Object> get props => [];}class ErrorState extends CartState { final String message; const ErrorState(this.message);  @override  List<Object> get props => [];}