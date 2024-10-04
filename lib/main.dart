import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrencyConverterScreen(),
    );
  }
}

class CurrencyConverterScreen extends StatefulWidget {
  @override
  _CurrencyConverterScreenState createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends State<CurrencyConverterScreen> {
  final double rate = 23000;

  TextEditingController usdController = TextEditingController();

  String result = '';

  void convertCurrency() {
    double usd = double.tryParse(usdController.text) ?? 0;
    double vnd = usd * rate;
    setState(() {
      result = '${usd.toStringAsFixed(2)} USD = ${vnd.toStringAsFixed(2)} VND';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Nhập số tiền USD',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: convertCurrency,
              child: Text('Chuyển đổi'),
            ),
            SizedBox(height: 16),
            Text(
              result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
