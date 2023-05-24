import 'package:flash/data/local/dummy_data.dart';
import 'package:flash/ui/widgets/jozz_widget.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static String id = "user_screen";
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => UserScreenState();
}

class UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: const Text(
          'الختمة',
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
                boxShadow: const [
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
                children: quran
                    .map(
                      (element) => JozzWidget(jozz: element),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
