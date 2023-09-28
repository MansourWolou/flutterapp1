
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stickerbank/features/content/domain/usecase/get_content_data.dart';

// def state
final contentList = FutureProvider((ref) {
  return ref.watch(getContentData);
});

// creating controller provider
final contentControllerProvider = Provider((ref) { 
  final content = ref.watch(getContentData);
  return ContentController(content, ref);
});

class ContentController {
  final GetContentData getContentData;
  //The ProviderRef gives us access to functions involving the state of our app.
   final ProviderRef ref;

  ContentController(this.getContentData, this.ref);
  
  getContent(){
    var dt = getContentData();
    print("usecase result");
    print(dt);
    ref.refresh(contentList);
  }
}