import 'package:flutter/material.dart';
import 'package:smart_compras/componentes/text_field_loginPage.dart';
//import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool wantEnter = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFFFF4950),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'android/assets/icons/logo1.png',
                    height: 200,
                    width: 240,
                  ),
                  const SizedBox(height: 48),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration('E-mail'),
                    validator: (String? value) {
                      if (value == null) {
                        return "O Email não pode estar vazio";
                      }
                      if (value.length < 5) {
                        return "O Email é muito curto";
                      }
                      if (!value.contains('@')) {
                        return "Nescessário \"@\"";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: getAuthenticationInputDecoration('Senha'),
                    obscureText: true,
                    validator: (String? value) {
                      if (value!.length < 6) {
                        return 'A senha deve ter pelo menos 6 caracteres';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Visibility(
                    visible: !wantEnter,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: getAuthenticationInputDecoration(
                              'Confirmar Senha'),
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      buttonValidateFields();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Color(0xFFFFFFFF),
                      fixedSize: const Size(0, 46),
                    ),
                    child: Text(
                      (wantEnter) ? 'Entrar' : 'Cadastrar-se',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color(0XFFFF4950),
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                  const Divider(),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          wantEnter = !wantEnter;
                        },
                      );
                    },
                    child: Text(
                      ((wantEnter)
                          ? 'Ainda não tem uma conta? Cadastre-se!'
                          : 'Já tem tem uma conta?'),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.white,
                      //  fixedSize: Size(0, 44),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'android/assets/icons/logo_google.png',
                          width: 49,
                          height: 49,
                        ),
                        const SizedBox(
                          width: 10),
                        const Text(
                          'Continuar com Google  ',
                          style: TextStyle(
                            color: Color(0XFFFF4950),
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      backgroundColor: Colors.white,
                      // fixedSize: Size(0, 44),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'android/assets/icons/logo_facebook.png',
                          width: 49,
                          height: 49,
                        ),
                         const SizedBox(
                          width: 8),
                        const Text(
                          'Continuar com Facebook',
                          style: TextStyle(
                            color: Color(0XFFFF4950),
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  buttonValidateFields() {
    if (_formKey.currentState!.validate()) {
      print("Informações Válidas");
    } else {
      print('Informações Inválidas');
    }
  }
}
