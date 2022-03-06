import 'package:flutter/material.dart';
import 'package:provider_test_login/screens/details_page.dart';
import 'package:provider_test_login/screens/widgets/email_text_form_field.dart';
import 'package:provider_test_login/screens/widgets/password_text_form_field.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textCustomTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Login',
          style: textCustomTheme.headline2!.copyWith(fontSize: 24),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const EmailTextFormField(labelText: 'Email'),
              const PasswordTextFromField(labelText: 'Password'),
              ElevatedButton(
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DetailsPage()),
                      );
                    }
                  },
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
