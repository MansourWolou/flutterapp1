import 'dart:io' as io;
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stickerbank/common/appwrite_source.dart';
import 'package:stickerbank/constants/appwrite_constants.dart';
import 'package:stickerbank/features/content/data/model/media.dart';
import 'package:stickerbank/features/content/data/model/search.dart';

part 'content_service.g.dart';

@riverpod
ContentService contentService(ContentServiceRef ref) {
  final AppwriteSource appwriteProvider = ref.watch(appwriteClientProvider);
  return ContentService(appwriteProvider);
}

class ContentService {
  final AppwriteSource _appwriteSource;
  late io.Directory tempDir;
  ContentService(this._appwriteSource);

  ///! make test to check that method if it work well
  Future<List<Search>> fetchAllDocumentsFromSearchCollection() async {
    List<Search> result = [];
    late DocumentList getAllSearchDocuments;

    getAllSearchDocuments = await _appwriteSource.dbProvider.listDocuments(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.searchCollection,
        queries: [Query.isNotNull("tag")]);

    for (var element in getAllSearchDocuments.documents) {
      //! check if data mapping is donne well
      result.add(Search.fromMap(element.data)); //mapping
    }

    return result;
  }

  List<Search> randomSearch() {
    throw UnimplementedError();
  }

  //! TOCHECK
  Future<List<Media>> fetchMediaListFromMediaCollection(
      List<String> contentIDList) async {
    List<Media> result = [];

    for (var contentID in contentIDList) {
      Document getContentDocumentByID = await _appwriteSource.dbProvider
          .getDocument(
              databaseId: AppwriteConstants.databaseId,
              collectionId: AppwriteConstants.mediaCollection,
              documentId: contentID);

      //! check if data mapping is donne well
      result.add(Media.fromMap(getContentDocumentByID.data)); //mapping
    }

    return result;
  }

  Future<Uint8List> fetchFilePreviewFromStorage(String fileID) async {
    late final Uint8List contentFile;
    try {
      contentFile = await _appwriteSource.storageProvider.getFilePreview(
          bucketId: AppwriteConstants.imagesBucket, fileId: fileID);
    } catch (e) {
      print(e);
    }
    return contentFile;
    // file = io.File('$tempDir/filename.ext');
    // file.writeAsBytesSync(contentFile);
  }
}
