import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

enum MediaType {
  img,
  vid,
  gif,
  sticker,
}

class Content extends Equatable{
  final Widget content; // img | circularIndicator
  final String description;
  final MediaType type;
  final int fileId;
  final List<String> tagList;

  const Content(
    this.content,
    this.description,
    this.type,
    this.fileId,
    this.tagList
    );
    
      @override
      List<Object?> get props => [content,tagList,fileId];
}
