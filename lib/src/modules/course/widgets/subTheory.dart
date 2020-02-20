import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class SubTheoryWidget extends StatelessWidget {
  final String title;
  bool isComplete = false;
  final Function onTap;
  SubTheoryWidget({
    @required this.title,
    this.isComplete,
    @required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClayContainer(
        color: Color(0xFFD2E0EF),
        width: 35,
        height: 35,
        borderRadius: 35,
        child: isComplete
            ? IconButton(
                icon: Icon(Icons.done),
                onPressed: onTap,
                iconSize: 20,
                color: Color(0xFFFB1002),
              )
            : IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: onTap,
                color: Color(0xFFFB1002),
                iconSize: 20,
              ),
      ),
      title: ClayContainer(
        color: Color(0xFFD2E0EF),
        width: 50,
        borderRadius: 35,
        emboss: true,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
