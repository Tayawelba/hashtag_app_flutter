import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberTextFieldComponent extends StatefulWidget {
  const NumberTextFieldComponent({super.key});

  @override
  State<NumberTextFieldComponent> createState() => _NumberTextFieldComponentState();
}

class _NumberTextFieldComponentState extends State<NumberTextFieldComponent> {
  int _number = 0;

  late final TextEditingController _numberController;

  @override
  void initState() {
    super.initState();
    _numberController = TextEditingController(
      text: '$_number',
    );

  }
  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _numberController,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: '0',
        prefixIcon: IconButton(
          onPressed: () {
            if (_number == 0) return ;
            setState(() => _number--);

            _numberController.text = '$_number';
          },
          icon: const Icon(Icons.minimize),
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() => _number++);

            _numberController.text = '$_number';
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
