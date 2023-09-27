import 'package:appwrite/appwrite.dart';
import 'package:stickerbank/common/utils/data_state.dart';
import 'package:stickerbank/features/content/data/datasource/remote/content_service.dart';
import 'package:stickerbank/features/content/data/model/search.dart';
import 'package:stickerbank/features/content/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final ContentService _contentService;

  SearchRepositoryImpl(this._contentService);
  @override
  ///* success : List<String> mediaDocumentsIDList
  ///* failure : List<String> string list
  Future<DataState> searchDataForHomePage() async {
    late List<Search> searchData;
    late DataState result;

    try {
      searchData =
          await _contentService.fetchAllDocumentsFromSearchCollection();
      result = DataSuccess(makeUniqMediaIDList(searchData));
    } on AppwriteException catch (e) {
      result = DataFailed(
          ["error on fetchAllDocumentsFromSearchCollection", 'error: $e']);
    } catch (e) {
      result = DataFailed(["something went wrong", 'error: $e']);
    }
    return result;
  }

  static List<String> makeUniqMediaIDList(List<Search> searchData) {
    List<String>? mediaDocumentsIDList;
    for (var search in searchData) {
      // adding each list of contentID in a list
      mediaDocumentsIDList!.addAll(search.contentID);
      // merging all list. By converting list to set and doing it back , it kill all doublons
      mediaDocumentsIDList.toSet().toList();
    }
    return mediaDocumentsIDList!;
  }

  @override
  Future<DataState> randomData() {
    // TODO: implement randomData
    throw UnimplementedError();
  }

  @override
  Future<DataState> searchRequest(List<String> param) {
    // TODO: implement searchRequest
    throw UnimplementedError();
  }
}
