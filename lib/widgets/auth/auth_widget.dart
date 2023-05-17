import 'package:flutter/material.dart';
import 'package:the_movie_db/Theme/styles.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login to your account'),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          _FormWidget(),
          const SizedBox(height: 15),
          const Text(
            'In order to use the editing and rating capabilities of TMDb, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.',
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Regiter'),
          ),
          const SizedBox(height: 25),
          const Text(
            'If you signed up but didn\'t get your verification email.',
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Verify email'),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: 'admin');
  final _passordTextController = TextEditingController(text: 'admin');

  String? errorText;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passordTextController.text;
    if (login == 'admin' && password == 'admin') {
      errorText = null;

      Navigator.of(context).pushReplacementNamed('main_screen');
    } else {
      errorText = 'Wrong login or password';

      setState(() {});
    }
  }

  void _resetPassword() {
    print('reset');
  }

  @override
  Widget build(BuildContext context) {
    const textSyle = TextStyle(color: Color(0xff212529), fontSize: 16);

    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 16),
          ),
          const SizedBox(height: 20)
        ],
        const Text(
          'Username',
          style: textSyle,
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: AppTextFieldStyle.textFieldStyle,
          controller: _loginTextController,
          textInputAction: TextInputAction.next,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textSyle,
        ),
        const SizedBox(height: 5),
        TextField(
          textInputAction: TextInputAction.done,
          decoration: AppTextFieldStyle.textFieldStyle,
          obscureText: true,
          autocorrect: false,
          enableSuggestions: false,
          controller: _passordTextController,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: AppButtonStyle.loginButtonStyle,
              child: const Text('Login'),
            ),
            const SizedBox(width: 30),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
