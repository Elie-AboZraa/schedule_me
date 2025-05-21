import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class Test_connectionState extends StatelessWidget {
  final String url = 'http://185.194.126.86/RAS/api/user/auth/login?lang=ar';
  final String boundary = '00content0boundary00';

  Future<String> sendLoginRequest(String username, String password) async {
    final headers = {
      'Accept-Charset': 'UTF-8',
      'userTypeCode': 'STUDENT',
      'osType': 'ANDROID',
      'Content-Type': 'multipart/form-data; boundary=$boundary',
      'User-Agent':
          'Dalvik/2.1.0 (Linux; U; Android 9; none Build/QP1A.190711.020)',
    };

    final body = '''
--$boundary
Content-Disposition: form-data; name="userTypeCode"

STUDENT
--$boundary
Content-Disposition: form-data; name="username"

$username
--$boundary
Content-Disposition: form-data; name="password"

$password
--$boundary
Content-Disposition: form-data; name="withExtra"

N
--$boundary--
''';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      if (response.statusCode == 200) {
        // Try to pretty-print JSON response
        try {
          final decoded = json.decode(response.body);
          return JsonEncoder.withIndent('  ').convert(decoded);
        } catch (e) {
          return response.body;
        }
      } else {
        return 'Error: ${response.statusCode}\n${response.body}';
      }
    } on SocketException catch (_) {
      return 'No internet connection.';
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Test Connection")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final username = usernameController.text.trim();
                final password = passwordController.text.trim();

                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please enter both fields.")),
                  );
                  return;
                }

                final result = await sendLoginRequest(username, password);

                // Show dialog with response
                _showResponseDialog(context, result);
              },
              child: const Text("Send Request"),
            ),
          ],
        ),
      ),
    );
  }

  void _showResponseDialog(BuildContext context, String responseBody) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Server Response"),
        content: SingleChildScrollView(
          child: Text(responseBody),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text("OK"),
          )
        ],
      ),
    );
  }
}