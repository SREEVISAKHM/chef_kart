import 'package:chef_kart/model/detail_page_model.dart';

import '../data/network/network_api_services.dart';
import '../utils/app_urls.dart';

class IngredientsRepository {
  final NetworkApiServices _apiServices = NetworkApiServices();

  Future<DetailPageModel> fetchDetailata() async {
    try {
      dynamic response =
          await _apiServices.getGetDetailApiResponse(APPUrl.detailUrl);
      return DetailPageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
