import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SharpsellFormChipRadioButton extends StatefulWidget {
  final bool isRequired;
  final String formUniqueKey;
  final String placeHolder;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;
  Function? onValueChanged;

  SharpsellFormChipRadioButton({
    Key? key,
    this.isFromFormBuilder = false,
    this.onSettingTap,
    this.onDeleteTap,
    this.onValueChanged,
    required this.placeHolder,
    required this.isRequired,
    required this.formUniqueKey,
  }) : super(key: key);

  @override
  State<SharpsellFormChipRadioButton> createState() => _SharpsellFormChipRadioButton();
}

class _SharpsellFormChipRadioButton extends State<SharpsellFormChipRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child:  FormBuilderChoiceChip<String>(
            elevation:  0,
            selectedColor:  Color(0xFFAE1E57),
            avatarBorder: RoundedRectangleBorder(),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(labelText: widget.placeHolder,
                border: InputBorder.none,),
            name:  widget.formUniqueKey,
              // direction:  Axis.vertical,
            // labelPadding: EdgeInsets.only(left: 10.0,right: 10),
            // padding: EdgeInsets.all(50.0),
            initialValue: 'Male',
            options: const [
              FormBuilderChipOption(
                value: 'Male',
                avatar: Icon(Icons.male, color: Colors.white),
              ),
              FormBuilderChipOption(
                value: 'Female',
                avatar: Icon(Icons.female, color: Colors.white),
              ),
              FormBuilderChipOption(
                value: 'Other',
                avatar: Icon(Icons.transgender, color: Colors.white),
              ),
            ],
              onChanged: (val) {
                print(val);
                widget.onValueChanged!();
              }
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
          ),
        SizedBox(height: 10)
      ],
    );
  }

}
