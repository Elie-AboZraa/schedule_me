import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/_MakeEnteries.dart';
import 'package:schedule_me/Widgets/ButtonWithTextandIcon.dart';
import 'package:schedule_me/Widgets/DropDownButtonWithTitle.dart';


var sharedData;
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   Map<String, dynamic>  sharedData={};
  UpdateSharedData(dynamic shareddata)async{
    setState(() {
      //Compining all the data that came from the Drop Down Button Widget to a single Map to use it in this widget
      sharedData = {
    ...sharedData,
    ...shareddata,
  };
    });    
  }
  @override
  Widget build(BuildContext context) {

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
                ID: "University",
                enteries: makeEnteries(
                  ["YPU", "IUST", "AIU"],
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelLarge?.apply(color: const Color.fromARGB(255, 18, 0, 32)),
                ),
                textstyle: Theme.of(context).textTheme.titleMedium,
                shrinkWrap: true,
                widthfactor: 0.5,
                sharedDataFunction: UpdateSharedData,
              ),
              DropDownButtonWithTitle(
                title: "اختر الاختصاص :",
                ID: "facility",
                enteries: makeEnteries(
                  ["هندسة المعلوماتية","هندسة معمارية", "هندسة المدنية","التصميم الداخلي و الديكور"],
                  valus: ["IT","ARC","CIV","ART"],
                  textStyle: Theme.of(
                    context,
                  ).textTheme.labelLarge?.apply(color: const Color.fromARGB(255, 18, 0, 32)),
                ),
                textstyle: Theme.of(context).textTheme.titleMedium,
                shrinkWrap: true,
                widthfactor: 0.5,
                sharedDataFunction:UpdateSharedData
                
              ),
              SizedBox(),
              ButtonWithTextandIcon(text: "  التالي ",icon: Icons.login,route: "Home",PassedData: [sharedData],)
            ],
          ),
        ),
      ),
    );
  }
}
