import 'dart:async';import 'package:bloc/bloc.dart';import 'package:equatable/equatable.dart';import 'package:intex_mobile_app/core/models/Catalog_model.dart';part 'cart_event.dart';part 'cart_state.dart';class CartBloc extends Bloc<CartEvent, CartState> {  CartBloc() : super(CartInitial()) {    on<SendOrderEvent>((event, emit) {});  }  FutureOr<void> _send(SendOrderEvent event ,Emitter<CartState>  emit)async{    ///TODO:SEND    ///    try{      emit(CartSending());      ///send      emit(CartSuccessSend());    }catch(e){      emit(CartError());    }  }}