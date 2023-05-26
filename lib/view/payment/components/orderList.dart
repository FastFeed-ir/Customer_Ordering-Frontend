import 'package:customer_ordering_frontend/model/entity/order.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../model/entity/orderItem.dart';
import '../../../model/entity/product.dart';
import '../../../utils/constants.dart';

class OrderList extends StatefulWidget {
  const OrderList({super.key});

  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  final List<Order> orderList = [
    Order(id: 1, table_number: 5, store: 1, description: "aa"),
  ];
  final List<OrderItem> orderItemList = [
    OrderItem(
        order: 1,
        quantity: 2,
        product: 2,
        product_title: "کباب",
        product_unit_price: 20000),
    OrderItem(
        order: 1,
        quantity: 3,
        product: 3,
        product_title: "پیتزا",
        product_unit_price: 30000),
    OrderItem(
        order: 1,
        quantity: 4,
        product: 5,
        product_title: "اسنک",
        product_unit_price: 40000),
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
    ),
    Product(
      id: 3,
      title: 'حلیم',
      unitPrice: 20000,
      isAvailable: true,
      collectionId: 1,
      storeId: 1,
      description: 'خوشمزه است',
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
  late double totalCost = 0;
  late String explainText;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                        totalCost -= product.priceCount ?? 0;
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
                    totalCost += product.priceCount ?? 0;
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

  Widget explain() {
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
          Text(
            "توضیحات",
            style: TextStyle(
                fontFamily: IranSansWeb,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 310,
            height: 155,
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: BlackColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: YellowColor),
                ),
                labelText: 'توضیحات سفارش خود را اینجا بنویسید',
              ),
              style: TextStyle(
                color: BlackColor,
                fontFamily: "IranSansWeb",
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
}
