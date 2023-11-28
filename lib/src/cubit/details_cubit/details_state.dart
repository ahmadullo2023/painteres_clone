import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:painteres_clone/src/model/pinterest_model.dart';
import 'package:painteres_clone/src/service/dio_service.dart';

part 'details_cubit.dart';

abstract class DetailsCubitState extends Equatable {
  const DetailsCubitState();
}

class DetailsInitializedState extends DetailsCubitState {
  const DetailsInitializedState();
  @override
  List<Object?> get props => [];
}

class DetailsLoadingState extends DetailsCubitState {
  const DetailsLoadingState();
  @override
  List<Object?> get props => [];
}

class DetailsErrorState extends DetailsCubitState {
  const DetailsErrorState(this.errorMessage);
  final String errorMessage;
  @override
  List<Object?> get props => [];
}

class DetailsSuccessState extends DetailsCubitState{
  final List<PinterestModel> pinterestList;
  const DetailsSuccessState(this.pinterestList);

  @override
  List<Object?> get props => [];

}