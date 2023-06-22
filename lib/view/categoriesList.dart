import 'dart:convert';
import 'package:customer_ordering_frontend/view/serach.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../model/entity/Rating.dart';
import '../model/entity/collection.dart';
import '../model/entity/product.dart';
import '../model/entity/productRating.dart';
import '../utils/constants.dart';

List<Collection> searchCollection = [];
List<Rating> searchRating = [];

class CategoriesList extends StatefulWidget {
  final int storeId;
  final List<Collection> collections;
  late List<Product> products = [];

  CategoriesList({
    required this.storeId,
    required this.collections,
    required this.products,
  });

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  late int _selectedCategoryId;

  // TODO initial storeId
  late int storeId;
  late List<Collection> collections = [];
  late List<Product> products = [];
  late List<Product> orderProducts = [];
  late List<Product> totalProducts = [];
  late ProductRatingData productRatingData = ProductRatingData();

  // TODO false

  @override
  void initState() {
    super.initState();

    storeId = widget.storeId;
    collections = widget.collections;
    products = widget.products;
    _selectedCategoryId = 0;
  }

  @override
  Widget build(BuildContext context) {
    void updateQuantities(List<Product> updatedProducts) {
      setState(() {
        products = [
          ...updatedProducts
        ]; // update the products list with the new quantities
      });
    }

    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(30),
              height: ScreenUtil().setHeight(30),
              child: IconButton(
                icon: const Icon(
                  Icons.search,
                  size: 24,
                  color: BlackColor,
                ),
                onPressed: () async {
                  List<Product> updatedProducts = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(
                        searchProducts: products,
                        onSearch:
                            updateQuantities, // pass updateQuantities as a callback
                      ),
                    ),
                  );
                  if (updatedProducts != null) {
                    // check if the user pressed back or not
                    setState(() {
                      products = [...updatedProducts];
                    });
                  }
                },
              ),
            ),
            const SizedBox(width: 5),
            const SizedBox(width: 5),
            SizedBox(
                height: ScreenUtil().setHeight(35),
                width: MediaQuery.of(context).size.width * 0.8,
                child: categoryBuild()),
          ],
        ),
        const SizedBox(height: 5,),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.50,
          child: productsList(),
        ),
      ],
    );
  }

  Widget categoryBuild() {
    return ListView.builder(
      itemCount: collections.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedCategoryId = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.only(left: 10),
            width: 100,
            decoration: BoxDecoration(
              color: _selectedCategoryId == index ? RedColor : WhiteColor,
              border: Border.all(color: BlackColor),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                collections[index].title,
                style: TextStyle(
                  color: _selectedCategoryId == index ? WhiteColor : RedColor,
                  height: 1.0,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget productsList() {
    return ListView(
      children: [
        Column(
          children: List.generate(
            // TODO _selectedCategoryId
            collections[_selectedCategoryId].products!.length,
            (index) {
              final product = collections[_selectedCategoryId].products![index];
              return Directionality(
                textDirection: TextDirection.ltr,
                child: InkWell(
                  onTap: () {
                    Get.toNamed(ProductInformationPage, arguments: product);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: BlackColor,
                        ),
                      ),
                    ),
                    height: ScreenUtil().setHeight(200),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(200),
                          height: ScreenUtil().setHeight(150),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: ScreenUtil().setWidth(100),
                                height: ScreenUtil().setHeight(100),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: product.image == null
                                      ? Image.asset(
                                          EmptyImg,
                                          width: ScreenUtil().setWidth(100),
                                          height: ScreenUtil().setHeight(100),
                                          fit: BoxFit.cover,
                                        )
                                      : Image.memory(
                                          base64.decode(product.image!),
                                          fit: BoxFit.cover,
                                          width: ScreenUtil().setWidth(100),
                                          height: ScreenUtil().setHeight(100),
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              EmptyImg,
                                              width: ScreenUtil().setWidth(100),
                                              height:
                                                  ScreenUtil().setHeight(100),
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                ),
                              ),
                              if (product.image == null)
                                const Positioned.fill(
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                ),
                              const SizedBox(
                                height: 8,
                              ),
                              foodCounter(product),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    product.title,
                                    style: TextStyle(
                                      fontFamily: IranSansWeb,
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(4),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "${(product.rate ?? 0)}"
                                          .toPersianDigit(),
                                      style: TextStyle(
                                        color: BlackColor,
                                        fontFamily: IranSansWeb,
                                        fontSize: ScreenUtil().setSp(12),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.star_border,
                                        color: YellowColor,
                                        size: ScreenUtil().setSp(20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(8),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  (product.description!),
                                  style: TextStyle(
                                    fontFamily: IranSansWeb,
                                    fontSize: ScreenUtil().setSp(12),
                                  ),
                                  maxLines: 2,
                                  textAlign: TextAlign.right,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),
                              const SizedBox(
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
                                        fontSize: ScreenUtil().setSp(12),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${product.unitPrice}".toPersianDigit(),
                                      style: const TextStyle(
                                        fontFamily: IranSansWeb,
                                        fontSize: 16,
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
              );
            },
          ),
        ),
      ],
    );
  }

  Widget foodCounter(Product product) {
    return Container(
      height: 40,
      width: 170,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    for (var element in products) {
                      if (element.id == product.id) {
                        products[products.indexOf(element)].Quantity =
                            product.quantity;
                      }
                    }
                  },
                );
              },
              style: buttonStyle(5, 5, 10, WhiteColor),
              child: const Icon(
                Icons.remove,
                color: BlackColor,
              ),
            ),
          ),
          Text(
            '${product.quantity}'.toPersianDigit(),
            style: const TextStyle(fontFamily: IranSansWeb, fontSize: 24),
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
                for (var element in products) {
                  if (element.id == product.id) {
                    products[products.indexOf(element)].Quantity =
                        product.quantity;
                  }
                }
              },
              style: buttonStyle(5, 5, 10, RedColor),
              child: const Icon(
                Icons.add,
              ),
            ),
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
          side: const BorderSide(color: BlackColor),
        ),
      ),
    );
  }
}
