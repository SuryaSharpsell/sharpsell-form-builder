import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sharpsell_form_builder/app/form_input_name.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_label.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_textfiled.dart';

import 'app/models/form_render_model.dart';
import 'form_inputs/sharpsell_form_dropdown.dart';

class SharpsellFormRender extends StatefulWidget {
  final FormInputResponse formDetailsResponse;
  const SharpsellFormRender({Key? key, required this.formDetailsResponse}) : super(key: key);

  @override
  State<SharpsellFormRender> createState() => _SharpsellFormRenderState();
}

class _SharpsellFormRenderState extends State<SharpsellFormRender> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFeac9d6),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 2.5,
          color: Colors.white,
          child: FormBuilder(
            key: _formKey,
            child: Column(
              children: [
                ...getFormInputs(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> getFormInputs() {
    List<Widget> formInputList = [];
    List<FormDetail> formDetailsList = widget.formDetailsResponse.formDetails;

    for (final formInput in formDetailsList) {
      if (formInput.formType == SharpsellFormInputType.textField.name) {
        formInputList.add(SharpsellFormTextField(
          placeHolder: formInput.placeHolder,
          isRequired: formInput.isRequired,
          minValue: formInput.validation.minVale,
          maxValue: formInput.validation.maxValue,
          formUniqueKey: formInput.formKey,
          onValueChanged: () {},
        ));
      } else if (formInput.formType == SharpsellFormInputType.heading.name) {
        formInputList.add(SharpsellFormHeading(heading: formInput.placeHolder, description: 'This is sample description'));
      } else if (formInput.formType == SharpsellFormInputType.dropdown.name) {
        if (formInput.listItems.isNotEmpty) {
          formInputList.add(SharpsellFormDropdown(
            checkBoxItemsList: formInput.listItems,
            isRequired: formInput.isRequired,
            placeHolder: formInput.placeHolder,
            formUniqueKey: formInput.formKey,
            onValueChanged: () {},
          ));
        } else {
          print("Surya - List is empty for ${formInput.formKey}");
        }
      }
    }

    return formInputList;
  }
}
