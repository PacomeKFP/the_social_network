import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WelcomeComponent extends StatelessWidget {
  const WelcomeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Padding(
      padding:
          EdgeInsets.only(bottom: size.height * 0.10, top: size.height * 0.15),
      child: ListTile(
        title: Text(
          'Bienvenue !',
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.black),
        ),
        subtitle: Text(
            'Veuillez entrer votre mot de passe pour vous connecter.',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black)),
      ),
    );
  }
}
