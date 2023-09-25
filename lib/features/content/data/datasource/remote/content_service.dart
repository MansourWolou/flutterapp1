import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/common/appwrite_source.dart';
import 'package:stickerbank/constants/appwrite_constants.dart';
import 'package:stickerbank/features/content/data/model/search.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';

final contentServiceProvider = Provider((ref) {
  final appwriteProvider = ref.watch(appwriteSourceProvider);
  return ContentService(appwriteProvider);
});

class ContentService {
  final AppwriteSource _appwriteSource;

  ContentService(this._appwriteSource);
  
  /// 
  Future<List<Search>> fetchAllSearchDocuments(String tagPram) async {
    DocumentList searchDocuments = await  _appwriteSource.dbProvider.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.searchCollection,
        queries: [Query.isNotNull("tag")]);
    Search tmp;
    // searchDocuments.documents.forEach((element) {tmp = element.data})
    throw UnimplementedError();
  }

  List<Search> randomSearch() {
    throw UnimplementedError();
  }

  List<Content> getContentList(List<String> contentDataList) {
    throw UnimplementedError();
  }
}
