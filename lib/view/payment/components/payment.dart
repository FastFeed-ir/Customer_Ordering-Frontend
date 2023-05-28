import 'package:flutter/material.dart';
import '../../../utils/constants.dart';
import 'package:customer_ordering_frontend/model/entity/order.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../model/entity/orderItem.dart';
import '../../../model/entity/product.dart';
class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<Order> orderList = [
    Order(id: 1, table_number: 5, store: 1, description: "aa"),
  ];
  final List<OrderItem> orderItemList = [
    OrderItem(
      order: 1,
      quantity: 2,
      product: 2,
      product_title: "کباب",
      product_unit_price: 20000,),
    OrderItem(
      order: 1,
      quantity: 3,
      product: 3,
      product_title: "پیتزا",
      product_unit_price: 30000,),
    OrderItem(
      order: 1,
      quantity: 4,
      product: 5,
      product_title: "اسنک",
      product_unit_price: 40000,),
  ];
  late List<Product> products = [
    Product(
      id: 1,
      title: 'آش',
      unitPrice: 20000,
      isAvailable: true,
      collectionId: 1,
      storeId: 1,
      description:
      'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است،',
    ),
    Product(
      id: 2,
      title: 'کباب',
      unitPrice: 20000,
      isAvailable: true,
      collectionId: 1,
      storeId: 1,
      description: 'خوشمزه است',
      Quantity: 5,
    ),
    Product(
      id: 3,
      title: 'حلیم',
      unitPrice: 20000,
      isAvailable: true,
      collectionId: 1,
      storeId: 1,
      description: 'خوشمزه است',
      Quantity: 2,
    ),
    Product(
      id: 4,
      title: 'پیتزا',
      unitPrice: 20000,
      isAvailable: true,
      collectionId: 2,
      storeId: 1,
      description: 'خوشمزه است',
    ),
    Product(
      id: 5,
      title: 'اسنک',
      unitPrice: 20000,
      isAvailable: true,
      collectionId: 2,
      storeId: 1,
      description: 'خوشمزه است',
    ),
  ];
  late double sum;
  late double totalCost = 0;
  late String explainText;

  @override
  void initState() {
    sum = 0;
    for(var product in products){
      product.priceCount = (product.quantity ?? 0) * product.unitPrice;
      sum += product.priceCount ?? 0;
    }
    totalCost = sum;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // TODO delete products List
          leading: BackButton(
              onPressed: () {
                // TODO back orderList
              },
          ),
          title: Center(
              child: Text(
            "سبد خرید",
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
        body: ordering(),
      ),
    );
  }
  Widget ordering() {
    return ListView(
      children: [
        Column(
          children: List.generate(
            products.length,
                (index) {
              final product = products[index];
              return Directionality(
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
                            foodCounter(product, index),
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
                                  product.title,
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
                                    "${product.unitPrice.round() ?? 0}"
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
              );
            },
          ),
        ),
        explain(),
        checkOut(),
        sendOrder(),
      ],
    );
  }

  Widget foodCounter(Product product, int index) {
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
                        if (product.quantity > 0) {
                          product.quantity--;
                        }
                        product.priceCount = product.quantity * product.unitPrice;
                        sum = 0;
                        for(var item in products){
                          sum += item.priceCount ?? 0 ;
                        }
                        totalCost = sum;
                        products[index].Quantity = product.quantity;
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
                '${product.quantity}'.seRagham(),
                style: TextStyle(fontFamily: IranSansWeb, fontSize: 24),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                          () {
                        product.quantity++;
                      },
                    );
                    product.priceCount = product.quantity * product.unitPrice;
                    sum = 0;
                    for(var item in products){
                      sum += item.priceCount ?? 0 ;
                    }
                    totalCost = sum;
                    products[index].Quantity = product.quantity;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
                '${(product.priceCount?.round() ?? 0)}'
                    .toPersianDigit()
                    .seRagham(),
                style: TextStyle(fontFamily: IranSansWeb, fontSize: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ButtonStyle buttonStyle(double width, double height, double radius, Color color) {
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

  Widget explain() {
    return Container(
      padding: EdgeInsets.only(top: 20,right: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BlackColor,
          ),
        ),
      ),
      height: 360,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "توضیحات",
                style: TextStyle(
                    fontFamily: IranSansWeb,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10,),
          SizedBox(
            width: 300,
            height: 200,
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
                hintText: 'توضیحات سفارش خود را اینجا بنویسید',
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 10,
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
        ],
      ),
    );
  }

  Widget checkOut() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      height: 100,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: BlackColor,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "جمع کل :",
            style: TextStyle(
                fontFamily: IranSansWeb,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
          Row(
            children: [
              Text(
                "${totalCost.round()}".toPersianDigit().seRagham(),
                style: TextStyle(fontFamily: IranSansWeb, fontSize: 26),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "تومان",
                style: TextStyle(
                  fontFamily: IranSansWeb,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget sendOrder() {
    return Container(
      padding: EdgeInsets.only(top: 10,right: 100,left: 100, bottom: 10,),
      child: ElevatedButton(
        onPressed: (){
          products.removeWhere((element) => element.quantity == 0);
          // TODO send total cost for payment
          print(totalCost);
          // TODO product -> orderItem
          products.forEach((element) {print("${element.title} \t ${element.Quantity}");});
          //Get.toNamed("");
          products.clear();
        },
        child: Text(
          "ثبت سفارش",
          style: TextStyle(
            fontFamily: IranSansWeb,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: WhiteColor,
          ),
        ),
      ),
    );
  }
}
