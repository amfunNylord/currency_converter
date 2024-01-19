import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(colors: <Color>[
                const Color.fromARGB(255, 252, 187, 187).withOpacity(0.4),
                const Color.fromARGB(255, 255, 235, 182).withOpacity(0.4),
              ], begin: Alignment.centerLeft, end: Alignment.centerRight),
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 12, left: 12),
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(
                  Icons.message,
                  color: Color.fromARGB(255, 255, 13, 13),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: SizedBox(
                        width: 310,
                        child: Text(
                          'Не удалось получить обменные курсы валют. Повторите запрос позже',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                            fontSize: 17,
                            height: 1.3,
                          ),
                        ))),
              ]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 26),
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                  minimumSize:
                      const MaterialStatePropertyAll<Size>(Size(374, 56)),
                  shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 238, 63, 88))))),
              child: const Text(
                'Повторить',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 66, 66),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 24),
              )),
        ),
      ],
    );
  }
}
