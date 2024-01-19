import 'package:currency_converter/other_currency_input.dart';
import 'package:currency_converter/rubbles_input.dart';
import 'package:flutter/material.dart';

class Converter extends StatelessWidget {
  const Converter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
              width: 382,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    blurRadius: 10,
                  )
                ]),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: null,
                          style: ButtonStyle(
                              minimumSize: const MaterialStatePropertyAll<Size>(
                                  Size(187, 42)),
                              backgroundColor:
                                  const MaterialStatePropertyAll<Color>(
                                      Color.fromRGBO(238, 63, 88, 1)),
                              shape: MaterialStatePropertyAll<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(100)))),
                          child: const Text('Конвертер',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.2,
                                  color: Colors.white)),
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                minimumSize:
                                    const MaterialStatePropertyAll<Size>(
                                        Size(187, 42)),
                                backgroundColor:
                                    const MaterialStatePropertyAll<Color>(
                                        Colors.white),
                                shape: MaterialStatePropertyAll<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100)))),
                            onPressed: null,
                            child: Text(
                              'Курсы валют',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  height: 1.2,
                                  color: Colors.black.withOpacity(0.4)),
                            ))
                      ]),
                ),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Конвертер валют',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto'),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                const Color.fromARGB(255, 252, 234, 187)
                                    .withOpacity(0.4),
                                const Color.fromARGB(255, 255, 235, 182)
                                    .withOpacity(0.4),
                              ])),
                      child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12.0, top: 12.0),
                              child: Icon(Icons.message,
                                  color: Color.fromARGB(255, 255, 115, 13)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 12.0, top: 12.0, bottom: 11.0),
                              child: SizedBox(
                                width: 300,
                                child: Text(
                                  'Все переводы курсов конвертер осуществляет на основе стоимости валют по данным ЦБ РФ.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.0,
                                      color: Colors.black),
                                ),
                              ),
                            )
                          ]),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: RubblesInput(),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 14),
                    child: OtherCurrencyInput(),
                  ),
                ],
              ),
              // сюда вставлять const ErrorMessage(),
            ],
          ),
        ),
        // и эту штуку убрать
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            'Данные за 2023-07-18 15:42:18 GMT+03:00',
            style: TextStyle(
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.black.withOpacity(0.4)),
          ),
        ),
      ],
    );
  }
}
