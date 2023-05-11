import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:customer_ordering_frontend/model/entity/store.dart';
import 'package:customer_ordering_frontend/utils/constants.dart';

import '../../../view_model/store_viewmodel.dart';

// import 'View/PersianText.dart';
// import 'network/responseModel.dart';

class InformationsScreen extends StatefulWidget {
  var Id = 1;
  InformationsScreen({Key? key}) : super(key: key);

  @override
  _InformationsScreenState createState() =>_InformationsScreenState();

}
class _InformationsScreenState extends State<InformationsScreen> {

  final _storeModel = StoreViewModel();
  int? id;
  final List<Store> _stores = [];
  List<String> choicesList = [
    "اطلاعات",
    'نظرات',
  ];
  @override
  initState() {
    super.initState();
    getStore();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    // final specialistProvider = Provider.of<SpecialistProvider>(context);
    Store store = Store(business_owner: 0, title: '', business_type: 0, state: 0, owner_phone_number: '', tables_count: 0, telephone_number: '',address: '',city: '',instagram_page_link: '',logo: '');
    for(var item in _stores) {
      store = item;
    }
    return Scaffold(
      body:_stores.length==0?loading(): SizedBox(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.center,
                      textDirection: TextDirection.rtl,
                      spacing: 4,
                      children: List.generate(choicesList.length, (index) {
                        return ChoiceChip(
                          label: Text(
                            choicesList[index],
                            style: TextStyle(
                                fontFamily: IranSansWeb,
                                fontSize: 13),
                          ),
                          selected: false,
                          // specialistProvider.defaultChoiceIndex ==
                          //     index,
                          selectedColor: Colors.blue,
                          onSelected: ((value) {
                            switch (index) {
                              case 0:
                                // specialistProvider.getAllSurgeon();
                                break;
                              case 1:
                                // specialistProvider.getAllOncologist();
                                break;
                            }
                          }),
                        );
                      }),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                      Text(store.title,style: TextStyle(
                          fontFamily: IranSansWeb,
                          fontSize: 15),),
                  ],
                ),
                Row(
                  children: [
                    Text(Proviences[store.state],style: TextStyle(
                        fontFamily: IranSansWeb,
                        fontSize: 10),),
                  ],
                ),

                // Consumer<SpecialistProvider>(
                //   builder: (context, value, child) {
                //     switch (value.state.status) {
                //       case Status.LOADING:
                //         value.thisList.clear();
                //         return Center(
                //           child: CircularProgressIndicator(color: Colors.blue),
                //         );
                //
                //       case Status.COMPLETED:
                //         if (value.thisList.isNotEmpty) {
                //           List<Specialist> specialList = value.thisList;
                //           return ListView.builder(
                //               physics: const NeverScrollableScrollPhysics(),
                //               scrollDirection: Axis.vertical,
                //               shrinkWrap: true,
                //               itemBuilder: (context, index) {
                //                 return SpecialistItem(
                //                     specialistModel: specialList[index]);
                //               },
                //               itemCount: specialList.length);
                //         } else {
                //           return Center(
                //             child: Text(
                //               "داده ای برای نمایش وجود ندارد!",
                //             ),
                //           );
                //         }
                //       case Status.ERROR:
                //         value.thisList.clear();
                //         return Text(value.state.message);
                //       default:
                //         return Container();
                //     }
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void getStore() {
    _storeModel.getStores(widget.Id);
    _storeModel.stores.stream.listen((list) {
      setState(() {
        _stores.addAll(list);
      });
    });
  }
}
