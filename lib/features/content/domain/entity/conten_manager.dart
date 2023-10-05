import 'package:equatable/equatable.dart';
import 'package:stickerbank/common/utils/Starck.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';

class ContentManager extends Equatable {
  final Stack<List<Content>> home;
  final Stack<List<Content>> search;

  const ContentManager({required this.home, required this.search});

  ContentManager copyWith(
      {Stack<List<Content>>? homeStack, Stack<List<Content>>? searchStack}) {
    return ContentManager(
        home: homeStack ?? home, search: searchStack ?? search);
  }

  @override
  List<Object?> get props => [home, search];
}
