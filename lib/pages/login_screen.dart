import 'package:flutter/material.dart';
import '../services/local_storage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String error = '';

  void handleLogin() async {
    var user = await LocalStorage.getData('user');
    if (user == null) {
      setState(() => error = "لا يوجد مستخدم مسجل!");
    } else if (user['email'] == _email.text && user['password'] == _password.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('تم تسجيل الدخول بنجاح!')));
      Navigator.pushNamed(context, '/home');
    } else {
      setState(() => error = "خطأ في البريد الإلكتروني أو كلمة المرور");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _email, decoration: InputDecoration(labelText: 'البريد الإلكتروني')),
            TextField(controller: _password, decoration: InputDecoration(labelText: 'كلمة المرور'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: handleLogin, child: Text('دخول')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: Text('مستخدم جديد؟ سجل الآن')),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
