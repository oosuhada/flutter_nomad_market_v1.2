// components/onboarding/widgets/language_dropdown.dart
import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final String currentLanguage;
  final Function(String?) onChanged;

  const LanguageDropdown({
    Key? key,
    required this.currentLanguage,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: currentLanguage,
        icon: const Icon(Icons.arrow_drop_down),
        underline: const SizedBox(),
        items: [
          DropdownMenuItem(
            value: 'ko',
            child: Row(
              children: [
                Text('한국어', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          DropdownMenuItem(
            value: 'en',
            child: Row(
              children: [
                Text('English', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
          DropdownMenuItem(
            value: 'ja',
            child: Row(
              children: [
                Text('日本語', style: TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
