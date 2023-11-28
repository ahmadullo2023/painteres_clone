part of 'details_state.dart';

class DetailsCubit extends Cubit<DetailsCubitState> {
  DetailsCubit() : super(const DetailsInitializedState()) {
    getAllImages();
  }

  Future getAllImages() async {
    emit(const DetailsLoadingState());
    await NetworkDioService().getAllData().then(
      (dynamic response) {
        if (response is Response) {
          List<PinterestModel> pinterest = (response.data as List)
              .map((e) => PinterestModel.fromJson(e))
              .toList();
          emit(DetailsSuccessState(pinterest));
        }else{
          emit(const DetailsErrorState("error details cubit"));
        }
      },
    );
  }
}
