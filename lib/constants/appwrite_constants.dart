class AppwriteConstants {
  static const String databaseId = '650c769ece793f870892';
  static const String projectId = '650c75837250eab7661f';
  static const String endPoint = 'http://146.59.227.136/v1';

  static const String mediaCollection = '650c76b72e8d781d5aa7';
  static const String searchCollection = '650c76b1f2610e76d4d0';

  static const String imagesBucket = '650c76c905196b972050';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}