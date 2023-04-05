import 'package:flutter/material.dart';
import 'package:formcreditcard/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/InputForm.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SafeArea(
        child: HomeForm(),
      ),
    );
  }
}

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gray900,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                InputForm(
                  textLabel: 'Número do cartão',
                  hintText: '**** **** **** ****',
                  inputType: TextInputType.number,
                ),
                InputForm(
                  textLabel: 'Nome do titular',
                  hintText: 'Nome como está no cartão',
                  inputType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: InputForm(
                        inputType: TextInputType.datetime,
                        textLabel: 'Validade',
                        hintText: 'mm/aa',
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            color: gray300,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InputForm(
                        inputType: TextInputType.number,
                        textLabel: 'CVV',
                        hintText: '***',
                        iconButton: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.help,
                            color: gray300,
                            size: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified_user,
                color: statusSuccess,
                size: 18,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Seus dados estão seguros',
                style: inputText,
              )
            ],
          ),
          Buttom(
            title: 'Adicionar cartão',
          )
        ],
      ),
    );
  }
}

class Buttom extends StatelessWidget {
  String title;
  Buttom({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(brandColor),
          minimumSize: const MaterialStatePropertyAll(
            Size(double.maxFinite, 56),
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: buttomLabel,
        ),
      ),
    );
  }
}
