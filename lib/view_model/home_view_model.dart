import 'package:flutter/material.dart';

import 'package:chef_kart/data/response/api_response.dart';
import 'package:chef_kart/model/home_page_model.dart';
import 'package:chef_kart/repository/home_page_repository.dart';

class HomeViewModel with ChangeNotifier {
  final homePageRepository = HomePageRepository();

  ApiResponse<HomePageModel> homePageData = ApiResponse.loading();
  setHomePageData(ApiResponse<HomePageModel> response) {
    homePageData = response;
    notifyListeners();
  }

  Future<void> fetchHomeData() async {
    setHomePageData(
      ApiResponse.loading(),
    );
    homePageRepository.fetchHomeData().then(
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
