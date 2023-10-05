import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:stickerbank/features/content/domain/entity/content.dart';

class ContentManager extends Equatable {
  Queue<List<Content>> home;
  Queue<List<Content>> search;

  ContentManager({required this.home, required this.search});

  @override
  // TODO: implement props
  List<Object?> get props => [home, search];
}
