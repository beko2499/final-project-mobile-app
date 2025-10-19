import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final item = {'title': 'شهادة تخرج', 'date': '2024-06-01'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل العنصر')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الاسم: ${item['title']}', style: TextStyle(fontSize: 18)),
            Text('التاريخ: ${item['date']}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('رجوع'),
            ),
          ],
        ),
      ),
    );
  }
}
