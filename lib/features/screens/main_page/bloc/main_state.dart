part of 'main_bloc.dart';abstract class MainState extends Equatable {  const MainState();}class MainInitial extends MainState {  @override  List<Object> get props => [];}class MainErrorState extends MainState {  final String message;  const MainErrorState(this.message);  @override  List<Object> get props => [];}class MainLoadingState extends MainState {  @override  List<Object> get props => [];}class MainGetDataState extends MainState { final List<Catalog> list; const MainGetDataState(this.list); @override  List<Object> get props => [list];}