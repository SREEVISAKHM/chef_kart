import 'package:chef_kart/data/network/base_api_services.dart';
import 'package:chef_kart/data/network/network_api_services.dart';
import 'package:chef_kart/model/home_page_model.dart';
import 'package:chef_kart/utils/app_urls.dart';

class HomePageRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<HomePageModel> fetchHomeData() async {
    try {
      dynamic response =
          await _apiServices.getGetHomeApiResponse(APPUrl.homeUrl);
      return HomePageModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
