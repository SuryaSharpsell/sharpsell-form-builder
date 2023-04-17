import 'package:flutter/material.dart';


class SharpsellCheckbox extends StatelessWidget {
  const SharpsellCheckbox({super.key, required this.value, this.onChanged});

  final bool value;
  final ValueChanged<bool?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Color(0xFFAE1E57), width: 1),
          borderRadius: BorderRadius.circular(6),
        ),
        side: MaterialStateBorderSide.resolveWith(
          (states) => const BorderSide(width: 1.0, color: Color(0xFFAE1E57)),
        ),
        checkColor: Color(0xFFAE1E57),
        activeColor: Color(0xFFFCE8F0),
        value: value,
        onChanged: onChanged);
  }
}
