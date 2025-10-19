import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الصفحة الرئيسية')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('👋 مرحبًا بك في تطبيق التوثيق', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/details'),
              child: Text('عرض التفاصيل'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/api'),
              child: Text('تكامل API خارجي'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/settings'),
              child: Text('الإعدادات'),
            ),
          ],
        ),
      ),
    );
  }
}
