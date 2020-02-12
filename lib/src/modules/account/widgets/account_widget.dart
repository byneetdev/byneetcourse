import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  AccountWidget({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClayContainer(
        color: Color(0xFFD2E0EF),
        borderRadius: 15,
        child: ListTile(
          leading: ClayContainer(
            width: 30,
            height: 30,
            color: Color(0xFFD2E0EF),
            borderRadius: 30,
            child: icon,
          ),
          title: Text(title),
          trailing: ClayContainer(
            width: 30,
            height: 30,
            color: Color(0xFFD2E0EF),
            borderRadius: 30,
            child: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
