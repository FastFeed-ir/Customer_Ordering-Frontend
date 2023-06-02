import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../utils/constants.dart';
import 'categoriesList.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late var explainText = '';
  bool isProduct = false;
  late int foodIndex = -1;

  void search() {
    for (var item in searchProduct) {
      if (item.title.compareTo(explainText) == 0) {
        foodIndex = searchProduct.indexOf(item);
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    if (foodIndex == -1) {
      bodyWidget = notFound();
    } else {
      bodyWidget = result();
      foodIndex == -1;
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // TODO delete products List
          leading: BackButton(),
          title: Center(
              child: Text(
            "جستجو",
            style: TextStyle(
              fontFamily: IranSansWeb,
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
          )),
          actions: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.delete),
              label: Text(''),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              writeWord(),
              bodyWidget,
            ],
          ),
        ),
      ),
    );
  }
  Widget notFound() {
    return Container(
      height: 200,
      child: Text("یافت نشد",
          style: TextStyle(
            fontFamily: IranSansWeb,
            color: BlackColor,
          )),
    );
  }

  Widget result() {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Container(
            padding: EdgeInsets.only(top: 10, right: 30),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BlackColor,
                ),
              ),
            ),
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FoodCounter(index: foodIndex),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            searchProduct[foodIndex].title,
                            style: TextStyle(
                                fontFamily: IranSansWeb,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "تومان",
                              style: TextStyle(
                                fontFamily: IranSansWeb,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${searchProduct[foodIndex].unitPrice.round() ?? 0}"
                                  .toPersianDigit()
                                  .seRagham(),
                              style: TextStyle(
                                fontFamily: IranSansWeb,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget writeWord() {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 20),
      height: MediaQuery.of(context).size.height * 0.4,
      child: Column(
        textDirection: TextDirection.rtl,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 70,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(20.0),
                  labelStyle: TextStyle(color: BlackColor),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: RedColor),
                  ),
                  hintText: 'جستجوی غذا',
                ),
                maxLines: 1,
                style: TextStyle(
                  color: BlackColor,
                  fontFamily: IranSansWeb,
                ),
                onChanged: (value) {
                  setState(() {
                    explainText = value;
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            width: 160,
            height: 60,
            child: ElevatedButton(
              onPressed: search,
              child: Text(
                "جستجو",
                style: TextStyle(
                  fontFamily: IranSansWeb,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: WhiteColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: BlackColor,
                ),
              ),
            ),
            child: Center(
                child: Text(
              "نتایج",
              style: TextStyle(
                fontFamily: IranSansWeb,
                fontSize: 24,
                color: BlackColor,
              ),
            )),
          ),
        ],
      ),
    );
  }

  ButtonStyle buttonStyle(
      double width, double height, double radius, Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      elevation: MaterialStateProperty.all<double>(0.0),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      fixedSize: MaterialStateProperty.all<Size>(
        Size(width, height),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: BlackColor),
        ),
      ),
    );
  }
}

class FoodCounter extends StatefulWidget {
  final int index;

  FoodCounter({required this.index});

  @override
  State<FoodCounter> createState() => _FoodCounterState();
}

class _FoodCounterState extends State<FoodCounter> {
  late int index;

  @override
  void initState() {
    index = widget.index;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 170,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        if (searchProduct[index].quantity > 0) {
                          searchProduct[index].quantity--;
                        }
                      },
                    );
                  },
                  style: buttonStyle(5, 5, 10, WhiteColor),
                  child: Icon(
                    Icons.remove,
                    color: BlackColor,
                  ),
                ),
              ),
              Text(
                '${searchProduct[index].quantity}'.seRagham(),
                style: TextStyle(fontFamily: IranSansWeb, fontSize: 24),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        searchProduct[index].quantity++;
                      },
                    );
                  },
                  child: Icon(
                    Icons.add,
                  ),
                  style: buttonStyle(5, 5, 10, RedColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

  ButtonStyle buttonStyle(
      double width, double height, double radius, Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      elevation: MaterialStateProperty.all<double>(0.0),
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      fixedSize: MaterialStateProperty.all<Size>(
        Size(width, height),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: BorderSide(color: BlackColor),
        ),
      ),
    );
  }
}
