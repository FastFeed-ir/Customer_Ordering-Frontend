import 'dart:convert';

import 'package:customer_ordering_frontend/view_model/product_information_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/entity/comment.dart';
import '../../utils/constants.dart';
import '../store_profile/components/profile_app_bar.dart';
import 'components/comment_section.dart';

class ProductInformation extends StatefulWidget {
  final product = Get.arguments;

  ProductInformation({super.key});

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  final _viewModel = ProductInformationViewModel();
  var _gotFromServer = false;
  final List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    _viewModel.getComments(widget.product.id!);
    _viewModel.comments.stream.listen((commentsList) {
      setState(() {
        comments.addAll(commentsList);
        _gotFromServer = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
          child: AppBar(
            backgroundColor: RedColor,
            automaticallyImplyLeading: false,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final double availableWidth = constraints.maxWidth;
                final double availableHeight = constraints.maxHeight;

                final double logoHeight = availableHeight * 0.7;
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
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      right: availableWidth * 0.10,
                      top: availableHeight * 0.72,
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: backIconSize,
                            color:  WhiteColor),
                      ),
                    ),
                  ],
                );
              },
            ),
            elevation: 0.0,
          ),
        ),
        body: Material(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      productImage(),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.product.title,
                        style: const TextStyle(
                          fontFamily: IranSansWeb,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.product.description ?? '',
                        style: const TextStyle(
                          fontFamily: IranSansWeb,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child:
                      !_gotFromServer ? loading() : commentSection(comments)),
            ],
          ),
        ),
      ),
    );
  }

  Widget loading() {
    return Container(
      padding: EdgeInsets.only(
        left: 16.0.w,
        top: 8.0.h,
        right: 16.0.w,
      ),
      // width: 1920.w,
      // height: 700.h,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 4.0,
          valueColor: AlwaysStoppedAnimation<Color>(RedColor),
        ),
      ),
    );
  }

  Widget productImage() {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: widget.product.image == null
            ? Image.asset(
                EmptyImg,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              )
            : Image.memory(
                base64.decode(widget.product.image!),
                fit: BoxFit.cover,
                width: 200,
                height: 200,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    EmptyImg,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                },
              ),
      ),
    );
  }
}
