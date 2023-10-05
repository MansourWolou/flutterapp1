import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stickerbank/common/utils/Starck.dart';
import 'package:stickerbank/features/content/domain/entity/conten_manager.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';
import 'package:stickerbank/features/content/domain/usecase/get_landing_data.dart';

part 'content_controller.g.dart';

@riverpod
class ContentController extends _$ContentController {
  // 5. override the [build] method to return a [FutureOr]
  @override
  FutureOr<ContentManager> build(ContentManager test) {
    // 6. return a value (or do nothing if the return type is void)
    return ContentManager(
        home: Stack<List<Content>>(), search: Stack<List<Content>>());
  }

  Future<void> getHomeLandingContent() async {
    final contentsMethod = ref.read(getLandingDataProvider);

    ContentManager sstate = ContentManager(
        home: Stack<List<Content>>(), search: Stack<List<Content>>());

    // AsyncValue<ContentManager> newstate = state;

    // sstate = newstate.copyWith(homeStack: Stack<List<Content>>());

    state = const AsyncLoading();
    //  final List<Content> contentData = await contentsMethod();
    // state.value.home.add(await AsyncValue.guard(() => contentData));
    // AsyncValue.data(state.whenData((value) => value.home.add(contentData)));
    // state.whenData((value) => value.home.push(contentData));
    // state = AsyncData(test.home.add(contentData));
    state = await AsyncValue.guard(() async {
      ContentManager? newstatedata = state.value;

      final List<Content> contentData = await contentsMethod();
      newstatedata?.home.push(contentData);

      return Future.value(newstatedata);
    });
  }
}
