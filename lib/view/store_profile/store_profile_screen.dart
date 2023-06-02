import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/profile_app_bar.dart';
import 'package:customer_ordering_frontend/view_model/store_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/entity/comment.dart';
import 'components/comment_section.dart';
import 'components/information_section.dart';

class StoreProfile extends StatefulWidget {
  const StoreProfile({super.key, required this.storeId});

  final int storeId;

  @override
  State<StoreProfile> createState() => _StoreProfileState();
}

class _StoreProfileState extends State<StoreProfile> {
  final _viewModel = StoreProfileViewModel();
  final Map<Comment, List<String>> _commentsAndOrders = {};
  var _gotFromServerStore = false;
  var _gotFromServerComments = false;
  String title = '';
  String city = '';
  String address = '';
  String telephoneNumber = '';
  String instagramPageLink = '';
  String noData = 'بدون اطلاعات';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    _viewModel.getStore(widget.storeId).asStream().listen((store) {
      setState(() {
        title = store.title ?? '';
        city = store.city ?? '';
        address = store.address ?? '';
        telephoneNumber = store.telephone_number ?? '';
        instagramPageLink = store.instagram_page_link ?? '';
        if (title == '') {
          title = noData;
        }
        if (city == '') {
          city = noData;
        }
        if (address == '') {
          address = noData;
        }
        if (telephoneNumber == '') {
          telephoneNumber = noData;
        }
        if (instagramPageLink == '') {
          instagramPageLink = noData;
        }
        _gotFromServerStore = true;
      });
    });
    _viewModel.getComments(widget.storeId);
    _viewModel.comments.stream.listen((commentsList) {
      for (var comment in commentsList) {
        _viewModel.getOrdersNamesOfComment(comment.orderId);
        _viewModel.ordersNames.stream.listen((orderNamesList) {
          setState(() {
            _commentsAndOrders.addAll({comment: orderNamesList});
          });
        });
      }
      setState(() {
        _gotFromServerComments = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar(context),
      body: Material(
        child: DefaultTabController(
          length: 2,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  color: RedColor,
                  padding: const EdgeInsets.all(16.0),
                  child: TabBar(
                    tabs: const [
                      Tab(
                        child: Text(
                          'اطلاعات',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'نظرات',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(32.0),
                      color: Colors.white,
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      !_gotFromServerStore
                          ? loading()
                          : informationSection(
                              title,
                              city,
                              address,
                              telephoneNumber,
                              instagramPageLink,
                            ),
                      !_gotFromServerComments
                          ? loading()
                          : commentSection(_commentsAndOrders),
                    ],
                  ),
                ),
              ],
            ),
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
}
