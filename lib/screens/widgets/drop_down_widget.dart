import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_login/providers/counter_provider.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> with ChangeNotifier {
  @override
  Widget build(BuildContext context) {
    var textCustomTheme = Theme.of(context).textTheme;
    return DropdownButton<String>(
      value: context.watch<CounterProvider>().dropdownValue,
      style: textCustomTheme.headline4,
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.white,
      ),
      onChanged: (String? newValue) =>
          context.read<CounterProvider>().getValueForDropdown(newValue!),
      items: <String>[
        'America',
        'India',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
