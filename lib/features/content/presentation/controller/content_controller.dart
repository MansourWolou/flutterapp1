
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/features/content/domain/usecase/get_content_data.dart';

// def state
final contentList = FutureProvider((ref) {
  return ref.watch(getContentData);
});

class ContentController {
  final GetContentData getContentData;
  //The ProviderRef gives us access to functions involving the state of our app.
   final ProviderRef ref;

  ContentController(this.getContentData, this.ref);
  
  getContent(){
    getContentData();
    ref.refresh(contentList);
  }
}