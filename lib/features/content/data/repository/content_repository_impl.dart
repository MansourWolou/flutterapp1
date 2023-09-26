import 'dart:io';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/common/utils/data_state.dart';
import 'package:stickerbank/constants/appwrite_constants.dart';
import 'package:stickerbank/features/content/data/datasource/remote/content_service.dart';
import 'package:stickerbank/features/content/data/model/media.dart';
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
    late List<Search> searchData;
    List<String>? contentDocumentsList;
    List<Media> mediaData;
    DataState result;


    try {
      searchData =
          await _contentService.fetchAllDocumentsFromSearchCollection();
    } on AppwriteException catch (e) {
      result = DataFailed(
          ["error on fetchAllDocumentsFromSearchCollection", 'error: $e']);
    } catch (e) {
      result = DataFailed(["something went wrong", 'error: $e']);
    }

    for (var search in searchData) {
      // adding each list of contentID in a list
      contentDocumentsList!.addAll(search.contentID);
      // merging all list. By converting list to set and doing it back , it kill all doublons
      contentDocumentsList.toSet().toList();
    }

    try {
      mediaData = await _contentService
          .fetchMediaListFromMediaCollection(contentDocumentsList!);
      for (var media in mediaData) {
        final val = await _contentService.fetchFilePreviewFromStorage(media.fileID);
        // add file to tmp dir
        File file = File('${AppwriteConstants.getTmpDir()}/filename.ext');
        file.writeAsBytesSync(val);
      }
      result = DataSuccess(mediaData);
    } on AppwriteException catch (e) {
      result = DataFailed(
          ["error on fetchMediaListFromMediaCollection", 'error: $e']);
    } catch (e) {
      result = DataFailed(["something went wrong", 'error: $e']);
    }

    return result;
  }
}
