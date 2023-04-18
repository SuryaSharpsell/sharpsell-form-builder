library sharpsell_form_builder;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sharpsell_form_builder/app/common/form_validation_input_alert.dart';
import 'package:sharpsell_form_builder/app/form_input_name.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_checkbox_group.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_dropdown.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_label.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_textfiled.dart';

import 'app/common/button_elevated.dart';
import 'app/models/form_input_details.dart';

class SharpsellFromBuilder extends StatefulWidget {
  const SharpsellFromBuilder({Key? key}) : super(key: key);

  @override
  State<SharpsellFromBuilder> createState() => _SharpsellFromBuilderState();
}

class _SharpsellFromBuilderState extends State<SharpsellFromBuilder> {
  final List<Map<String, dynamic>> formItemsList = [
    {"icon": Icons.h_mobiledata, "value": "Heading"},
    {"icon": Icons.text_fields, "value": "Text Field"},
    {"icon": Icons.numbers, "value": "Numeric Text Field"},
    {"icon": Icons.arrow_drop_down_circle, "value": "Dropdown"},
    {"icon": Icons.check_box_rounded, "value": "CheckBox"},
  ];

  final ValueNotifier<bool> isFormInputUpdated = ValueNotifier(false);
  final List<FormInputDetails> addedFormInputList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 591,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: formItemsList.length,
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: (2 / 1),
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    switch (formItemsList[index]["value"]) {
                      case "Heading":
                        addedFormInputList.add(
                          FormInputDetails(
                            formType: SharpsellFormInputType.heading,
                            formUniqueKey: "",
                            placeHolder: "Enter User Details",
                            minValue: 0,
                            maxValue: 0,
                            order: 1,
                            isRequired: true,
                          ),
                        );
                        break;
                      case "Text Field":
                        addedFormInputList.add(
                          FormInputDetails(
                            formType: SharpsellFormInputType.textField,
                            formUniqueKey: "name_text_field",
                            placeHolder: "Name",
                            minValue: 5,
                            maxValue: 10,
                            order: 1,
                            isRequired: true,
                          ),
                        );
                        break;
                      case "Dropdown":
                        addedFormInputList.add(
                          FormInputDetails(
                              formType: SharpsellFormInputType.dropdown,
                              formUniqueKey: "gender_dropdown",
                              placeHolder: "Gender",
                              minValue: 5,
                              maxValue: 10,
                              order: 1,
                              isRequired: true,
                              items: ["Male", "Female", "Others"]),
                        );
                        break;
                      case "CheckBox":
                        addedFormInputList.add(
                          FormInputDetails(
                              formType: SharpsellFormInputType.checkbox,
                              formUniqueKey: "rider_benefits_checkbox",
                              placeHolder: "Additional Options",
                              minValue: 5,
                              maxValue: 10,
                              order: 1,
                              isRequired: true,
                              items: ["Accidental Death Benefit Rider", "Term Benefit Rider", "Permanent Disability Rider", "Critical illness Benefit Rider", "Life Guardian Benefit Rider"]),
                        );
                        break;
                      case "Numeric Text Field":
                        addedFormInputList.add(
                          FormInputDetails(
                            formType: SharpsellFormInputType.numberTextField,
                            isNumeric: true,
                            formUniqueKey: "age_text_field",
                            placeHolder: "Age",
                            minValue: 18,
                            maxValue: 60,
                            order: 1,
                            isRequired: true,
                          ),
                        );
                        break;
                    }
                    isFormInputUpdated.value = !isFormInputUpdated.value;

