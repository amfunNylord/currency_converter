import 'package:currency_converter/features/converter/converter.dart';
import 'package:flutter/material.dart';

class ConverterCurrencyApp extends StatelessWidget {
  const ConverterCurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          elevation: 0.0,
          title: const Text(
            'Конвертер валют онлайн',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Roboto',
            ),
          ),
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          backgroundColor: const Color.fromARGB(255, 237, 242, 254),
        ),
        bottomNavigationBar: SizedBox(
          height: 94,
          child: BottomNavigationBar(
            iconSize: 40,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.map), label: 'Банкоматы'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.currency_ruble), label: 'Копилка'),
            ],
          ),
        ),
        body: const ConverterScreen(),
      ),
    );
  }
}
