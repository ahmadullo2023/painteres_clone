import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:painteres_clone/src/model/pinterest_model.dart';
import 'package:painteres_clone/src/service/dio_service.dart';

part "home_cubit.dart";

abstract class HomeCubitState extends Equatable {
  const HomeCubitState();

  @override
  List<Object?> get props => [];
}

class HomeInitializedState extends HomeCubitState {
  const HomeInitializedState();
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeCubitState {
  const HomeLoadingState();
  @override
  List<Object?> get props => [];
}

class HomeSuccessState extends HomeCubitState {
  final List<PinterestModel> modelList;
  const  HomeSuccessState(this.modelList);
  @override
  List<Object?> get props => [];
}

class HomeErrorState extends HomeCubitState {
  const HomeErrorState(this.errorMessage);
  final String errorMessage;

  @override
  List<Object?> get props => [];
}
