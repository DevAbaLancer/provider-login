import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final String errorText;
  final TextEditingController myController;
  final void Function(String)? onSaved;
  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.errorText,
      required this.myController,
      this.onSaved})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
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
              if (value!.isNotEmpty) {
                return null;
              } else {
                return widget.errorText;
              }
            },
            controller: widget.myController,
            onChanged: widget.onSaved,
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
