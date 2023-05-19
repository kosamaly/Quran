import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Quran(),
    ),
  );
}

class Quran extends StatefulWidget {
  @override
  _Quran createState() => _Quran();
}

class _Quran extends State<Quran> {
  List isSelectedList = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ختمه',
        ),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(30),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 5,

        // Number of columns
        children: List.generate(30, (index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isSelectedList[index] =
                    !isSelectedList[index]; // Convert clicked number to red
              });
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage(
                    'images/4.png',
                  ),
                  fit: BoxFit.cover,
                  repeat: ImageRepeat.repeat,
                ),
                border: Border.all(
                    color: isSelectedList[index]
                        ? Colors.greenAccent
                        : Colors.white,
                    width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(80)),
                color: isSelectedList[index] ? Colors.red : Colors.white,
              ),
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color:
                      isSelectedList[index] ? Colors.greenAccent : Colors.black,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
