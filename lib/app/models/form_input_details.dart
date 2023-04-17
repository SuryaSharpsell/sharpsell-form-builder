
import 'package:sharpsell_form_builder/app/form_input_name.dart';

class FormInputDetails{
final SharpsellFormInputType formType;
final String formUniqueKey;
final String placeHolder;
List<String>? items;
final int minValue;
final int maxValue;
final bool isRequired;
final int order;

FormInputDetails({
  required this.formType,
  required this.formUniqueKey,
  required this.placeHolder,
  required this.minValue,
  required this.maxValue,
  required this.order,
  required this.isRequired,
  this.items,
});

}