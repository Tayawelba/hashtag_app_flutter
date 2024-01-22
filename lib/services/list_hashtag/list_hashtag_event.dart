part of 'list_hashtag_bloc.dart';

abstract class ListHashtagEvent extends Equatable {
  const ListHashtagEvent();

  @override
  List<Object> get props => [];
}
  class _OnHashtagUpdatedListHashTagEvent extends ListHashtagEvent {
    final List<HashtagModel> hashtags;

    const _OnHashtagUpdatedListHashTagEvent({
      required this.hashtags,
  });

    @override
    List<Object> get props => [
      hashtags,
    ];
  }

