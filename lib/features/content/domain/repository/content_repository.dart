import 'package:stickerbank/features/content/domain/entity/content.dart';

abstract class ContentRepository {
  /// select a list (of more or less random) tag to get there fileIdd list
  /// each file id is unique
  /// delete the doublons before return
  List<String> searchData();

  /// fetch the preview image 
  /// return Content
  List<Content> getContentList(List<String> contentDataList);

}