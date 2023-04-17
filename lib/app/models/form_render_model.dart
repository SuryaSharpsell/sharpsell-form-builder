// To parse this JSON data, do
//
//     final formInputResponse = formInputResponseFromJson(jsonString);

import 'dart:convert';

FormInputResponse formInputResponseFromJson(String str) => FormInputResponse.fromJson(json.decode(str));

String formInputResponseToJson(FormInputResponse data) => json.encode(data.toJson());

class FormInputResponse {
  FormInputResponse({
    required this.presentationName,
    required this.id,
    required this.formDetails,
  });

  String presentationName;
  int id;
  List<FormDetail> formDetails;

  factory FormInputResponse.fromJson(Map<String, dynamic> json) => FormInputResponse(
    presentationName: json["presentation_name"],
    id: json["id"],
    formDetails: List<FormDetail>.from(json["form_details"].map((x) => FormDetail.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "presentation_name": presentationName,
    "id": id,
    "form_details": List<dynamic>.from(formDetails.map((x) => x.toJson())),
  };
}

class FormDetail {
  FormDetail({
    required this.formType,
    required this.formKey,
    required this.isRequired,
    required this.dependentOn,
    required this.placeHolder,
    required this.description,
    required this.order,
    required this.iconUrl,
    required this.imageUrl,
    required this.videoUrl,
    required this.listItems,
    required this.validation,
  });

  String formType;
  String formKey;
  bool isRequired;
  List<dynamic> dependentOn;
  String placeHolder;
  String description;
  int order;
  String iconUrl;
  String imageUrl;
  String videoUrl;
  List<String> listItems;
  Validation validation;

  factory FormDetail.fromJson(Map<String, dynamic> json) => FormDetail(
    formType: json["form_type"],
    formKey: json["form_key"],
    isRequired: json["isRequired"],
    dependentOn: List<dynamic>.from(json["dependentOn"].map((x) => x)),
    placeHolder: json["placeHolder"],
    description: json["description"],
    order: json["order"],
    iconUrl: json["icon_url"],
    imageUrl: json["image_url"],
    videoUrl: json["video_url"],
    listItems: List<String>.from(json["list_items"].map((x) => x)),
    validation: Validation.fromJson(json["validation"]),
  );

  Map<String, dynamic> toJson() => {
    "form_type": formType,
    "form_key": formKey,
    "isRequired": isRequired,
    "dependentOn": List<dynamic>.from(dependentOn.map((x) => x)),
    "placeHolder": placeHolder,
    "description": description,
    "order": order,
    "icon_url": iconUrl,
    "image_url": imageUrl,
    "video_url": videoUrl,
    "list_items": List<dynamic>.from(listItems.map((x) => x)),
    "validation": validation.toJson(),
  };
}

class Validation {
  Validation({
    required this.isNumeric,
    required this.minVale,
    required this.maxValue,
  });

  bool isNumeric;
  int minVale;
  int maxValue;

  factory Validation.fromJson(Map<String, dynamic> json) => Validation(
    isNumeric: json["isNumeric"],
    minVale: json["minVale"],
    maxValue: json["maxValue"],
  );

  Map<String, dynamic> toJson() => {
    "isNumeric": isNumeric,
    "minVale": minVale,
    "maxValue": maxValue,
  };
}
