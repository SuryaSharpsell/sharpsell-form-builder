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
    final String jsonStringOne = "{\"presentation_name\":\"\",\"id\":1,\"form_details\":[{\"form_type\":\"heading\",\"form_key\":\"user_detail_heading\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Enter User Details\",\"description\":\"User Details heading\",\"order\":1,\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"list_items\":[\"\"],\"validation\":{\"isNumeric\":false,\"minVale\":0,\"maxValue\":0}},{\"form_type\":\"textField\",\"form_key\":\"name_textField\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Name\",\"description\":\"\",\"order\":2,\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"list_items\":[\"\"],\"validation\":{\"isNumeric\":false,\"minVale\":1,\"maxValue\":10}},{\"form_type\":\"dropdown\",\"form_key\":\"gender_dropdown\",\"isRequired\":true,\"dependentOn\":[],\"placeHolder\":\"Gender\",\"description\":\"\",\"order\":3,\"icon_url\":\"\",\"image_url\":\"\",\"video_url\":\"\",\"list_items\":[\"Male\",\"Female\",\"Others\"],\"validation\":{\"isNumeric\":false,\"minVale\":0,\"maxValue\":0}}]}";
    final FormInputResponse response = formInputResponseFromJson(jsonStringOne);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color(0xFFAE1E57),
      ),
      body: SharpsellFormRender(formDetailsResponse: response),
      // body: SharpsellFromBuilder(),
    );
  }
}
