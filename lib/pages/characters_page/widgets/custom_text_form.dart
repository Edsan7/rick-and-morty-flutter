import 'package:flutter/material.dart';
import 'package:rick_and_morty/helpers/string_validator.dart';

class CustomTextFormField extends StatelessWidget {
  final Function(String) onSaved;
  final TextEditingController controller;
  
  const CustomTextFormField({
    Key key,
    this.onSaved,
    this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: TextFormField(
        keyboardType: TextInputType.text,
        controller: controller,
        onSaved: onSaved,
        validator: StringValidator.isEmptyString,
        decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: 'Search by name'
        ),
      ),
    );
  }
}
