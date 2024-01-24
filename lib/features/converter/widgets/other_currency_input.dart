import 'package:currency_converter/features/converter/widgets/choosing_currency.dart';
import 'package:currency_converter/repositories/currency_list/curency_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OtherCurrencyInput extends StatefulWidget {
  const OtherCurrencyInput(
      {super.key,
      required this.currencyList,
      required this.currentCurrency,
      required this.currencyController,
      required this.onTextChanged});

  final List<Currency>? currencyList;
  final IndexOfSelectedCurrency currentCurrency;
  final TextEditingController currencyController;
  final ValueChanged<String>? onTextChanged;

  @override
  State<StatefulWidget> createState() => _OtherCurrencyInputState(
        currencyList: currencyList,
        currentCurrency: currentCurrency,
        currencyController: currencyController,
        onTextChanged: onTextChanged,
      );
}

class _OtherCurrencyInputState extends State<OtherCurrencyInput> {
  _OtherCurrencyInputState({
    required this.currencyList,
    required this.currentCurrency,
    required this.currencyController,
    required this.onTextChanged,
  });

  final List<Currency>? currencyList;
  final IndexOfSelectedCurrency currentCurrency;
  final TextEditingController currencyController;
  final ValueChanged<String>? onTextChanged;

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
                      controller: currencyController,
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
                  child: Consumer<IndexOfSelectedCurrency>(
                    builder: (context, currentCurrency, child) =>
                        ElevatedButton(
                            style: ButtonStyle(
                                elevation: const MaterialStatePropertyAll(0.0),
                                shape: MaterialStatePropertyAll<OutlinedBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12))),
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
                                  builder: (context) => SizedBox(
                                        height: 684,
                                        child: ChoosingCurrencyScreen(
                                          currencyList: currencyList,
                                          currentCurrency:
                                              currentCurrency.index,
                                        ),
                                      )).then((value) => context
                                  .read<IndexOfSelectedCurrency>()
                                  .updateIndex(value ?? currentCurrency.index));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Consumer<IndexOfSelectedCurrency>(
                                  builder: (context, currentCurrency, child) {
                                    return Text(
                                      currencyList![currentCurrency.index].name,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    );
                                  },
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.black,
                                )
                              ],
                            )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            child: Text(
                '1 ${currencyList![currentCurrency.index].name} = ${(1 / currencyList![currentCurrency.index].priceInRUB).toStringAsFixed(4)} RUR',
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
