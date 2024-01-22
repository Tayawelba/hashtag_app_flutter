import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_tags/models/hashtag_model.dart';
import 'package:insta_tags/services/list_hashtag/list_hashtag_bloc.dart';
import 'package:insta_tags/services/remove_hashtag/remove_hashtag_bloc.dart';


class ListHashtagView extends StatelessWidget {
  const ListHashtagView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ListHashtagBloc, ListHashtagState>(
      listener: (context, state){
        if (state is RemoveHashtagSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Item Removed')
            ),
          );
        }
      },
      builder: (context, state) {
        List<HashtagModel> listHashtag = [];

        if (state is ListHashtagInitialState) {
          listHashtag = state.listHashtag;
        }
        return listHashtag.isEmpty
            ? const Center(
          child: Text('No hashtag'),
        )
            : ListView.builder(
          itemCount: listHashtag.length,
          itemBuilder: (context, index){
            return Dismissible(
              key: Key(
                  "${index.toString()}-${DateTime.now().microsecondsSinceEpoch}"),
              onDismissed: (direction){
                context
                  .read<RemoveHashtagBloc>()
                  .add(OnRemoveHashtagEvent(
                    hashtagModel: listHashtag[index],
                ));
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(
                //       content: Text('$index dismissed')
                //   ),
                // );
              },
              background: Container(
                color: Colors.red,
              ),
              child: Card(
                child: ListTile(
                  title: Text(
                      "#${listHashtag[index].name}"
                  ),
                ),
              ),
            );
          },
        );
      },
    );

  }
}




