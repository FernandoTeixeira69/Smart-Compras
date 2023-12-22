import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:smart_compras/componentes/text_field_loginPage.dart';
import 'package:smart_compras/main.dart';

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
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF4950),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MyHomePage();
                },
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 48,
          ),
        ),
      ),
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
                  SvgPicture.asset(
                    'android/assets/icons/logo_smart_compras.svg',
                    height: 200,
                    width: 200,
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white,
                      fixedSize: const Size(0, 56),
                    ),
                    child: Text(
                      (wantEnter) ? 'Entrar' : 'Cadastrar-se',
                      style: const TextStyle(
                          fontSize: 20,
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
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'android/assets/icons/icon_google.svg',
                          fit: BoxFit.scaleDown,
                          width: 56,
                          height: 56,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Continuar com Google    ',
                          style: TextStyle(
                            color: Color(0XFFFF4950),
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'android/assets/icons/icon_facebook.svg',
                          //  width: 56,
                          height: 56,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Continuar com Facebook',
                          style: TextStyle(
                            color: Color(0XFFFF4950),
                            fontSize: 20,
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
