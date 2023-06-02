import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../model/entity/product.dart';
import '../utils/constants.dart';
import 'categoriesList.dart';

class SearchScreen extends StatefulWidget {
  //final List<Product> products;
  //final Function(List<Product>) onSearch;

  const SearchScreen(
      {Key? key, /*required this.products, required this.onSearch*/})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Product> searchResults = [];

  @override
  void initState() {
    super.initState();
    //searchResults = searchProduct;
  }

  void _search(String keyword) {
    setState(() {
      if (keyword.isNotEmpty) {
        /*for (var item in searchProduct) {
          if (item.title.contains(keyword)) {
            searchResults.add(item);
          }
        }*/
        if(!searchResults.contains(searchProduct.where((product) => product.title.contains(keyword)))){
          searchResults.clear();
          searchResults.addAll(searchProduct.where((product) => product.title.contains(keyword)));}
      } else {
        searchResults = searchProduct.toList();
      }
    });
    onSearch(searchResults);
  }
  onSearch (List<Product> results) {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('جستجو'),
        leading: const BackButton(

        ),
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
                      Text(
                        product.title,
                        style: const TextStyle(
                            fontFamily: IranSansWeb, fontSize: 24),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            ' قیمت:',
                            style: TextStyle(
                                fontFamily: IranSansWeb, fontSize: 20),
                          ),
                          Text(
                            ' ${product.unitPrice.round()} '.seRagham().toPersianDigit(),
                            style: const TextStyle(
                                fontFamily: IranSansWeb, fontSize: 20),
                          ),
                          const Text(
                            ' تومان ',
                            style: TextStyle(
                                fontFamily: IranSansWeb, fontSize: 20),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      searchCounter(product),
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
  Widget searchCounter(Product product) {
    int index = searchProduct.toList().indexOf(product);
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
                        searchProduct.toList()[index].quantity++;
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
                '${searchProduct.toList()[index].quantity}'.seRagham(),
                style: const TextStyle(fontFamily: IranSansWeb, fontSize: 24),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                          () {
                        if (searchProduct.toList()[index].quantity > 0) {
                          searchProduct.toList()[index].quantity--;
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
