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
        appBar: profileAppBar(context),
        body: Material(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 320.0,
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
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.product.description ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.centerRight,
                child: const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    'نظر کاربران',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                height: 2,
                color: Colors.black,
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
