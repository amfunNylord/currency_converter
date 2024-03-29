import 'package:flutter/material.dart';
import '../../../repositories/currency_list/curency_list.dart';

class RubblesInput extends StatefulWidget {
  const RubblesInput(
      {super.key,
      required this.currencyList,
      required this.currentCurrency,
      required this.rubblesController,
      required this.onTextChanged});

  final List<Currency>? currencyList;
  final IndexOfSelectedCurrency currentCurrency;
  final TextEditingController rubblesController;
  final ValueChanged<String>? onTextChanged;

  @override
  State<StatefulWidget> createState() => _RubblesInputState(
      currencyList: currencyList,
      currentCurrency: currentCurrency,
      rubblesController: rubblesController,
      onTextChanged: onTextChanged);
}

class _RubblesInputState extends State<RubblesInput> {
  _RubblesInputState(
      {required this.currencyList,
      required this.currentCurrency,
      required this.rubblesController,
      required this.onTextChanged});

  final List<Currency>? currencyList;
  final IndexOfSelectedCurrency currentCurrency;

  final TextEditingController rubblesController;
  final ValueChanged<String>? onTextChanged;

  @override
  void dispose() {
    rubblesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 216, 236, 255)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text('Хочу обменять',
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
                      controller: rubblesController,
                      onChanged: (text) {
                        if (onTextChanged != null) {
                          onTextChanged!(text);
                        }
                      },
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
                          shape: MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          fixedSize: const MaterialStatePropertyAll<Size>(
                              Size(112, 50)),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.white)),
                      onPressed: null,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'RUR',
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
            child: Text(
                '1 RUR = ${currencyList?[currentCurrency.index].priceInRUB.toStringAsFixed(4)} ${currencyList?[currentCurrency.index].name}',
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
