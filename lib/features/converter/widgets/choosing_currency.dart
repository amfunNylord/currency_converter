import 'package:flutter/material.dart';

class ChoosingCurrencyScreen extends StatefulWidget {
  const ChoosingCurrencyScreen({super.key});

  @override
  State<StatefulWidget> createState() => _ChoosingCurrencyScreenState();
}

class _ChoosingCurrencyScreenState extends State<ChoosingCurrencyScreen> {
  final List<String> _currencyList = [
    'RUR / Российский рубль',
    'USD / Доллар США',
    'EUR / Евро',
    'AZN / Азербайджанский манат',
    'AMD / Армянский драм',
    'BYN / Белорусский рубль',
    'KZT / Казахстанский тенге',
    'KGS / Киргизский сом'
  ];

  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Выберите валюту',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Color.fromARGB(255, 35, 35, 35)),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close,
                          color: const Color.fromARGB(255, 35, 35, 35)
                              .withOpacity(0.4),
                          size: 36,
                        ))),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.only(top: 14),
                  itemBuilder: (BuildContext context, int index) => Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.92,
                            child: Card(
                                elevation: 0.0,
                                child: ListTile(
                                  onTap: () =>
                                      setState(() => _selectedIndex = index),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: _selectedIndex == index
                                          ? const BorderSide(
                                              color: Color.fromARGB(
                                                  255, 238, 63, 88))
                                          : BorderSide.none),
                                  title: Text(_currencyList[index]),
                                  titleTextStyle: const TextStyle(
                                      color: Color.fromARGB(255, 35, 35, 35),
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18),
                                  selected: index == _selectedIndex,
                                  selectedTileColor: Colors.white,
                                  selectedColor:
                                      const Color.fromARGB(255, 35, 35, 35),
                                  tileColor:
                                      const Color.fromARGB(255, 239, 245, 249),
                                  trailing: Container(
                                    width: 26,
                                    height: 26,
                                    decoration: _selectedIndex == index
                                        ? BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 238, 63, 88),
                                            borderRadius:
                                                BorderRadius.circular(12))
                                        : BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.2)),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                    child: _selectedIndex == index
                                        ? const Icon(
                                            Icons.circle,
                                            color: Colors.white,
                                            size: 12,
                                          )
                                        : null,
                                  ),
                                ))),
                      ),
                  itemCount: _currencyList.length)),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize:
                      const MaterialStatePropertyAll<Size>(Size(350, 50)),
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100))),
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                      Color.fromARGB(255, 36, 84, 232))),
              onPressed: () => Navigator.pop(context),
              child: const Text('Применить',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 18)),
            ),
          ),
        ],
      ),
    );
  }
}
