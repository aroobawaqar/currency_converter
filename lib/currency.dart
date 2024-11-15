import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _usdController = TextEditingController();
  final TextEditingController _resultController = TextEditingController();
  final double exchangeRate = 283.50; // Example rate of 1 USD = 283.50 PKR

  void _convertCurrency() {
    setState(() {
      double usdAmount = double.tryParse(_usdController.text) ?? 0;
      double convertedAmount = usdAmount * exchangeRate;
      _resultController.text = convertedAmount.toStringAsFixed(2); // Show result in the result TextFormField
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Currency Converter (USD to PKR)'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.purpleAccent,
              Colors.orangeAccent,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'USD',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10), // Reduced height
              TextFormField(
                controller: _usdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount in USD',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15), // Reduced height
              ElevatedButton(
                onPressed: _convertCurrency,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Adjusted button size
                  textStyle: TextStyle(fontSize: 16), // Slightly smaller text size
                ),
                child: Text('Convert'),
              ),
              SizedBox(height: 15), // Added small gap
              Text(
                'Result (PKR)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 10), // Reduced height
              TextFormField(
                controller: _resultController,
                readOnly: true, // Prevent editing the result field
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Converted amount will appear here',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15), // Reduced height between result and clear button
              ElevatedButton(
                onPressed: () {
                  _usdController.clear();
                  _resultController.clear();
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20), // Adjusted button size
                  textStyle: TextStyle(fontSize: 22), // Button text size
                  backgroundColor: Colors.pinkAccent, // Button color
                ),
                child: Text('Clear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
