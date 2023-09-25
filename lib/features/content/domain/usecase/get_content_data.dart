

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/features/content/data/repository/content_repository_impl.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';
import 'package:stickerbank/features/content/domain/repository/content_repository.dart';

import '../../../../common/utils/data_state.dart';
import '../../../../common/utils/usecase.dart';

final getContentData = Provider((ref) {
  final contentRepository = ref.watch(contentRepositoryImpl);
  return GetContentData(contentRepository);
});

/// role:
/// get a list of content with different tag. (img/video/gif)
/// param: none
/// return:list of Content on success. same on error but image attribut will be circularIndiacator on error
/// 
class GetContentData implements UseCase<DataState,void> {
  final ContentRepository _contentRepository;

  GetContentData(this._contentRepository);

  @override
  Future<DataState> call({void params}) async {
    // TODO: implement call
    final DataState result;
    final DataState content;

    content =  await _contentRepository.getLandingContent();
    if (content.runtimeType == DataSuccess<List<Content>>) {
      
    }
    throw UnimplementedError();
  }

  
}