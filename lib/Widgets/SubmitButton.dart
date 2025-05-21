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
