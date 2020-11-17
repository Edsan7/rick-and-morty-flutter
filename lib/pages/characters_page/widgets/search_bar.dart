import 'package:flutter/material.dart';

import 'custom_text_form.dart';

class SearchBar extends StatelessWidget {
  final Function(String) onSaved;
  final TextEditingController textEditingController;
  final Function onPressed;
  
  const SearchBar({
    Key key,
    this.onSaved,
    this.onPressed,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
      child: Row(
        children: [
         Flexible(
            child: CustomTextFormField(onSaved: onSaved, controller: textEditingController),
          ),
          FlatButton(
            child: Icon(Icons.search),
            minWidth: 10,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
