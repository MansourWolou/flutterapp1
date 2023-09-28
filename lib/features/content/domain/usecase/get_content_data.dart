import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/features/content/data/repository/content_repository_impl.dart';
import 'package:stickerbank/features/content/data/repository/searh_repositroy_impl.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';
import 'package:stickerbank/features/content/domain/repository/content_repository.dart';
import 'package:stickerbank/features/content/domain/repository/search_repository.dart';

import '../../../../common/utils/data_state.dart';
import '../../../../common/utils/usecase.dart';

final getContentData = Provider((ref) {
  final contentRepository = ref.watch(contentRepositoryImpl);
  final searchRepository = ref.watch(searchRepositoryImpl);
  return GetContentData(contentRepository, searchRepository);
});

/// role:
/// get a list of content with different tag. (img/video/gif)
/// param: none
/// return:list of Content on success. same on error but image attribut will be circularIndiacator on error
///
class GetContentData implements UseCase<DataState, void> {
  final ContentRepository _contentRepository;
  final SearchRepository _searchRepository;

  GetContentData(this._contentRepository, this._searchRepository);

  @override
  Future<DataState> call({void params}) async {
    DataState result = DataFailed(["data not initialized yet"]);
    final DataState content;
    final DataState search;

    search = await _searchRepository.searchDataForHomePage();
      print("__________going through");

    if (search.runtimeType == DataSuccess<List<String>>) {
      content = await _contentRepository.getContentForHomePage(search.data);
      if (content.runtimeType == DataSuccess<List<Content>>) {
        result = content;
      }
    }
    return result;
  }
}
