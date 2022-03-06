import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test_login/screens/widgets/custom_text_field.dart';

import 'package:provider_test_login/screens/widgets/drop_down_widget.dart';

import '../providers/counter_provider.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String _nameValue = 'null';
  String get nameValue => _nameValue;
  String _educationLine0 = 'null';
  String get educationLine0 => _educationLine0;
  final List<String> _educationLineList = ['null', 'null', 'null'];
  List<String> get educationLineList => _educationLineList;
  final nameController = TextEditingController();
  final educationLine0Controller = TextEditingController();
  final List<TextEditingController> educationLineControllerList = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController()
  ];

  final _formKeyDetails = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    educationLine0Controller.dispose();
    nameController.dispose();
    educationLineControllerList[0].dispose();
    educationLineControllerList[1].dispose();
    educationLineControllerList[2].dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textCustomTheme = Theme.of(context).textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'User details screen',
            style: textCustomTheme.headline2!.copyWith(fontSize: 24),
          )),
      body: SingleChildScrollView(
        child: Form(
          key: _formKeyDetails,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                  labelText: 'Name',
                  errorText: 'Please add your name',
                  myController: nameController,
                  onSaved: (value) {
                    _nameValue = value;
                  }),
              const DropDownWidget(),
              context.watch<CounterProvider>().dropdownValue == 'India'
                  ? Text(
                      'नमस्ते',
                      style: textCustomTheme.headline5,
                    )
                  : Text(
                      'Welcome',
                      style: textCustomTheme.headline5,
                    ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * .85,
                    child: CustomTextField(
                        labelText: 'Education',
                        errorText: 'Please add your educational qualification',
                        myController: educationLine0Controller,
                        onSaved: (value) {
                          _educationLine0 = value;
                        }),
                  ),
                  IconButton(
                    onPressed: () =>
                        context.read<CounterProvider>().incrementCounter(),
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 80.0 * context.watch<CounterProvider>().count,
                child: ListView.builder(
                    itemCount: context.watch<CounterProvider>().count,
                    itemBuilder: (BuildContext context, index) {
                      return Row(
                        children: [
                          SizedBox(
                            width: screenWidth * .85,
                            child: CustomTextField(
                                labelText:
                                    'Education additional line ${index + 1}',
                                errorText:
                                    'Please add your educational qualification',
                                myController:
                                    educationLineControllerList[index],
                                onSaved: (value) {
                                  _educationLineList[index] = value;
                                }),
                          ),
                          IconButton(
                            onPressed: () => context
                                .read<CounterProvider>()
                                .deacrementCounter(),
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Container(
                            height: screenHeight * .13,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name entered: $nameValue'),
                                Text('Education line 0: $educationLine0'),
                                Text(
                                    'Education line 1: ${educationLineList[0]}'),
                                Text(
                                    'Education line 2: ${educationLineList[1]}'),
                                Text(
                                    'Education line 3: ${educationLineList[2]}'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    setState(() {
                      educationLine0Controller.clear();
                      nameController.clear();
                      educationLineControllerList[0].clear();
                      educationLineControllerList[1].clear();
                      educationLineControllerList[2].clear();
                    });
                  },
                  child: Text(
                    'Save',
                    style: textCustomTheme.headline2,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
