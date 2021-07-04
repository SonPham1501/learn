import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:learn/data/result_model/result_get_comment.dart';
import 'package:learn/data/result_model/result_get_photo.dart';

@immutable
abstract class CommentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CommentFetchInitial extends CommentState {}

class CommentFetchSuccess extends CommentState {
  final List<ResultGetPhotos> comments;
  final bool hasListEnd;

  CommentFetchSuccess({required this.comments, this.hasListEnd = false});

  @override
  List<Object?> get props => [comments, hasListEnd];

  CommentFetchSuccess copyWith({List<ResultGetPhotos>? comments, bool? hasListEnd}) => CommentFetchSuccess(
        comments: comments ?? this.comments,
        hasListEnd: hasListEnd ?? this.hasListEnd,
      );
}

class CommentFetchFailure extends CommentState {}
