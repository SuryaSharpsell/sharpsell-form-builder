import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SharpsellFormTextField extends StatefulWidget {
  final bool isRequired;
  final int minValue;
  final int maxValue;
  bool isNumericField;
  final String formUniqueKey;
  String placeHolder;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;

  SharpsellFormTextField({
    Key? key,
    this.placeHolder = "",
    this.isFromFormBuilder = false,
    this.isNumericField = false,
    this.onSettingTap,
    this.onDeleteTap,
    required this.isRequired,
    required this.minValue,
    required this.maxValue,
    required this.formUniqueKey,
  }) : super(key: key);

  @override
  State<SharpsellFormTextField> createState() => _SharpsellFormTextFieldState();
}

class _SharpsellFormTextFieldState extends State<SharpsellFormTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: FormBuilderTextField(
            name: widget.formUniqueKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: widget.placeHolder),
            validator: FormBuilderValidators.compose([
              if (widget.isRequired) FormBuilderValidators.required(),
              if (!widget.isNumericField) FormBuilderValidators.minLength(widget.minValue),
              if (!widget.isNumericField) FormBuilderValidators.maxLength(widget.maxValue),
              if (widget.isNumericField) FormBuilderValidators.numeric(),
              if (widget.isNumericField) FormBuilderValidators.min(widget.minValue),
              if (widget.isNumericField) FormBuilderValidators.max(widget.maxValue),
              // (val) {
              //do custom validation
              // final number = int.tryParse(val);
              // if (number == null) return null;
              // if (number < 0) return 'We cannot have a negative age';
              //   return null;
              // }
            ]),
            onChanged: (val) {
              print(val); // Print the text value write into TextField
            },
          ),
        ),
        if (widget.isFromFormBuilder)
        Row(
          children: [
            // SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  widget.onSettingTap!();
                },
              ),
            SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  widget.onDeleteTap!();
                },
              ),
          ],
        )
      ],
    );
  }

}
