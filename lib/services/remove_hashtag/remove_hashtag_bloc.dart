import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_tags/models/hashtag_model.dart';
import 'package:insta_tags/repositories/hashtag_repository.dart';

part 'remove_hashtag_event.dart';
part 'remove_hashtag_state.dart';

class RemoveHashtagBloc extends Bloc<RemoveHashtagEvent, RemoveHashtagState>{
  final HashtagRepository hashtagRepository;

  RemoveHashtagBloc(
      this.hashtagRepository
      ) : super(RemoveHashtagInitial()) {
    on<OnRemoveHashtagEvent>((event, emit) async{

      await hashtagRepository.removeHashtag(event.hashtagModel);

      emit (RemoveHashtagSuccessState(
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ));
  } );
  }
}