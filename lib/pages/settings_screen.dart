import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = false;

  void showTestNotification() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('🔔 إشعار تجريبي تم بنجاح!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الإعدادات')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('تفعيل الإشعارات'),
              value: notifications,
              onChanged: (val) => setState(() => notifications = val),
            ),
            ElevatedButton(
              onPressed: showTestNotification,
              child: Text('اختبار الإشعار'),
            ),
            ListTile(title: Text('👤 الملف الشخصي')),
            ListTile(title: Text('💡 الوضع الليلي')),
          ],
        ),
      ),
    );
  }
}
v
