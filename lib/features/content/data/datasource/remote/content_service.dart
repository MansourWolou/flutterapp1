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

  ///! make test to check that method if it work well
  Future<List<Search>> fetchAllSearchDocuments() async {
    List<Search>? result;
    DocumentList getAllSearchDocuments = await _appwriteSource.dbProvider
        .listDocuments(
            databaseId: AppwriteConstants.databaseId,
            collectionId: AppwriteConstants.searchCollection,
            queries: [Query.isNotNull("tag")]);

    getAllSearchDocuments.documents.forEach((element) {
      result!.add(element.data as Search);//mapping
    });
    return result!;
  }

  List<Search> randomSearch() {
    throw UnimplementedError();
  }

  //! TOCHECK
  Future<List<Content>> getContentList(List<String> contentIDList) async {
    List<Content>? result;
    for (var contentID in contentIDList) {
      Document getContentDocumentByID = await _appwriteSource.dbProvider
          .getDocument(
              databaseId: AppwriteConstants.databaseId,
              collectionId: AppwriteConstants.mediaCollection,
              documentId: contentID);

      result!.add(getContentDocumentByID.data as Content);//mapping
    }

    return result!;
  }
}
