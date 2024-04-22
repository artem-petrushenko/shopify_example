import 'package:flutter/material.dart';

class DefaultDropdown extends StatelessWidget {
  const DefaultDropdown({
    super.key,
    required this.dropdownMenuEntries,
    required this.onPressed,
  });

  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final Function(int index) onPressed;

  @override
  Widget build(BuildContext context) => DropdownMenu<String>(
        initialSelection: dropdownMenuEntries.first.value,
        onSelected: (String? value) {
          final index = dropdownMenuEntries
              .indexWhere((element) => element.value == value);
          onPressed(index);
        },
        dropdownMenuEntries: dropdownMenuEntries,
      );
}
