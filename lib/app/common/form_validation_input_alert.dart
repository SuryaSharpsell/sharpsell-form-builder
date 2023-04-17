import 'package:flutter/material.dart';
import 'package:sharpsell_form_builder/app/common/button_elevated.dart';
import 'package:sharpsell_form_builder/app/form_input_name.dart';

class FormValidationInputDialog extends StatelessWidget {
  final Function onAdd;
  final Function onCancel;
  final SharpsellFormInputType formInputType;

  FormValidationInputDialog({
    Key? key,
    required this.onAdd,
    required this.onCancel,
    required this.formInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.only(left: 300,right: 300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // SizedBox(height: 100),
          Align(
            child: Text(
              'Text Field Input Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              'There are no updates found.',
              // style: context.theme.textTheme.heading4Dark,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonElevated(
                onPressed: (){

              },
                backgroundColor: Colors.white,
                text: "Cancel",
              ),
              SizedBox(width: 10),
              ButtonElevated(
                onPressed: (){

              },
                backgroundColor: Color(0xFF831642),
                foregroundColor: Colors.white,
                text: "Add",
              ),
            ],
          ),
          SizedBox(height: 16),
        ],
      ));

          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Text("Text Field Details"),
          //         const Divider(color: Color(0xFFEAECF0), height: 1),
          //         AbsorbPointer(
          //           child: SharpsellCheckbox(
          //               value: true,
          //               onChanged: (value) => (value) {
          //                 //  model!.selectRoles(code : model!.roles[index].code!,value:value,index:index);
          //               }),
          //         ),
          //         Text("isRequired"),
          //         SizedBox(height: 10),

          //       ],
          // ),
        // ));
  }
}
