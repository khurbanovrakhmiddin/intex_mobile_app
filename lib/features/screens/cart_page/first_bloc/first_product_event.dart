part of 'first_product_bloc.dart';abstract class FirstProductEvent extends Equatable {  const FirstProductEvent();}class ProductFirstGetByStatusEvent extends FirstProductEvent {  final int id;  const ProductFirstGetByStatusEvent(this.id);  @override  List<Object?> get props => [];}