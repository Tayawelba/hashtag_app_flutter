part of 'list_hashtag_bloc.dart';

abstract class ListHashtagState extends Equatable {
  const ListHashtagState();

  @override
  List<Object> get props => [];
}

class ListHashtagInitialState extends ListHashtagState{
  final List<HashtagModel> listHashtag;

  const ListHashtagInitialState({
    required this.listHashtag,
});

  @override
  List<Object> get props => [
    listHashtag,
  ];
}