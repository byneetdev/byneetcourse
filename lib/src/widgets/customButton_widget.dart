import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String title;
  CustomButtonWidget({
    @required this.onPressed,
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: CustomColor.buttonColor,
      elevation: 7.0,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
