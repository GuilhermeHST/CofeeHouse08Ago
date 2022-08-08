import '/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              const Placeholder(fallbackHeight: 150),
              const SizedBox(height: 42),
              TextFormField(
                validator: (value) {
                  if (value == null || value!.isEmpty) {
                    return 'Campo e-mail obrigatório';
                  }
                  return null;
                },
                controller: userController,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Usuário'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo senha obrigatório';
                  } else if (value.length < 8) {
                    return 'Senha deve possuir no mínimo 8 digitos';
                  }

                  return null;
                },
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Senha'),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(primary: const Color(0xFF4a3a2b)),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Entrar com a conta Hurb',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  onPressed() {
    if (_formKey.currentState!.validate()) {
      String userDigitado = userController.text;
      String passwordDigitado = passwordController.text;

      String user = "guilherme@gmail.com";
      String password = "12345678";

      if (user == userDigitado && password == passwordDigitado) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomePage();
            },
          ),
        );
      } else {
        print('Usuário/Senha incorretos');
      }
    } else {
      print("Erro na validação");
    }
  }
}
