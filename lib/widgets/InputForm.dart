import 'package:flutter/material.dart';
import 'package:formcreditcard/const.dart';

class InputForm extends StatelessWidget {
  String textLabel;
  TextInputType inputType;
  IconButton? iconButton;
  String? hintText;
  InputForm(
      {super.key,
      required this.textLabel,
      required this.inputType,
      this.iconButton,
      this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(textLabel, style: inputLabel),
                if (iconButton != null) iconButton!,
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            TextFormField(
              keyboardType: inputType,
              style: inputText,
              cursorColor: brandColor,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: inputText,
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    color: gray400,
                    width: 1.5,
                  ),
                ),
                filled: true,
                // Focused
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  borderSide: BorderSide(
                    color: brandColor,
                    width: 1.5,
                  ),
                ),
                // Hover

                // Status Erros
                errorBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  borderSide: BorderSide(
                    width: 1.5,
                    color: statusError,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
