import 'package:flutter/material.dart';

import 'package:my_wb/wrapper_classes/form_wrapper_classes.dart';

import 'new_team_page_widgets.dart';

class FormCheckbox extends StatefulWidget {
  late Bool isChecked;
  final String label;
  FormCheckbox(this.label, this.isChecked);

  @override
  _FormCheckboxState createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: SelectButton(
        color: widget.isChecked.data ? Colors.greenAccent : Colors.redAccent,
        onPressed: () {
          setState(() {
            widget.isChecked.data = !widget.isChecked.data;
          });
        },
        label: widget.label,
      ),
    );
  }
}