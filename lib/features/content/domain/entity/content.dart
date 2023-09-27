import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//! useless
enum MediaType {
  img,
  vid,
  gif,
  sticker,
}

class Content extends Equatable {
  final Widget content; // img | circularIndicator
  final String description;
  final MediaType type;
  final String fileId;
  final List<String> tagList;

  const Content(
      this.content, this.description, this.type, this.fileId, this.tagList);

  @override
  List<Object?> get props => [content, tagList, fileId];
}
