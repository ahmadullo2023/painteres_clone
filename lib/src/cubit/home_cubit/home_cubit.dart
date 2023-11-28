part of 'home_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(const HomeInitializedState()){
    getAllData();
  }

  Future getAllData() async {
    emit(const HomeLoadingState());
    NetworkDioService().getAllData().then(
      (dynamic response) {
        if (response is Response) {
          List<PinterestModel> responseData = (response.data as List)
              .map((e) => PinterestModel.fromJson(e))
              .toList();
          emit(HomeSuccessState(responseData));
        }else{
          emit(const HomeErrorState("error response homeErrorState"));
        }
      },
    );
  }
}
