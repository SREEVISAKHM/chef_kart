import 'package:chef_kart/model/detail_page_model.dart';
import 'package:chef_kart/repository/ingredients_page_repository.dart';
import 'package:flutter/material.dart';

import '../data/response/api_response.dart';

class IngredientsViewModel with ChangeNotifier {
  final ingredientsRepository = IngredientsRepository();

  ApiResponse<DetailPageModel> detailPageData = ApiResponse.loading();
  setHomePageData(ApiResponse<DetailPageModel> response) {
    detailPageData = response;
    notifyListeners();
  }

  Future<void> fetchDetailPageData() async {
    setHomePageData(
      ApiResponse.loading(),
    );
    ingredientsRepository.fetchDetailata().then(
      (value) {
        setHomePageData(
          ApiResponse.compleated(value),
        );
      },
    ).onError(
      (error, stackTrace) {
        setHomePageData(
          ApiResponse.error(
            error.toString(),
          ),
        );
      },
    );
  }
}
