import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_tags/components/number_text_field_component.dart';

class HomeView extends StatelessWidget {
  const HomeView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          const Padding(
            padding: EdgeInsets.symmetric(
                vertical: 8.0,
            ),
            child: NumberTextFieldComponent(),
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Text('Generate'),
                    ),
                    Icon(
                      Icons.copy,
                      size: 19,
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
