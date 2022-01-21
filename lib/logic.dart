import 'dart:math';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Logic {
  List<bool> firstLevel = [];

  generateList() {
    for (var i = 1; i <= 9; i++) {
      Random random = Random();
      int randomNumber = random.nextInt(10);

      randomNumber > 5 ? firstLevel.add(true) : firstLevel.add(false);
    }
    return firstLevel;
  }

  checkGame(list) {
    var count = 0;
    var result = '';
    list.map((item) {
      item == true ? count++ : count = count;
    }).toList();
    count == 9
        ? result = 'succed'
        : count == 0
            ? result = 'failed'
            : result = '';

    return result;
  }

  showEndScreen(context, message, steps) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: SizedBox(
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(message),
                  ElevatedButton(
                      onPressed: () {
                        Share.share('My Switch Game Recorde is $steps Steps');
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: Text('Share You\'r Record'),
                      ))
                ],
              ),
            ),
          );
        });
  }
}
