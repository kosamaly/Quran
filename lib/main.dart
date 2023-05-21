import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Quran(),
    ),
  );
}

class Quran extends StatefulWidget {
  const Quran({super.key});

  @override
  _Quran createState() => _Quran();
}

class _Quran extends State<Quran> {
  List isSelectedList = List.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: const Text(
          'الختمه',
          style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
              ),
              width: 400,
              height: 750,
              child: GridView.count(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                mainAxisSpacing: 8,
                crossAxisSpacing: 15,
                crossAxisCount: 4,

                // Number of columns
                children: List.generate(30, (index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedList[index] = !isSelectedList[
                            index]; // Convert clicked number to red
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
                            width: 5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(80)),
                        color:
                            isSelectedList[index] ? Colors.green : Colors.white,
                      ),
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isSelectedList[index]
                              ? Colors.green
                              : Colors.black54,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
