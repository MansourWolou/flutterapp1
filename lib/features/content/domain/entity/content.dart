import 'package:flutter/material.dart';

enum MediaType {
  img,
  vid,
  gif,
  sticker,
}

class Content {
  final Widget content; // img | circularIndicator
  final String description;
  final MediaType type;
  final int fileId;
  final List<String> tagList;

  Content(
    this.content,
    this.description,
    this.type,
    this.fileId,
    {required this.tagList}
    );
}
