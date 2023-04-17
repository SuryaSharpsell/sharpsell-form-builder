import 'package:flutter/material.dart';

class SharpsellFormHeading extends StatelessWidget {
  final String heading;
  final String description;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;

  SharpsellFormHeading({
    Key? key,
    required this.heading,
    required this.description,
    this.isFromFormBuilder = false,
    this.onSettingTap,
    this.onDeleteTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,top: 10,bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.grey[500]),
              ),
            ],
          ),

          if (isFromFormBuilder)
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                onSettingTap!();
              },
            ),
          if (isFromFormBuilder)
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              onDeleteTap!();
            },
          ),
        ],
      ),
    );
  }
}
