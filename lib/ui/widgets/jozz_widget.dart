import 'package:flash/logic/models/jozz_model.dart';
import 'package:flutter/material.dart';

class JozzWidget extends StatefulWidget {
  const JozzWidget({Key? key, required this.jozz}) : super(key: key);

  final JozzModel jozz;

  @override
  State<JozzWidget> createState() => _JozzWidgetState();
}

class _JozzWidgetState extends State<JozzWidget> {
  @override
  Widget build(BuildContext context) {
    final bool isSelected = widget.jozz.assignedUser != null;

    return GestureDetector(
      onTap: () {
        /// TODO: Send to back-end to reserve the Jozz for the current user.
        debugPrint("Jozz is clicked");
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage(
              'images/4.png',
            ),
            fit: BoxFit.cover,
          ),
          border: Border.all(
              color:
                  isSelected ? Colors.cyanAccent.shade700 : Colors.transparent,
              width: 4),
          borderRadius: const BorderRadius.all(Radius.circular(80)),
        ),
        child: Text(
          widget.jozz.jozzNum.toString(), // Jozz number
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.cyanAccent.shade700 : Colors.black54,
          ),
        ),
      ),
    );
  }
}
