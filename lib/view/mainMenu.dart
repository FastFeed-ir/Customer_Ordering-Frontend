import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:flutter/material.dart';
import 'categoriesList.dart';
import 'storeDetails.dart';

class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarMenu(),
        body: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.only(top: 5,left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StoreDetails(),
              SizedBox(height: 10,),
              CategoriesList(),
            ],
          ),
        ),
      ),
    );
  }
}
