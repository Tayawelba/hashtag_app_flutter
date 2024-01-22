import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:insta_tags/models/hashtag_model.dart';
import 'package:insta_tags/repositories/hashtag_repository.dart';

part 'add_hashtag_event.dart';
part 'add_hashtag_state.dart';

class AddHashtagBloc extends Bloc<AddHashtagEvent, AddHashtagState>{
  final HashtagRepository hashtagRepository;

  AddHashtagBloc(
      this.hashtagRepository
      ) : super(AddHashtagInitial()){
    on<OnAddHashtagEvent>((event, emit) async{

      await hashtagRepository.addNewHashtag({
        "name" : event.hashtag
      });
      emit (AddHashtagSuccessState(
        timestamp: DateTime.now().millisecondsSinceEpoch,
      ));
  } );
  }
}