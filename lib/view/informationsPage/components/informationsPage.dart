import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer_ordering_frontend/model/entity/store.dart';
// import 'package:customer_ordering_frontend/utils/constants.dart';

// import 'View/PersianText.dart';
// import 'network/responseModel.dart';

class SpecialistScreen extends StatelessWidget {
  SpecialistScreen({super.key});

  List<String> choicesList = [
    "اطلاعات",
    'نظرات',
  ];

  @override
  Widget build(BuildContext context) {
    // final specialistProvider = Provider.of<SpecialistProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            )),
        centerTitle: true,
        elevation: 5,
        title: Text(
          "",
          style: TextStyle(
            // fontFamily: IranSansWeb,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black54,
          ),
        ),
      ),
      body: SizedBox(
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
                                // fontFamily: IranSansWeb,
                                fontSize: 13),
                          ),
                          selected: true,
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
}
