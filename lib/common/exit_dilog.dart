import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

Widget exitDialoge(context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        "conform".text.size(18).color(Colors.black38).make(),
        Divider(),
        10.heightBox,
        "Are you sure want to exit?.."
            .text
            .size(16)
            .color(Colors.black38)
            .make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
                onpress: () {
                  SystemNavigator.pop();
                },
                color: Colors.green,
                textColor: Colors.white,
                title: "Yes",
                onPress: () {}),
            ourButton(
                onpress: () {
                  Navigator.pop(context);
                },
                color: Colors.red,
                textColor: Colors.white,
                title: "No",
                onPress: () {})
          ],
        ),
      ],
    ).box.color(Colors.black87).padding(EdgeInsets.all(12)).roundedSM.make(),
  );
}
