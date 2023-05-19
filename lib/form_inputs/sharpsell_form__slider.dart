import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SharpsellFormSlider extends StatefulWidget {
  final bool isRequired;
  final String formUniqueKey;
  final String placeHolder;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;
  Function? onValueChanged;

  SharpsellFormSlider({
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
  State<SharpsellFormSlider> createState() => _SharpsellFormSlider();
}

class _SharpsellFormSlider extends State<SharpsellFormSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0,right: 10),
          child: FormBuilderSlider(
            name: widget.formUniqueKey,
            // valueformat: "years",
            textStyle: TextStyle(fontWeight: FontWeight.bold),
            minTextStyle: TextStyle(fontWeight: FontWeight.normal),
            maxTextStyle: TextStyle(fontWeight: FontWeight.normal),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.min(6),
            ]),
            min: 25.0,
            max: 50.0,
            initialValue: 35.0,
            divisions: 5,
            activeColor: Color(0xFFAE1E57),
            inactiveColor: Colors.pink[100],
            decoration: const InputDecoration(
              labelText: 'Insurance Duration',
              border: InputBorder.none,
            ),
            onChanged: (val) {
              print(val);
              widget.onValueChanged!();
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
          ),
        SizedBox(height: 10)
      ],
    );
  }

}
