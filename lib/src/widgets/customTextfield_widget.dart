import 'package:byneetcourseapp/src/tools/constColor.dart';
import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  final FocusNode nodeName;
  final FocusNode destinationNode;
  final String validatorText;
  final String hintText;
  final bool isEmail;
  final TextEditingController controller;
  CustomTextFieldWidget({
    this.nodeName,
    this.destinationNode,
    @required this.validatorText,
    @required this.hintText,
    @required this.isEmail,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: nodeName,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (value) {
        _fieldFocusChange(context, nodeName, destinationNode);
      },
      validator: (value) => value.isEmpty ? validatorText : null,
      cursorColor: CustomColor.textFieldColor,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: TextStyle(
          color: CustomColor.textColorSecondary,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColor.textFieldColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColor.textFieldColor,
          ),
        ),
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
