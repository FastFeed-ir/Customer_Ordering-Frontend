import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
class Explain extends StatefulWidget {
  const Explain({Key? key}) : super(key: key);

  @override
  State<Explain> createState() => _ExplainState();
}

class _ExplainState extends State<Explain> {

  late String explain;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BlackColor,
          ),
        ),
      ),
      child: Column(
        children: [
          Text("توضیحات", style: TextStyle(fontFamily: IranSansWeb, fontSize: 30, fontWeight: FontWeight.bold),),
          SizedBox(
            width: 310,
            height: 155,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelStyle:
                TextStyle(color: BlackColor),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                  BorderSide(color: YellowColor),
                ),
                labelText: 'توضیحات سفارش خود را اینجا بنویسید',
              ),
              style: TextStyle(color: BlackColor,fontFamily: "IranSansWeb",),
              onChanged: (value) {
                setState(() {
                  explain = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
