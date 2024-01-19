import 'package:currency_converter/choosing_currency.dart';
import 'package:flutter/material.dart';

class OtherCurrencyInput extends StatefulWidget {
  const OtherCurrencyInput({super.key});

  @override
  State<StatefulWidget> createState() => _OtherCurrencyInputState();
}

class _OtherCurrencyInputState extends State<OtherCurrencyInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 246, 222, 254)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Вы получите',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black.withOpacity(0.5))),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                SizedBox(
                    width: 210,
                    child: TextField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                          fontFamily: 'Roboto'),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            top: 11, bottom: 10, left: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          elevation: const MaterialStatePropertyAll(0.0),
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          fixedSize: const MaterialStatePropertyAll<Size>(
                              Size(112, 50)),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.white)),
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12))),
                            builder: (context) => const SizedBox(
                                  height: 684,
                                  child: ChoosingCurrencyScreen(),
                                ));
                      },
                      child: const Row(
                        children: [
                          Icon(
                            Icons.flag,
                            color: Colors.black,
                          ),
                          Text(
                            'USD',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            child: Text('1 USD = 0.0111 RUR',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.black.withOpacity(0.5))),
          ),
        ]),
      ),
    );
  }
}
