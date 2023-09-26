import 'package:equatable/equatable.dart';

class Media extends Equatable {
  final String description;
  final List<String> tagList;
  final String fileID;

  const Media(this.description, this.tagList, this.fileID);

  factory Media.fromMap(Map<String,dynamic> map) {
    return Media(map["description"], map['tagList'], map["fileID"]);
  }

  @override
  List<Object?> get props => [description, tagList, fileID];
}