                    // await showDialog(
                    //    useRootNavigator: false,
                    //    context: context,
                    //    barrierDismissible: false,
                    //    builder: (context) {
                    //      return WillPopScope(
                    //        onWillPop: () async {
                    //          return false;
                    //        },
                    //        child: FormValidationInputDialog(
                    //            onAdd: (){
                    //          switch (formItemsList[index]) {
                    //          case "Heading":
                    //            addedFormInputList.add(
                    //              FormInputDetails(
                    //                formType: SharpsellFormInputType.heading,
                    //                formUniqueKey: "",
                    //                placeHolder: "",
                    //                minValue: 0,
                    //                maxValue: 0,
                    //                order: 1,
                    //                isRequired: true,
                    //              ),
                    //            );
                    //            break;
                    //          case "Text Field":
                    //            addedFormInputList.add(
                    //              FormInputDetails(
                    //                formType: SharpsellFormInputType.textField,
                    //                formUniqueKey: "name_text_field",
                    //                placeHolder: "Name",
                    //                minValue: 5,
                    //                maxValue: 10,
                    //                order: 1,
                    //                isRequired: true,
                    //              ),
                    //            );
                    //            break;
                    //          case "Dropdown":
                    //            addedFormInputList.add(
                    //              FormInputDetails(
                    //                  formType: SharpsellFormInputType.dropdown,
                    //                  formUniqueKey: "gender_dropdown",
                    //                  placeHolder: "Gender",
                    //                  minValue: 5,
                    //                  maxValue: 10,
                    //                  order: 1,
                    //                  isRequired: true,
                    //                  items: ["Male", "Female", "Others"]),
                    //            );
                    //            break;
                    //        }
                    //        isFormInputUpdated.value = !isFormInputUpdated.value;
                    //          },
                    //            onCancel: (){},
                    //            formInputType: SharpsellFormInputType.textField,
                    //        ),
                    //      );
                    //    },
                    //  );
                  },
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Color(0xFFAE1E57),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(formItemsList[index]["icon"],color: Colors.white),
                            FittedBox(
                              child: Text(
                                formItemsList[index]["value"],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 1229,
              child: Container(
                color: Color(0xFFeac9d6),
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.white,
                    child: ValueListenableBuilder<bool>(
                        valueListenable: isFormInputUpdated,
                        builder: (_, formSelectedState, __) {
                          return SingleChildScrollView(
                            child: Column(
                              children: [
                                ReorderableListView.builder(
                                  shrinkWrap: true,
                                  itemCount: addedFormInputList.length,
                                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                                  onReorder: (int oldIndex, int newIndex) {
                                    setState(() {
                                      if (newIndex > oldIndex) {
                                        newIndex -= 1;
                                      }
                                      final items = addedFormInputList.removeAt(oldIndex);
                                      addedFormInputList.insert(newIndex, items);
                                      isFormInputUpdated.value = !isFormInputUpdated.value;
                                    });
                                  },
                                  itemBuilder: (context, index) {
                                    final FormInputDetails formItem = addedFormInputList[index];
                                    switch (formItem.formType) {
                                      case SharpsellFormInputType.heading:
                                        return SharpsellFormHeading(
                                          key: ValueKey<int>(index),
                                          heading: "Enter Customer Details",
                                          isFromFormBuilder: true,
                                          onSettingTap: () {},
                                          onDeleteTap: () {
                                            deleteFormItemFromList(index);
                                          },
                                          description: 'This is sample description',
                                        );
                                      case SharpsellFormInputType.textField:
                                        return Container(
                                          key: ValueKey<int>(index),
                                          width: MediaQuery.of(context).size.width / 2.8,
                                          child: SharpsellFormTextField(
                                            // key: ValueKey<int>(index),
                                            isRequired: formItem.isRequired,
                                            minValue: formItem.minValue,
                                            maxValue: formItem.maxValue,
                                            placeHolder: formItem.placeHolder,
                                            formUniqueKey: formItem.formUniqueKey,
                                            isFromFormBuilder: true,
                                            onSettingTap: () {
                                              print("Settings taped for index $index");
                                            },
                                            onDeleteTap: () {
                                              print("Delete taped for index $index");
                                              deleteFormItemFromList(index);
                                            },
                                          ),
                                        );
                                      case SharpsellFormInputType.numberTextField:
                                        return Container(
                                          key: ValueKey<int>(index),
                                          width: MediaQuery.of(context).size.width / 2.8,
                                          child: SharpsellFormTextField(
                                            // key: ValueKey<int>(index),
                                            isRequired: formItem.isRequired,
                                            isNumericField: formItem.isNumeric ?? false,
                                            minValue: formItem.minValue,
                                            maxValue: formItem.maxValue,
                                            placeHolder: formItem.placeHolder,
                                            formUniqueKey: formItem.formUniqueKey,
                                            isFromFormBuilder: true,
                                            onSettingTap: () {
                                              print("Settings taped for index $index");
                                            },
                                            onDeleteTap: () {
                                              print("Delete taped for index $index");
                                              deleteFormItemFromList(index);
                                            },
                                          ),
                                        );
                                      case SharpsellFormInputType.dropdown:
                                        return Container(
                                          key: ValueKey<int>(index),
                                          width: MediaQuery.of(context).size.width / 2.8,
                                          child: SharpsellFormDropdown(
                                            dropDownItemsList: formItem.items!,
                                            isRequired: formItem.isRequired,
                                            placeHolder: formItem.placeHolder,
                                            isFromFormBuilder: true,
                                            formUniqueKey: formItem.formUniqueKey,
                                            onSettingTap: () {
                                              print("Settings taped for index $index");
                                            },
                                            onDeleteTap: () {
                                              deleteFormItemFromList(index);
                                            },
                                          ),
                                        );
                                      case SharpsellFormInputType.checkbox:
                                        return Container(
                                          key: ValueKey<int>(index),
                                          width: MediaQuery.of(context).size.width / 2.8,
                                          child: SharpsellFormCheckBoxGroup(
                                            checkboxItems: formItem.items!,
                                            isRequired: formItem.isRequired,
                                            placeHolder: formItem.placeHolder,
                                            isFromFormBuilder: true,
                                            formUniqueKey: formItem.formUniqueKey,
                                            onSettingTap: () {
                                              print("Settings taped for index $index");
                                            },
                                            onDeleteTap: () {
                                              deleteFormItemFromList(index);
                                            },
                                          ),
                                        );
                                      default:
                                        return Container();
                                    }
                                  },
                                ),
                                SizedBox(width: 20),
                                if (addedFormInputList.isNotEmpty)
                                ButtonElevated(
                                  onPressed: (){
                                    final Map<String,dynamic> generatedForm = {};
                                    final List<Map<String,dynamic>> formDetails = [];
                                    generatedForm["presentation_name"] = "";
                                    generatedForm["id"] = 1;
                                    for (final formInput in addedFormInputList){
                                      formDetails.add({"form_type": formInput.formType.name,
                                        "form_key": formInput.formUniqueKey,
                                        "isRequired": formInput.isRequired,
                                        "dependentOn": [],
                                        "placeHolder": formInput.placeHolder,
                                        "order": formInput.order,
                                        "list_items": formInput.items,
                                        "icon_url": "",
                                        "image_url": "",
                                        "video_url": "",
                                        "validation": [{"isNumeric": formInput.isNumeric,"minVale": formInput.minValue,"maxValue":formInput.maxValue}]
                                      });
                                    }
                                    generatedForm["form_details"] = formDetails;

                                    String fromInJsonString = json.encode(generatedForm);
                                    print(fromInJsonString);
                                    // print(generatedForm);

                                  },
                                  backgroundColor: Color(0xFFAE1E57),
                                  foregroundColor: Colors.white,
                                  text: "Generate Form",
                                  textStyle: TextStyle(fontSize: 14),
                                )
                              ],
                            ),
                          );
                        }),
                    // ,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void deleteFormItemFromList(int index) {
    if (addedFormInputList.isNotEmpty) {
      addedFormInputList.removeAt(index);
      isFormInputUpdated.value = !isFormInputUpdated.value;
    }
  }
}
