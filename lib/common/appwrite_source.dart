import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appwriteSourceProvider = Provider((ref) => AppwriteSource());

class AppwriteSource {
  Client client = Client()
      .setEndpoint('http://146.59.227.136/v1')
      .setProject('650c75837250eab7661f')
      .setSelfSigned(
          status:
              true); // For self signed certificates, only use for development

  late final Databases dbProvider;
  late final Storage storageProvider;

  AppwriteSource() {
    dbSource();
    storageSource();
  }

  void dbSource() {
    dbProvider = Databases(client);
  }

  void storageSource() {
    storageProvider = Storage(client);
  }
}
