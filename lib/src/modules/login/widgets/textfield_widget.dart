import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final FocusNode nodeName;
  final FocusNode destinationNode;
  final String validatorText;
  final String hintText;
  final bool isEmail;
  final TextEditingController controller;
  TextfieldWidget({
    @required this.nodeName,
    @required this.destinationNode,
    @required this.validatorText,
    @required this.hintText,
    @required this.isEmail,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      borderRadius: 15,
      color: Color(0xFFD2E0EF),
      curveType: CurveType.none,
      emboss: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextFormField(
          controller: controller,
          focusNode: nodeName,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            _fieldFocusChange(context, nodeName, destinationNode);
          },
          validator: (value) => value.isEmpty ? validatorText : null,
          cursorColor: Color(0xFFFB1002),
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
