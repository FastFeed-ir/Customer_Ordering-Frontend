import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../model/entity/product.dart';
import '../utils/constants.dart';
import 'categoriesList.dart';

class SearchPagee extends StatefulWidget {
  final List<Product> products;
  final Function(List<Product>) onSearch;

  const SearchPagee({Key? key, required this.products, required this.onSearch})
      : super(key: key);

  @override
  _SearchPageeState createState() => _SearchPageeState();
}

class _SearchPageeState extends State<SearchPagee> {
  late List<Product> searchResults;

  @override
  void initState() {
    super.initState();
    searchResults = widget.products;
  }

  void _search(String keyword) {
    setState(() {
      if (keyword.isNotEmpty) {
        searchResults = widget.products
            .where((product) => product.title.contains(keyword))
            .toList();
      } else {
        searchResults = widget.products;
      }
    });
    widget.onSearch(searchResults);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جستجو'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _search,
              decoration: const InputDecoration(
                labelText: 'جستجو',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final product = searchResults[index];
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(product.title,
                          style: const TextStyle(
                              fontFamily: IranSansWeb, fontSize: 24)),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Text(
                        'قیمت: ${product.unitPrice}تومان',
                        style: const TextStyle(
                            fontFamily: IranSansWeb, fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      FoodCounter(index: index),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
                  style: buttonStyle(5, 5, 10, RedColor),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              Text(
                '${searchProduct[index].quantity}'.seRagham(),
                style: const TextStyle(fontFamily: IranSansWeb, fontSize: 24),
              ),
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
                  child: const Icon(
                    Icons.remove,
                    color: BlackColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
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
          side: const BorderSide(color: BlackColor),
        ),
      ),
    );
  }
}
