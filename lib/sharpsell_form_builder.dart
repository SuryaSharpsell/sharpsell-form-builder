library sharpsell_form_builder;

import 'package:flutter/material.dart';
import 'package:sharpsell_form_builder/app/common/form_validation_input_alert.dart';
import 'package:sharpsell_form_builder/app/form_input_name.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_dropdown.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_label.dart';
import 'package:sharpsell_form_builder/form_inputs/sharpsell_form_textfiled.dart';

import 'app/models/form_input_details.dart';

class SharpsellFromBuilder extends StatefulWidget {
  const SharpsellFromBuilder({Key? key}) : super(key: key);

  @override
  State<SharpsellFromBuilder> createState() => _SharpsellFromBuilderState();
}

class _SharpsellFromBuilderState extends State<SharpsellFromBuilder> {
  final List<String> formItemsList = ["Heading", "Text Field", "Dropdown"];
  final ValueNotifier<bool> isFormInputUpdated = ValueNotifier(false);
  final List<FormInputDetails> addedFormInputList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 591,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: formItemsList.length,
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              separatorBuilder: (context, index) {
                return SizedBox(height: 20);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                      // await showDialog<void>(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return SimpleDialog(
                      //         title: const Text('Select Booking Type'),
                      //         children: <Widget>[
                      //           SimpleDialogOption(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //             child: const Text('General'),
                      //           ),
                      //           SimpleDialogOption(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //             child: const Text('Silver'),
                      //           ),
                      //           SimpleDialogOption(
                      //             onPressed: () {
                      //               Navigator.of(context).pop();
                      //             },
                      //             child: const Text('Gold'),
                      //           ),
                      //         ],
                      //       );
                      //     });

                   await showDialog(
                      useRootNavigator: false,
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return WillPopScope(
                          onWillPop: () async {
                            return false;
                          },
                          child: FormValidationInputDialog(
                              onAdd: (){
                            switch (formItemsList[index]) {
                            case "Heading":
                              addedFormInputList.add(
                                FormInputDetails(
                                  formType: SharpsellFormInputType.heading,
                                  formUniqueKey: "",
                                  placeHolder: "",
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
                          }
                          isFormInputUpdated.value = !isFormInputUpdated.value;
                            },
                              onCancel: (){},
                              formInputType: SharpsellFormInputType.textField,
                          ),
                        );
                      },
                    );

                  },
                  child: Card(
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: Colors.greenAccent[100],
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          formItemsList[index],
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green[900],
                            fontWeight: FontWeight.w500,
                          ),
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
                color: Colors.red,
                child: Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width / 2.5,
                    color: Colors.teal,
                    child: ValueListenableBuilder<bool>(
                        valueListenable: isFormInputUpdated,
                        builder: (_, formSelectedState, __) {
                          return ReorderableListView.builder(
                            shrinkWrap: true,
                            itemCount: addedFormInputList.length,
                            padding: const EdgeInsets.only(left: 8.0, right: 8),
                            // separatorBuilder: (context, index) {
                            //   return SizedBox(height: 20);
                            // },
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
                                    }, description: 'This is sample description',
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
                                case SharpsellFormInputType.dropdown:
                                  return Container(
                                    key: ValueKey<int>(index),
                                    width: MediaQuery.of(context).size.width / 2.8,
                                    child: SharpsellFormDropdown(
                                      checkBoxItemsList: formItem.items!,
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
