import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/features/content/data/datasource/remote/content_service.dart';
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
  List<Content> getLandingContent() {
    // TODO: implement getLandingContent
    /// define a specif set of tags
    /// query a specifiq set of tags
    /// make sure that the result list has no doublons
    /// return list of id
    throw UnimplementedError();
  }
}
