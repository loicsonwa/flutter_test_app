import 'package:dio/dio.dart';
import 'package:flutter_test_app/constants/constants.dart';
import 'package:flutter_test_app/data/provider/api_client.dart';

class ItemRepository {
  Future<Response> getItemList(int offset) async {
    final apiClient =
    ApiClient(appBaseUrl: AppConstants.BASE_URL);
    return await apiClient.getData('${AppConstants.GET_ITEM_URI}?_page=$offset&_limit=20');
  }

  Future<Response> searchByTitle(String query) async {
    final apiClient =
    ApiClient(appBaseUrl: AppConstants.BASE_URL);
    return await apiClient.getData('${AppConstants.SEARCH_URI}?title=$query&_page=1&_limit=20');
  }
}
