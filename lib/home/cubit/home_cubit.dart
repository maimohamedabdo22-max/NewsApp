import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/model/article_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final dio = Dio();
  Future<void> gethomeData() async {
    try {
      emit(HomeLoading());
      final Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines",
        queryParameters: {
          "apiKey": "756a87add5e349d8af570d839cb7bc58",

          "country": "us",
        },
      );
      final article = response.data['articles'] as List;
      final data = article.map((e) => ArticleModel.fromJson(e)).toList();

      emit(HomeSucces(data));
    } on DioException catch (e) {
      emit(HomeFailure(e.message ?? 'dio excpetion'));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }

  Future<void> getSearchData({required String query}) async {
    try {
      emit(HomeLoading());
      //========== get req=====
      final Response response = await dio.get(
        'https://newsapi.org/v2/everything',
        queryParameters: {
          "apiKey": "6a2bfa8471a048ddab606150547fe945",
          "q": query,
        },
      );
      //=== data processing......

      final articles = response.data['articles'] as List;
      // ===========looping om=n data ......
      final data = articles.map((e) => ArticleModel.fromJson(e)).toList();

      emit(HomeSucces(data));
    } on DioException catch (er) {
      emit(HomeFailure(er.message ?? " Dio Exception"));
    } catch (e) {
      emit(HomeFailure(e.toString()));
    }
  }
}
