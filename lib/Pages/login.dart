import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_MakeEnteries.dart';
import 'package:schedule_me/Router.dart';
import 'package:schedule_me/Widgets/DropDownButtonWithTitle.dart';
//import 'package:schedule_me/Widgets/DropDownButtonWithTitle.dart';
import 'package:schedule_me/Widgets/SubmitButton.dart';

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

              //TextFieldContainer(controller: usernameController),
              //TextFieldContainer(type: "password",controller: passwordController),
              DropDownButtonWithTitle(
                title: "اختر الجامعة :",
                enteries: makeEnteries(
                  ["YPU", "IUST", "AIU"],
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelLarge?.apply(color: const Color.fromARGB(255, 18, 0, 32)),
                ),
                textstyle: Theme.of(context).textTheme.titleMedium,
                shrinkWrap: true,
                widthfactor: 0.5,
              ),
              DropDownButtonWithTitle(
                title: "اختر الاختصاص :",
                enteries: makeEnteries(
                  ["هندسة معمارية", "هندسة المعلوماتية", "هندسة المدنية","التصميم الداخلي و الديكور"],
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelLarge?.apply(color: const Color.fromARGB(255, 18, 0, 32)),
                ),
                textstyle: Theme.of(context).textTheme.titleMedium,
                shrinkWrap: true,
                widthfactor: 0.5,
              ),
              Column(
                spacing: 10,
                children: [
                  //the commented stuff are for the network version
                  /*TextButton(
                    onPressed: () => Navigator.of(
                      context,
                    ).push(createRoute(selection: "Home", data: null)),
                    child: Text(
                      "دخول من دون مستخدم",
                      style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: Color.fromARGB(255, 174, 18, 255),
                      ),
                    ),
                  ),
                  SubmitButton(
                    username: usernameController,
                    password: passwordController,
                  ),*/
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
