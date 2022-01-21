import 'package:flutter/material.dart';
import './logic.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List list;
  late int steps;

  @override
  void initState() {
    steps = 0;
    list = Logic().generateList();
    super.initState();
  }

  changeColor(index) {
    String result;
    setState(() {
      list[index] = !list[index];
      steps++;
    });
    switch (index) {
      case 0:
        setState(() {
          list[index + 1] = !list[index + 1];
          list[index + 3] = !list[index + 3];
        });
        break;
      case 1:
        setState(() {
          list[index + 1] = !list[index + 1];
          list[index + 3] = !list[index + 3];
          list[index - 1] = !list[index - 1];
        });
        break;
      case 2:
        setState(() {
          list[index - 1] = !list[index - 1];
          list[index + 3] = !list[index + 3];
        });
        break;
      case 3:
        setState(() {
          list[index + 1] = !list[index + 1];
          list[index + 3] = !list[index + 3];
          list[index - 3] = !list[index - 3];
        });
        break;
      case 4:
        setState(() {
          list[index + 1] = !list[index + 1];
          list[index - 1] = !list[index - 1];
          list[index + 3] = !list[index + 3];
          list[index - 3] = !list[index - 3];
        });
        break;
      case 5:
        setState(() {
          list[index - 1] = !list[index - 1];
          list[index + 3] = !list[index + 3];
          list[index - 3] = !list[index - 3];
        });
        break;
      case 6:
        setState(() {
          list[index + 1] = !list[index + 1];
          list[index - 3] = !list[index - 3];
        });
        break;
      case 7:
        setState(() {
          list[index + 1] = !list[index + 1];
          list[index - 1] = !list[index - 1];
          list[index - 3] = !list[index - 3];
        });
        break;
      default:
        setState(() {
          list[index - 1] = !list[index - 1];
          list[index - 3] = !list[index - 3];
        });
    }
    result = Logic().checkGame(list);
    if (result == 'succed') {
      Logic().showEndScreen(context, 'You\'r Record is $steps Step', steps);
      setState(() {
        list = Logic().generateList();
        steps = 0;
      });
    } else if (result == 'failed') {
      Logic().showEndScreen(context, 'You Failed Try Again', steps);
      setState(() {
        list = Logic().generateList();
        steps = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var circleWidth = (size.width - 100) / 3;
    return Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[700],
          onPressed: () {
            setState(() {
              list = Logic().generateList();
              steps = 0;
            });
          },
          child: const Text('Reset'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              //color: Colors.white24,
              padding: const EdgeInsets.all(20.0),
              margin: const EdgeInsets.all(10.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                        child: InkWell(
                      onTap: () {
                        changeColor(index);
                      },
                      child: Container(
                        height: circleWidth,
                        width: circleWidth,
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                            color:
                                list[index] == true ? Colors.green : Colors.red,
                            borderRadius:
                                BorderRadius.circular(circleWidth / 2)),
                      ),
                    ));
                  }),
            ),
            Center(
              child: Text(
                ' Steps : $steps',
                style: const TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ));
  }
}
