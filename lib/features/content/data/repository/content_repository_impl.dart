import 'dart:io';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/widgets.dart';
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
  Future<DataState> getContentForHomePage(
      List<String> mediaDocumentsIDList) async {
    List<Media> mediaData;
    List<Content> contentData = [];
    DataState result;

    try {
      mediaData = await _contentService
          .fetchMediaListFromMediaCollection(mediaDocumentsIDList!);
      for (var media in mediaData) {
        final val =
            await _contentService.fetchFilePreviewFromStorage(media.fileID);

        //? dont know what to do withe the string yet
        // String fileNameInTmpDir = saveContentTemporary(val);

        // TODO: NEED MORE ATTRIBUT ON MEDIA TYPE
        contentData.add(Content(Image.memory(val), media.description,
            MediaType.img, media.fileID, media.tagList));
      }
      result = DataSuccess(contentData);
    } on AppwriteException catch (e) {
      result = DataFailed(
          ["error on fetchMediaListFromMediaCollection", 'error: $e']);
    } catch (e) {
      result = DataFailed(["something went wrong", 'error: $e']);
    }

    return result;
  }

  @override
  Future<DataState> getContentFromTmpDir() {
    // TODO: implement getContentFromTmpDir
    throw UnimplementedError();
  }

  String saveContentTemporary(Uint8List fileData) {
    String fileName = DateTime.now().toString();
    // add file to tmp dir
    //! what do i do about the file extension
    File file = File('${AppwriteConstants.getTmpDir()}/$fileName');
    file.writeAsBytesSync(fileData);

    return fileName;
  }
}

/// data search:
/// getting the result request , try to catch error , return  list of media data with no doubllons
/// 
/// fetch file corresponding to each media data
/// 
/// save preview file in tmpDir
