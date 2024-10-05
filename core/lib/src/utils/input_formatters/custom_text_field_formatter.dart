import 'package:flutter/services.dart';

class CustomTextFieldFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.startsWith(' ')) {
      return oldValue;
    } else {
      final String filteredText = newValue.text.replaceAll(RegExp(' +'), ' ');

      return TextEditingValue(
        text: filteredText,
        selection: (oldValue.text.length == filteredText.length)
            ? oldValue.selection
            : newValue.selection,
      );
    }
  }
}
