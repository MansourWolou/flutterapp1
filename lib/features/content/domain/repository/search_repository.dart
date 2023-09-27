import 'package:stickerbank/common/utils/data_state.dart';

/// everything about researching content on the app
/// 
abstract class SearchRepository {
  Future<DataState> searchDataForHomePage();
  Future<DataState> randomData();
  Future<DataState> searchRequest(List<String> param);
}