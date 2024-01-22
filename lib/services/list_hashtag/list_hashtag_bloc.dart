import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insta_tags/main.dart';
import 'package:insta_tags/models/hashtag_model.dart';
import 'package:insta_tags/repositories/hashtag_repository.dart';

part 'list_hashtag_event.dart';
part 'list_hashtag_state.dart';

class ListHashtagBloc extends Bloc<ListHashtagEvent, ListHashtagState>{
  final HashtagRepository hashtagRepository;

  ListHashtagBloc(
    this.hashtagRepository,
      ) : super (ListHashtagInitialState(
        listHashtag: List<HashtagModel>.from([]),
        ),
      ) {

        hashtagRepository.hashtags.listen((hashtags) {
          add(_OnHashtagUpdatedListHashTagEvent(hashtags : hashtags));
        });

    on<_OnHashtagUpdatedListHashTagEvent>((event, emit){
      emit(
        ListHashtagInitialState(
          listHashtag : event.hashtags,
       ),
      );
    });
  }
}