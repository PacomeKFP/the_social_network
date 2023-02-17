import 'dart:async';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import '../Components/scaffolder.dart';
import 'Components/CustomTextField.dart';
import 'Components/WelcomeComponent.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final controller = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          height: size.height,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const WelcomeComponent(),
                _isLoading
                    ? const CircularProgressIndicator(
                        backgroundColor: Colors.white12,
                      )
                    : Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CustomTextField(
                              label: "Mot de passe",
                              placedholder: "Votre mot de passe",
                              controller: controller,
                              isObscurable: true,
                              validators: [
                                (String? val) => val == null || val.length < 6
                                    ? '6 charactère minimum'
                                    : null
                              ],
                              icon: Icons.key_outlined,
                            ),
                            const SizedBox(height: 50),
                            InkWell(
                              onTap: () {
                                //Future.delayed va permettre de simuler un charement
                                setState(() {
                                  _isLoading = true;
                                });
                                Timer(const Duration(seconds: 3), () {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Connexion Réussie')));
                                    context.router.pushNamed('/posts');
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                'Mot de passe invalide, veuillez reéssayer')));
                                  }
                                  setState(() => _isLoading = false);
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 24),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade700,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  'Se Connecter',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
