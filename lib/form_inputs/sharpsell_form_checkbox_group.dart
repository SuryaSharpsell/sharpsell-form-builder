import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SharpsellFormCheckBoxGroup extends StatelessWidget {
  final bool isRequired;
  final List<String> checkboxItems;
  final String formUniqueKey;
  final String placeHolder;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;
  Function(String)? onValueChanged;

  SharpsellFormCheckBoxGroup({
    Key? key,
    this.isFromFormBuilder = false,
    this.onSettingTap,
    this.onDeleteTap,
    this.onValueChanged,
    required this.checkboxItems,
    required this.placeHolder,
    required this.isRequired,
    required this.formUniqueKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding:  EdgeInsets.only(left: 10.0,right: 10),
          child: FormBuilderCheckboxGroup<String>(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            orientation: OptionsOrientation.vertical,
            activeColor: Color(0xFFAE1E57),

            decoration: InputDecoration(labelText: placeHolder),
            name: formUniqueKey,
            // initialValue: const ['Dart'],
            options: checkboxItems.map((checkboxItem) => FormBuilderFieldOption(value: checkboxItem)).toList(),
            onChanged: (value){onValueChanged!(value as String);},
            // separator: VerticalDivider(
            //   width: 10,
            //   thickness: 5,
            //   color: Colors.yellow,
            // ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.minLength(1),
              FormBuilderValidators.maxLength(3),
            ]),
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
