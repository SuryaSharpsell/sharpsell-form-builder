import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/app_colors.dart';
import '../../styles/app_text_styles.dart';

class SharpsellTextField extends StatelessWidget {
  final TextEditingController? editingController;
  final Widget? prefixIcon;
  final String? hintText;
  final FormFieldValidator? validator;
  final bool enabled;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsets? contentPadding;
  final Icon? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const SharpsellTextField(
      {super.key,
      this.editingController,
      this.prefixIcon,
      this.hintText,
      this.validator,
      this.enabled = true,
      this.onFieldSubmitted,
      this.inputFormatters,
      this.suffixIcon,
      this.maxLength,
      this.maxLines,
      this.contentPadding,
      this.initialValue,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.hintColor),
      ),
      child: TextFormField(
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        cursorColor: AppColors.hintColor,
        controller: editingController,
        initialValue: initialValue,
        onChanged: onChanged,
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        style: AppTextStyles.textMD.copyWith(
            color: enabled ? AppColors.grey900 : AppColors.grey500,
            fontWeight: FontWeight.w400),
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: AppColors.grey, width: 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.grey, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.error300, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.grey, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppColors.error300, width: 1),
            ),
            errorStyle: AppTextStyles.textSMALL.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.error500),
            filled: true,
            hintStyle: const TextStyle(color: AppColors.hintColor),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hintText,
            contentPadding: contentPadding ??
                const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            isDense: true,
            fillColor: Colors.white),
      ),
    );
  }
}
