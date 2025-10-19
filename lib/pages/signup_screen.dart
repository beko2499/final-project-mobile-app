import 'package:flutter/material.dart';
import '../services/local_storage.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  String error = '';

  void handleSignup() {
    if (_name.text.isEmpty || _email.text.isEmpty || _password.text.isEmpty) {
      setState(() => error = "يرجى ملء جميع الحقول");
    } else {
      LocalStorage.saveData('user', {
        'name': _name.text,
        'email': _email.text,
        'password': _password.text,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('تم التسجيل بنجاح!')));
      Navigator.pushNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تسجيل مستخدم جديد')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: _name, decoration: InputDecoration(labelText: 'اسم المستخدم')),
            TextField(controller: _email, decoration: InputDecoration(labelText: 'البريد الإلكتروني')),
            TextField(controller: _password, decoration: InputDecoration(labelText: 'كلمة المرور'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(onPressed: handleSignup, child: Text('تسجيل')),
            TextButton(onPressed: () => Navigator.pushNamed(context, '/login'), child: Text('لديك حساب؟ تسجيل الدخول')),
            if (error.isNotEmpty) Text(error, style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
