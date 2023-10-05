import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stickerbank/features/content/data/repository/content_repository_impl.dart';
import 'package:stickerbank/features/content/data/repository/search_repositroy_impl.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';
import 'package:stickerbank/features/content/domain/repository/content_repository.dart';
import 'package:stickerbank/features/content/domain/repository/search_repository.dart';

import '../../../../common/utils/data_state.dart';
import '../../../../common/utils/usecase.dart';

part 'get_landing_data.g.dart';

@riverpod
GetLandingData getLandingData(GetLandingDataRef ref) {
  final ContentRepositoryImpl contentRepository =
      ref.watch(contentRepositoryImplProvider);
  final SearchRepositoryImpl searchRepository =
      ref.watch(searchRepositoryImplProvider);
  return GetLandingData(contentRepository, searchRepository);
}

/// role:
/// get a list of content with different tag. (img/video/gif)
/// param: none
/// return:list of Content on success. same on error but image attribut will be circularIndiacator on error
///
class GetLandingData implements UseCase<List<Content>, void> {
  final ContentRepository _contentRepository;
  final SearchRepository _searchRepository;

  GetLandingData(this._contentRepository, this._searchRepository);

  @override
  Future<List<Content>> call({void params}) async {
    List<Content> result = [];
    final DataState content;
    final DataState search;

    search = await _searchRepository.searchDataForHomePage();

    if (search.runtimeType == DataSuccess<List<String>>) {
      content = await _contentRepository.getContentForHomePage(search.data);
      if (content.runtimeType == DataSuccess<List<Content>>) {
        result = content.data;
      } else {
        // no content foound
        result = [];
      }
    }

    return result;
  }
}
