import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../model/entity/product.dart';
import '../utils/constants.dart';

class SearchScreen extends StatefulWidget {
  final List<Product> searchProducts;
  final Function(List<Product>) onSearch;

  const SearchScreen(
      {Key? key, required this.searchProducts, required this.onSearch})
      : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Product> searchResults = [];
  @override
  void dispose() {
    super.dispose();
    widget.onSearch(widget.searchProducts);
  }
  @override
  void initState() {
    super.initState();
    //searchResults = searchProduct;
  }
  @override

  void _search(String keyword) {
    setState(() {
      if (keyword.isNotEmpty) {
        if(!searchResults.contains(widget.searchProducts.where((product) => product.title.contains(keyword)))){
          searchResults.clear();
          searchResults.addAll(widget.searchProducts.where((product) => product.title.contains(keyword)));}
        widget.onSearch(searchResults);

      } else {
        searchResults = widget.searchProducts;
      }
    });
    widget.onSearch(searchResults);
  }
  @override
  void didUpdateWidget(SearchScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchProducts != oldWidget.searchProducts) {
      setState(() {
        searchResults = widget.searchProducts;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
        child: AppBar(
          backgroundColor:  RedColor,
          automaticallyImplyLeading: false,
          flexibleSpace: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double availableWidth = constraints.maxWidth;
              final double availableHeight = constraints.maxHeight;

              final double logoHeight = availableHeight * 0.5;
              final double titleFontSize = availableHeight * 0.12;
              final double backIconSize = availableHeight * 0.10;

              return Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            WhiteLogo,
                            height: logoHeight,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: availableHeight * 0.05),
                          Text(
                            'جستجو',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:
                              WhiteColor,
                              fontFamily: IranSansWeb,
                              fontSize: titleFontSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: availableWidth * 0.10,
                    top: availableHeight * 0.72,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context, widget.searchProducts);
                      },
                      child: Icon(Icons.arrow_back_ios,
                          size: backIconSize,
                          color: WhiteColor),
                    ),
                  ),
                ],
              );
            },
          ),
          elevation: 0.0,
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
    int index = widget.searchProducts.indexOf(product);
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
                            widget.searchProducts[index].quantity++;
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
                '${widget.searchProducts[index].quantity}'.seRagham(),
                style: const TextStyle(fontFamily: IranSansWeb, fontSize: 24),
              ),
              SizedBox(
                width: 36,
                height: 36,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                          () {
                        if (widget.searchProducts[index].quantity > 0) {
                          widget.searchProducts[index].quantity--;
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
