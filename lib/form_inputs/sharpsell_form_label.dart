import 'package:flutter/material.dart';

class SharpsellFormLabel extends StatelessWidget {
  final String heading;
  bool isFromFormBuilder;
  Function? onSettingTap;
  Function? onDeleteTap;

  SharpsellFormLabel({
    Key? key,
    required this.heading,
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
          Text(
            heading,
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
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
