import 'package:flutter/material.dart';
import 'package:sharpsell_form_builder/app/models/form_render_model.dart';
import 'package:sharpsell_form_builder/sharpsell_form_builder.dart';
import 'package:sharpsell_form_builder/sharpsell_form_renderer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   primarySwatch: Color(0xFFAE1E57),
      // ),
      home: const MyHomePage(title: 'Presentation Input Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final String jsonStringOne = "{\"presentation_name\":\"\",\"id\":1,\"form_details\":[{\"form_type\":\"heading\",\"form_key\":\"\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Enter User Details\",\"description\":\"This is description\",\"order\":1,\"list_items\":[\"\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":0,\"maxValue\":0}},{\"form_type\":\"textField\",\"form_key\":\"name_text_field\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Name\",\"description\":\"\",\"order\":1,\"list_items\":[\"\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":5,\"maxValue\":10}},{\"form_type\":\"numberTextField\",\"form_key\":\"age_text_field\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Age\",\"description\":\"\",\"order\":1,\"list_items\":[\"\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":true,\"minVale\":18,\"maxValue\":60}},{\"form_type\":\"dropdown\",\"form_key\":\"gender_dropdown\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Gender\",\"description\":\"\",\"order\":1,\"list_items\":[\"Male\",\"Female\",\"Others\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":5,\"maxValue\":10}},{\"form_type\":\"heading\",\"form_key\":\"\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Rider Benefits\",\"description\":\"\",\"order\":1,\"list_items\":[\"\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":0,\"maxValue\":0}},{\"form_type\":\"checkbox\",\"form_key\":\"rider_benefits_checkbox\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Additional Options\",\"description\":\"\",\"order\":1,\"list_items\":[\"Accidental Death Benefit Rider\",\"Term Benefit Rider\",\"Permanent Disability Rider\",\"Critical illness Benefit Rider\",\"Life Guardian Benefit Rider\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":5,\"maxValue\":10}},{\"form_type\":\"heading\",\"form_key\":\"\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Health Check Details\",\"description\":\"\",\"order\":1,\"list_items\":[\"\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":0,\"maxValue\":0}},{\"form_type\":\"textField\",\"form_key\":\"health_text_field\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Hospital Name\",\"description\":\"\",\"order\":1,\"list_items\":[\"\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":5,\"maxValue\":10}},{\"form_type\":\"checkbox\",\"form_key\":\"health_benefits_checkbox\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Health Insurance\",\"description\":\"\",\"order\":1,\"list_items\":[\"ICCI Lamboard\",\"HDFC Life\",\"Star health\",\"None of the above\"],\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"validation\":{\"isNumeric\":false,\"minVale\":5,\"maxValue\":10}}]}";
    final FormInputResponse response = formInputResponseFromJson(jsonStringOne);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFAE1E57),
      ),
      // body: SharpsellFormRender(formDetailsResponse: response),
      body: SharpsellFromBuilder(),
    );
  }
}
