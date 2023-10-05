import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stickerbank/common/utils/data_state.dart';
import 'package:stickerbank/features/content/domain/entity/conten_manager.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';
import 'package:stickerbank/features/content/domain/usecase/get_landing_data.dart';

part 'content_controller.g.dart';

@riverpod
class ContentController extends _$ContentController {
  @override
  ContentManager test = ContentManager(
      home: Queue<List<Content>>(), search: Queue<List<Content>>());
  // 5. override the [build] method to return a [FutureOr]
  @override
  FutureOr<ContentManager> build(ContentManager test) {
    // 6. return a value (or do nothing if the return type is void)
    test.home = Queue<List<Content>>();
    test.search = Queue<List<Content>>();
    return ContentManager(
        home: Queue<List<Content>>(), search: Queue<List<Content>>());
  }

  Future<void> getContent() async {
    final contentsMethod = ref.read(getLandingData);
    final contentData = await contentsMethod();
    state = const AsyncLoading();
    // state.value.home.add(await AsyncValue.guard(() => contentData));
    AsyncValue.data(state.whenData((value) => value.home.add(contentData)));
    // state = AsyncData(test.home.add(contentData));
  }
}

// @riverpod
// Future<ContentManager> maState(Ref ref) async => ContentManager(home: Queue<List<Content>>(), search: Queue<List<Content>>());