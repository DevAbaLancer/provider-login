import 'package:flutter/material.dart';

import 'package:email_validator/email_validator.dart';

class EmailTextFormField extends StatefulWidget {
  final String labelText;
  const EmailTextFormField({
    Key? key,
    required this.labelText,
  }) : super(key: key);

  @override
  State<EmailTextFormField> createState() => _EmailTextFormFieldState();
}

class _EmailTextFormFieldState extends State<EmailTextFormField> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void _printLatestValue() {
    print('Second text field: ${myController.text}');
  }

  @override
  Widget build(BuildContext context) {
    final customThemeText = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
      color: Colors.black,
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: TextFormField(
            validator: (value) {
              return !EmailValidator.validate(value!, true)
                  ? 'Not a valid email.'
                  : null;
            },
            controller: myController,
            style: customThemeText.headline2!.copyWith(fontSize: 16),
            cursorColor: Colors.orange,
            cursorWidth: 1.0,
            decoration: InputDecoration(
              fillColor: Colors.grey.shade800,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 10,
              ),
              labelText: widget.labelText,
              labelStyle: customThemeText.headline2,
              floatingLabelStyle:
                  customThemeText.headline2!.copyWith(fontSize: 16),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              filled: true,
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 1.0,
                ),
              ),
              alignLabelWithHint: false,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 1.0,
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
