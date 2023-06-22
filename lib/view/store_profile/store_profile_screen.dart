import 'package:customer_ordering_frontend/utils/constants.dart';
import 'package:customer_ordering_frontend/view/store_profile/components/profile_app_bar.dart';
import 'package:customer_ordering_frontend/view_model/store_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../model/entity/comment.dart';
import 'components/comment_section.dart';
import 'components/information_section.dart';

class StoreProfile extends StatefulWidget {
  final storeId = Get.arguments;

  StoreProfile({super.key});

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
  String noData = '';
  late int storeId;
  @override
  void initState() {
    storeId = widget.storeId;
    loadData();
    super.initState();
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
    return SafeArea(
      child: Scaffold(
        appBar:PreferredSize(
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
                              fontWeight: FontWeight.bold,
                              fontFamily: IranSansWeb,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'نظرات',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: IranSansWeb,
                              fontSize: 16,
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
                            ? loading(54)
                            : informationSection(
                                title,
                                city,
                                address,
                                telephoneNumber,
                                instagramPageLink,
                              ),
                        !_gotFromServerComments
                            ? loading(54)
                            : commentSection(_commentsAndOrders),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
