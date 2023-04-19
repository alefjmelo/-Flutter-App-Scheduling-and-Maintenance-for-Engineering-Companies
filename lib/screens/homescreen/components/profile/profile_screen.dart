// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homescreen/components/home_background.dart';
import 'package:flutter_application_1/screens/homescreen/components/missoes/custom_dialog_a.dart';
import 'package:flutter_application_1/screens/newpassword/insertCPF_screen.dart';
import 'package:flutter_application_1/utils/constants.dart';

import '../../../../../../utils/components/roundedbutton.dart';
import 'custom_dialog_b.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
            radius: size.height * 0.086,
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Text(
            'Jorge Luiz Inácio Silva',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.3,
            width: size.width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CPF',
                      style: TextStyle(fontSize: 18, color: grey3),
                    ),
                    Text(
                      '123.45.789-00',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Telefone',
                      style: TextStyle(fontSize: 18, color: grey3),
                    ),
                    Text(
                      '(00) 00000-0000',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Cargo',
                      style: TextStyle(fontSize: 18, color: grey3),
                    ),
                    Text(
                      'Engenheiro Civil',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Email',
                      style: TextStyle(fontSize: 18, color: grey3),
                    ),
                    Text(
                      'abcd@gmail.com',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.07,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data de Nascimento',
                      style: TextStyle(fontSize: 18, color: grey3),
                    ),
                    Text(
                      '10/07/1990',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Sexo',
                      style: TextStyle(fontSize: 18, color: grey3),
                    ),
                    Text(
                      'Masculino',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          RoundedButton(
            text: 'Atualizar Informações',
            onPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CustomDialogB();
                },
              );
            },
            buttonWidth: 0.6,
            buttonHeight: 0.065,
            fontSize: 18,
            color: yellow,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          RoundedButton(
            text: 'Trocar Senha',
            onPress: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InsertCpfScreen()),
              );
            },
            buttonWidth: 0.6,
            buttonHeight: 0.065,
            fontSize: 18,
            color: yellow,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
          RoundedButton(
            text: 'Log Out',
            onPress: () {},
            buttonWidth: 0.6,
            buttonHeight: 0.065,
            fontSize: 18,
            color: red1,
          ),
        ],
      ),
    );
  }
}
