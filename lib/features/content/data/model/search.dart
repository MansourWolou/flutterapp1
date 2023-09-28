import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final String tag;
  final List<String> contentID;

  const Search(this.tag, this.contentID);

  factory Search.fromMap(Map<String, dynamic> map) {
    return Search(map['tag'].toString(), List<String>.from(map['contentID']));
  }

  @override
  List<Object?> get props => [tag, contentID];
}
