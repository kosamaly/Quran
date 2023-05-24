import 'package:flash/logic/models/jozz_model.dart';
import 'package:flutter/cupertino.dart';

class JozzWidget extends StatefulWidget {
  const JozzWidget({Key? key, required this.jozz}) : super(key: key);

  final JozzModel jozz;

  @override
  State<JozzWidget> createState() => _JozzWidgetState();
}

class _JozzWidgetState extends State<JozzWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
