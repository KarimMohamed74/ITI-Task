import 'package:flutter/material.dart';

Widget myTFF(
    {required validate,
    required String label,
    required IconData prefix,
    required BuildContext context,
    required Color color,
    TextEditingController? controller}) {
  return TextFormField(
    controller: controller,
    enabled: true,
    textInputAction: TextInputAction.next,
    validator: validate,
    decoration: InputDecoration(
      labelText: label,
    ),
  );
}
