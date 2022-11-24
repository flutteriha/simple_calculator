import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import '../constants/constants.dart';
import '../widgets/box_neu.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // const HomeScreen({Key? key}) : super(key: key);
  bool darkMode = true;

  String equation = '0';
  String result = '0';
  String experssion = '';
  double equationFontSize = 40.0;
  double resultFontSize = 50.0;

  btnPressed(String btnText) {
    setState(() {
      if (btnText == 'C') {
        equationFontSize = 40.0;
        resultFontSize = 50.0;
        equation = '0';
        result = '0';
      } else if (btnText == '⌫') {
        equationFontSize = 50.0;
        resultFontSize = 40.0;
        equation = equation.substring(0, equation.length - 1);
        if (equation.isEmpty) {
          equation = '0';
        }
      } else if (btnText == '=') {
        equationFontSize = 40.0;
        resultFontSize = 50.0;

        experssion = equation;
        experssion = experssion.replaceAll('÷', '/');
        experssion = experssion.replaceAll('×', '*');

        try {
          Parser p = Parser();
          Expression exp = p.parse(experssion);
          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'what the faaaaaaaaz ?!';
        }
      } else {
        equationFontSize = 50.0;
        resultFontSize = 40.0;
        if (equation == '0') {
          equation = btnText;
        } else {
          equation = equation + btnText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            darkMode ? darkMode = false : darkMode = true;
                          });
                        },
                        child: SizedBox(
                          width: 100.0,
                          child: BoxNeu(
                            darkMode: darkMode,
                            borderRadius: BorderRadius.circular(40.0),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 15.0),
                            child: SizedBox(
                              width: 70.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.wb_sunny,
                                    color: darkMode
                                        ? Colors.grey
                                        : Colors.redAccent,
                                  ),
                                  Icon(
                                    Icons.nightlight_round,
                                    color:
                                        darkMode ? Colors.green : Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: resultFontSize,
                            fontWeight: FontWeight.bold,
                            color: darkMode ? Colors.white : Colors.red,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '=',
                            style: TextStyle(
                              fontSize: 35.0,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          ),
                          Text(
                            equation,
                            style: TextStyle(
                              fontSize: equationFontSize,
                              color: darkMode ? Colors.green : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(
                            darkMode: darkMode,
                            title: 'C',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        ButtonNeu(darkMode: darkMode, title: '('),
                        ButtonNeu(darkMode: darkMode, title: ')'),
                        ButtonNeu(
                            darkMode: darkMode,
                            title: '÷',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(darkMode: darkMode, title: '7'),
                        ButtonNeu(darkMode: darkMode, title: '8'),
                        ButtonNeu(darkMode: darkMode, title: '9'),
                        ButtonNeu(
                            darkMode: darkMode,
                            title: '×',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(darkMode: darkMode, title: '4'),
                        ButtonNeu(darkMode: darkMode, title: '5'),
                        ButtonNeu(darkMode: darkMode, title: '6'),
                        ButtonNeu(
                            darkMode: darkMode,
                            title: '-',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(darkMode: darkMode, title: '1'),
                        ButtonNeu(darkMode: darkMode, title: '2'),
                        ButtonNeu(darkMode: darkMode, title: '3'),
                        ButtonNeu(
                            darkMode: darkMode,
                            title: '+',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ButtonNeu(darkMode: darkMode, title: '0'),
                        ButtonNeu(darkMode: darkMode, title: '.'),
                        ButtonNeu(
                            darkMode: darkMode,
                            title: '⌫',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                        ButtonNeu(
                            darkMode: darkMode,
                            title: '=',
                            textColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ButtonNeu(
      {String? title, double padding = 17, Color? textColor, bool? darkMode}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BoxNeu(
        darkMode: darkMode!,
        borderRadius: BorderRadius.circular(40.0),
        padding: EdgeInsets.all(padding),
        child: InkWell(
          onTap: () => btnPressed(title!),
          child: SizedBox(
            width: padding * 2,
            height: padding * 2,
            child: Center(
              child: Text(
                title!,
                style: TextStyle(
                  color: textColor ?? (darkMode ? Colors.white : Colors.black),
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
