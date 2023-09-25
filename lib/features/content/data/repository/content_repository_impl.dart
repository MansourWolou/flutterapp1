import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/common/utils/data_state.dart';
import 'package:stickerbank/features/content/data/datasource/remote/content_service.dart';
import 'package:stickerbank/features/content/data/model/search.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';
import 'package:stickerbank/features/content/domain/repository/content_repository.dart';

final contentRepositoryImpl = Provider((ref) {
  final contentService = ref.watch(contentServiceProvider);
  return ContentRepositoryImpl(contentService);
});

class ContentRepositoryImpl implements ContentRepository {
  final ContentService _contentService;

  ContentRepositoryImpl(this._contentService);

  @override
  //! TOCHECK
  Future<DataState> getLandingContent() async {
    // TODO: implement getLandingContent
    /// define a specif set of tags
    /// query a specifiq set of tags
    /// make sure that the result list has no doublons
    /// return list of id
    ///List<Content>
    List<Search> searchData;
    List<String>? contentDocumentsList;
    List<Content> contentData;
    DataState result;

    try {
      searchData = await _contentService.fetchAllSearchDocuments();
      for (var search in searchData) {
        // adding each list of contentID in a list
        contentDocumentsList!.addAll(search.contentID);
        // merging all list. By converting list to set and doing it back , it kill all doublons
        contentDocumentsList.toSet().toList();
      }
      contentData = await _contentService.getContentList(contentDocumentsList!);
      result = DataSuccess(contentData);
    } catch (e) {
      result = DataFailed(["something went wrong"]);
    }

    return result;
  }
}
