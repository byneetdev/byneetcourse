import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  final Icon icon;
  final String title;
  AccountWidget({@required this.icon, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: CustomColor.background,
          borderRadius: BorderRadius.circular(14.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0, // has the effect of softening the shadow
              spreadRadius: 2.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 5
                5.0, // vertical, move down 5
              ),
            )
          ],
        ),
        child: ListTile(
          leading: icon,
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: CustomColor.textColorPrimary,
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
