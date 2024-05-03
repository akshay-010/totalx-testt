import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../Controller/provider.dart';

void botttomSheetss(context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  showModalBottomSheet(
      context: context,
      builder: (BuildContext as) {
        return Consumer<User>(builder: (context, provider, _) {
          return Container(
            height: height / 3.5,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: Text(
                    "Sort",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                ),
                ListTile(
                  leading: Radio(
                    activeColor: HexColor("#2873F0"),
                      value: 'value1',
                      groupValue: provider.age,
                      onChanged: (value) {
                        provider.radio(value);
                      }),
                  title: Text("All"),
                ),
                ListTile(
                  leading: Radio(
                      activeColor: HexColor("#2873F0"),
                      value: 'value2',
                      groupValue: provider.age,
                      onChanged: (value) {
                        provider.radioa(value);
                      }),
                  title: Text("Age: Elder"),
                ),
                ListTile(
                  leading: Radio(
                      activeColor: HexColor("#2873F0"),
                      value: 'value3',
                      groupValue: provider.age,
                      onChanged: (value) {
                        provider.radiob(value);
                      }),
                  title: Text("Age: Younger"),
                )
              ],
            ),
          );
        });
      });
}
