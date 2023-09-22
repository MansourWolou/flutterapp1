import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/common/appwrite_source.dart';
import 'package:stickerbank/features/content/data/model/search.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';

final contentServiceProvider = Provider((ref) {
  final appwriteProvider = ref.watch(appwriteSourceProvider);
  return ContentService(appwriteProvider);
});

class ContentService {
  final AppwriteSource _appwriteSource;

  ContentService(this._appwriteSource);

  List<Search> contentIdSearchRequest(String tagPram) {
    // _appwriteSource.dbProvider.listDocuments(databaseId: databaseId, collectionId: collectionId)
    throw UnimplementedError();
  }

  List<Search> randomSearch() {
    throw UnimplementedError();
  }

  List<Content> getContentList(List<String> contentDataList) {
    throw UnimplementedError();
  }


}
