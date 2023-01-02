import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _userInput = '';
  String _answer = '';

  /// function
  void _getValue(String value) {
    switch (value) {
      case 'AC':
        setState(() {
          _userInput = '';
          _answer = '';
        });
        break;
      case "+/-":
        setState(() {
          // _userInput = "89+43-93x308"
          List<String> nums = _userInput.split(RegExp(r'[\+\-\x\%\÷]'));
          // nums = ["89", "43", "93", "308"]

          String lastNumber = nums[nums.length - 1];
          // lastNumber = 308) || 308   //

          // 308)
          // [3]
          // negative number
          if (lastNumber.endsWith(')')) {
            // lastNumber = "308)" => remove ")" => lastNumber = "308"
            // _userInput = 89+43-93x(-308)

            // 5+(-4) length: 6
            // 5+4 length: 3
            lastNumber =
                lastNumber.substring(0, lastNumber.length - 1); // "308"
            _userInput = _userInput.replaceRange(
                _userInput.length - lastNumber.length - 3, // 9
                _userInput.length, // 12
                lastNumber);
          } else {
            _userInput = _userInput.replaceRange(
                _userInput.length - lastNumber.length, // 9
                _userInput.length, // 12
                '(-$lastNumber)');
          }

          // _userInput = "89+43-93x308"
          // _userInput.length = 12
          // lastNumber.length = 3
          // _userInput.replaceRange(start, end, replace)
          // _userInput = "89+43-93x(-308)"

          // 85+9 -> 85+(-9)
        });
        break;

      case "=":
        setState(() {
          String input = _userInput
              .replaceAll("x", "*")
              .replaceAll('÷', '/')
              .replaceAll('%', '/100');
          _answer = input.interpret().toString();

          // 9 - (-4)
        });
        break;

      default:
        setState(() {
          _userInput += value;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // ignore: prefer_const_constructors
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.black,
          title: const Text('Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 65,
                child: FittedBox(
                  child: Text(
                    _userInput.isEmpty ? '0' : _userInput,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                _answer.isEmpty ? '' : _answer,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: 'AC',
                        backgroundColor: Colors.grey,
                        textColor: Colors.black,
                        onPressed: () => _getValue('AC'),
                      ),
                      Button(
                        text: "+/-",
                        backgroundColor: Colors.grey,
                        textColor: Colors.black,
                        onPressed: () => _getValue('+/-'),
                      ),
                      Button(
                        text: '%',
                        backgroundColor: Colors.grey,
                        textColor: Colors.black,
                        onPressed: () => _getValue('%'),
                      ),
                      Button(
                        text: '÷',
                        backgroundColor: Colors.orange,
                        onPressed: () => _getValue('÷'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: '7',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('7'),
                      ),
                      Button(
                        text: '8',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('8'),
                      ),
                      Button(
                        text: '9',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('9'),
                      ),
                      Button(
                        text: 'x',
                        backgroundColor: Colors.orange,
                        onPressed: () => _getValue('x'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: '6',
                        backgroundColor: Color.fromARGB(119, 81, 91, 81),
                        onPressed: () => _getValue('6'),
                      ),
                      Button(
                        text: '5',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('5'),
                      ),
                      Button(
                        text: '4',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('4'),
                      ),
                      Button(
                        text: '-',
                        backgroundColor: Colors.orange,
                        onPressed: () => _getValue('-'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button(
                        text: '3',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('3'),
                      ),
                      Button(
                        text: '2',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('2'),
                      ),
                      Button(
                        text: '1',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('1'),
                      ),
                      Button(
                        text: '+',
                        backgroundColor: Colors.orange,
                        onPressed: () => _getValue('+'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.centerLeft,
                          minimumSize: Size(200, 70),
                          backgroundColor: Color.fromARGB(119, 81, 90, 81),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                        ),
                        onPressed: () => _getValue('0'),
                        child: const Text(
                          '0',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                      ),
                      Button(
                        text: '.',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('.'),
                      ),
                      Button(
                        text: '=',
                        backgroundColor: Color.fromARGB(119, 81, 90, 81),
                        onPressed: () => _getValue('='),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
