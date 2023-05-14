import 'package:flutter/material.dart';
import 'package:the_movie_db/Theme/app_button_style.dart';
import 'package:the_movie_db/Theme/app_colors.dart';

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

  String? errorText = null;

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
    const textFieldStyle = InputDecoration(
      border: OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.black26,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: AppColors.mainLightBlue),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      isCollapsed: true,
      //focusColor: Color(0xff01b4f4),
    );

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
          decoration: textFieldStyle,
          controller: _loginTextController,
        ),
        const SizedBox(height: 20),
        const Text(
          'Password',
          style: textSyle,
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: textFieldStyle,
          obscureText: true,
          controller: _passordTextController,
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth,
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xff01b4f4)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                ),
              ),
              child: const Text('Login'),
            ),
            const SizedBox(width: 30),
            TextButton(
              onPressed: _resetPassword,
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(const TextStyle(
                    /*fontWeight: FontWeight.w700,*/ fontSize: 16)),
                foregroundColor:
                    MaterialStateProperty.all(const Color(0xff01b4f4)),
              ),
              child: const Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
