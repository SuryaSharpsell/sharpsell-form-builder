import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SharpsellFormDropdown extends StatelessWidget {
  final bool isRequired;
  final int minValue;
  final int maxValue;
  final String formUniqueKey;
  final List<String> checkBoxItemsList;
  String placeHolder;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;

  SharpsellFormDropdown({
    Key? key,
    this.placeHolder = "",
    this.isFromFormBuilder = false,
    this.onSettingTap,
    this.onDeleteTap,
    required this.checkBoxItemsList,
    required this.isRequired,
    required this.minValue,
    required this.maxValue,
    required this.formUniqueKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child:  FormBuilderDropdown<String>(
            // autovalidate: true,
            name: formUniqueKey,
            decoration: InputDecoration(
              labelText: placeHolder,
              // suffix: _genderHasError
              //     ? const Icon(Icons.error)
              //     : const Icon(Icons.check),
              hintText: '',
            ),
            validator: FormBuilderValidators.compose([
              if (isRequired)
                FormBuilderValidators.required()
            ]),
            items: checkBoxItemsList
                .map((checkBoxItem) => DropdownMenuItem(
              alignment: AlignmentDirectional.centerStart,
              value: checkBoxItem,
              child: Text(checkBoxItem),
            ))
                .toList(),
            onChanged: (val) {
              print("Dropdown value changed - $val");
              // setState(() {
              //   _genderHasError = !(_formKey
              //       .currentState?.fields['gender']
              //       ?.validate() ??
              //       false);
              // });
            },
            valueTransformer: (val) => val?.toString(),
          ),
        ),
        if (isFromFormBuilder)
          Row(
            children: [
              // SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  onSettingTap!();
                },
              ),
              SizedBox(width: 5),
              IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  onDeleteTap!();
                },
              ),
            ],
          )
      ],
    );
  }
}
