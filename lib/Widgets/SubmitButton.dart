import 'package:flutter/material.dart';
import 'package:schedule_me/Helpers/NetworkConnections/_SendLoginRequest.dart';
import 'package:schedule_me/Router.dart';

class SubmitButton extends StatefulWidget {
  final username;
  final password;
  const SubmitButton({
    super.key,
    required TextEditingController this.username,
    required TextEditingController this.password,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  dynamic _result; // To store the result from the Future
  bool _isLoading = false; // Optional: Show loading indicator
  Future<String?> fetch_Data() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate network delay
  /*  _result = {
      "success": true,
      "data": {
        "USER_ID": 12597.123,
        "OBJECT_ID": 8073.123,
        "USER_TYPE_CODE": "STUDENT",
        "USERNAME": 202110076,
        "EMAIL": "aghiadmuhlla@gmail.com",
        "MOBILE": 0981208562,
        "TOKEN":
            "60de3f6120062fe2a87bd1f9c0b1908ad711fd5b5f8f15367b22d40e35ef54fe8c4c4c5764f165db151729c2cbefa8dec739e9105225dfa5b42f1486cc34a112",
        "REMEMBER_TOKEN":
            "16947908d6a25a7198c084bea727fcfe0d82a2c16038b585abf3259befe6d52c1ade6cd05eda6752364f6e261f66d58ed7d76cb879b5470948f71e442328a37f",
        "EMAIL_VERIFIED": "Y",
        "MOBILE_VERIFIED": "Y",
        " VERIFY_EMAIL": "Y",
        "VERIFY_MOBILE": "N",
        "LAST_OS_TYPE": "ANDROID",
        "LOCAL_LANG": null,
        "EXTRA": {
          "PART_ID": 20242,
          "SEMESTER_ID": 20242,
          "SEMESTER_NAME": "الفصل الثاني 2024/2025",
          "SEMESTER_NAME_PL": "Second Semester 2024/2025",
          "SEMESTER_NAME_SL": " الفصل الثاني 2024/2025",
          "PART_TYPE_ID": 2,
          " STUDENT_ID": 8073.123,
          "STUDENT_NUM": 202110076,
          "STUDENT_DEGREE_ID": 8850.123,
          "FACULTY_ID": 225.123,
          "DEGREE_ID": 1.123,
          " STUDY_MODE_CODE": "C",
          "START_LEVEL_NAME_SHORT": 4,
          "END_LEVEL_NAME_SHORT": 4,
          "START_TOTAL_IN_CREDITS": 114,
          "JOB_LOCATION_ID": null,
          "ADMISSION_SEMESTER": 20211,
          "PERMANENT_STATUS_CODE": "ADMITTED",
          "STATUS_SEMESTER_ID": 20242,
          "IS_COMPARISON_STATUS": false,
          "STUDENT_NAME": "أغيد محمد محلا",
          "FIRST_NAME": " أغيد",
          "FIRST_NAME_PL": " Aghyad",
          "FIRST_NAME_SL": " أغيد",
          "STUDENT_NAME_PL": " Aghyad Muhammad Mhalla",
          "STUDENT_NAME_SL": " أغيد محمد محلا",
          "BIRTH_DATE": "03/03/2003",
          "PICTURE": " documents/_sis/add/student_picture/8073.123.jpg",
          " NATIONALITY_NAME_PL": " Syrian",
          " MILITARY_ZONE": " جبلة",
          " GENDER_CODE": " M",
          " NATIONAL_NO": 06110069146,
          " PASSPORT_NO": null,
          "IS_SYRIAN_MALE": true,
          " FORCE_COMPLETE_BASIC_INFO": false,
          " mustCompleteInfoRule": "Y",
          " forceEvaluationRule": " GRADE",
          "surveysCount": 0,
          " FORCE_TRANSPORTATION": "N",
          " TRANSPORT_STATUS": false,
          "USERNAME_CHANGE_ALERT": null,
        },
      },
    };
   
   */
   //real Network
    
    _result = await SendLoginRequest(
      widget.username.text,
      widget.password.text,
    );

    //print(_result);
    setState(() {
      _isLoading = false;
    });

    if (_result["success"] == false) {
      return _result["error"].toString();
    } else if (_result["success"]) {
      Navigator.of(context).push(createRoute(selection: "Home", data: _result));
    } else {
      return "Wrong Passowrd Or username";
    }
  }

  void _runFuture() async {
    final result = await fetch_Data(); // Run the future
    setState(() {
      _result = result; // Update the UI with the result
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: _isLoading ? null : _runFuture,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 174, 18, 255),
          ),
          child: _isLoading
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text("Loading..."),
                  ],
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 10,
                  children: [
                    Icon(Icons.login, color: Colors.white),
                    Text(
                      "تسجيل الدخول",
                      style: Theme.of(
                        context,
                      ).textTheme.titleSmall?.apply(color: Colors.white),
                    ),
                  ],
                ),
        ),
        if (_result != null) Text(_result!),
      ],
    );
  }
}
