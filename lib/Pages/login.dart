import 'package:flutter/material.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/SubmitButton.dart';
import 'package:schedule_me/Widgets/TextFieldContainer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          //padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
          width: MediaQuery.of(context).size.width * 0.90,
          alignment: Alignment.center,
          child: Column(
            spacing: 13,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 80, 0, 100),
                child: Text(
                  "جدولني",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),

              TextFieldContainer(controller: usernameController),
              TextFieldContainer(type: "password",controller: passwordController),
              Column(
                spacing: 10,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).push(createRoute(selection: "Home",data: {"success":false})),
                    child: Text(
                      "دخول من دون مستخدم",
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: Color.fromARGB(255, 174, 18, 255),
                      ),
                    ),
                  ),
                  SubmitButton(username: usernameController,password: passwordController,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
