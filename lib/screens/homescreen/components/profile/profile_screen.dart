// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/logIn/login_screen.dart';
import 'package:flutter_application_1/screens/newpassword/insertCPF_screen.dart';
import 'package:flutter_application_1/utils/constants.dart';
import 'package:flutter_application_1/utils/http_service.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../../utils/components/roundedbutton.dart';
import '../../../../models/user_model.dart';
import 'custom_dialog_b.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String formatCPF(String cpf) {
      final formattedCPF = cpf.replaceAllMapped(
        RegExp(r"(\d{3})(\d{3})(\d{3})(\d{2})"),
        (match) => "${match[1]}.${match[2]}.${match[3]}-${match[4]}",
      );
      return formattedCPF;
    }

    String formatPhoneNumber(String phoneNumber) {
      final formattedPhoneNumber = phoneNumber.replaceAllMapped(
        RegExp(r"(\d{2})(\d{5})(\d{4})"),
        (match) => "(${match[1]}) ${match[2]}-${match[3]}",
      );
      return formattedPhoneNumber;
    }

    String formattedCpf = formatCPF(widget.user.cpf);
    String formattedPhoneNumber = formatPhoneNumber(widget.user.phoneNumber);

    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: HttpService.getProfileImg(widget.user.id),
              builder: (BuildContext context, AsyncSnapshot<Image> snapshot) {
                if (snapshot.hasData) {
                  return CircleAvatar(
                    radius: 70,
                    backgroundImage: snapshot.data?.image,
                  );
                } else if (snapshot.hasError) {
                  return Text('Error loading profile image');
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              widget.user.name,
              style: GoogleFonts.workSans(color: black, fontSize: 22),
            ),
            SizedBox(
              height: size.height * 0.035,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CPF',
                      style: GoogleFonts.workSans(fontSize: 16.5, color: grey3),
                    ),
                    Text(
                      formattedCpf,
                      style: GoogleFonts.workSans(fontSize: 16.5, color: black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Telefone',
                      style: GoogleFonts.workSans(fontSize: 16.5, color: grey3),
                    ),
                    Text(
                      formattedPhoneNumber,
                      style: GoogleFonts.workSans(fontSize: 16.5, color: black),
                    ),
                  ],
                ),
                SizedBox(
                  width: size.width * 0.045,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data de Nascimento',
                      style: GoogleFonts.workSans(fontSize: 16.5, color: grey3),
                    ),
                    Text(
                      widget.user.birthDate,
                      style: GoogleFonts.workSans(fontSize: 16.5, color: black),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'Sexo',
                      style: GoogleFonts.workSans(fontSize: 16.5, color: grey3),
                    ),
                    Text(
                      widget.user.gender,
                      style: GoogleFonts.workSans(fontSize: 16.5, color: black),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Email',
              style: GoogleFonts.workSans(fontSize: 16.5, color: grey3),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              widget.user.email,
              style: GoogleFonts.workSans(fontSize: 16.5, color: black),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              'Cargo',
              style: GoogleFonts.workSans(fontSize: 16.5, color: grey3),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              widget.user.businessRole,
              style: GoogleFonts.workSans(
                  fontSize: 16.5, fontWeight: FontWeight.bold, color: black),
            ),
            SizedBox(
              height: size.height * 0.075,
            ),
            RoundedButton(
              text: 'Atualizar Informações',
              onPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return CustomDialogB(user: widget.user);
                  },
                );
              },
              buttonWidth: 0.6,
              buttonHeight: 0.065,
              fontSize: 16.5,
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
              fontSize: 16.5,
              color: yellow,
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            RoundedButton(
              text: 'Log Out',
              onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              buttonWidth: 0.6,
              buttonHeight: 0.065,
              fontSize: 16.5,
              color: red1,
            ),
          ],
        ),
      ),
    );
  }
}
