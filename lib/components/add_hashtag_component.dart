import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_tags/services/add_hashtag/add_hashtag_bloc.dart';

class AddHashtagComponent extends StatefulWidget {
  const AddHashtagComponent({super.key});

  @override
  State<AddHashtagComponent> createState() => _AddHashtagComponentState();
}

class _AddHashtagComponentState extends State<AddHashtagComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _modal(BuildContext context) => showBottomSheet(
    context: context,
    builder: (context) => BlocListener<AddHashtagBloc, AddHashtagState>(
      listener: (context, state){
        if (state is AddHashtagSuccessState){
          Navigator.pop(context);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text ('Hashtag added'),
            ),
          );
        }

    },
      child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Hashtag Creator",
                style: Theme.of(context).textTheme.headline6),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Enter your hashtag",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel".toUpperCase()),
                ),
                TextButton(
                  onPressed: () {

                    if(_controller.text.isNotEmpty) {
                      context.read<AddHashtagBloc>().add(
                        OnAddHashtagEvent(
                          hashtag: _controller.text,
                        ),
                      );
                      _controller.clear();
                    } else {
                      Navigator.pop(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar (
                          content: Text("Hashtag cannot be empty"),
                        ),
                      );
                    }
                  },
                  child: Text("Add".toUpperCase()),
                )
              ],
            ),
          ),
        ],
      ),
    ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => _modal(context),
      child: const Icon(Icons.add),
    );
  }
}
