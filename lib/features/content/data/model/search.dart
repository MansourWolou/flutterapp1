class Search {
  final String tag;
  final List<String> contentID;

  Search(this.tag, this.contentID);

  factory Search.fromMap(Map<String, dynamic> map) {
    return Search(map['tag'].toString(), map['contentID']);
  }
}
