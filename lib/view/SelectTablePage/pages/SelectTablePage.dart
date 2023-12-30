import 'package:customer_ordering_frontend/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/constants.dart';
import '../../authPage/components/CommentVerifyWidget.dart';

class SelectTableScreen extends StatefulWidget {
  final bool argument; // Add the argument variable

  const SelectTableScreen({Key? key, required this.argument}) : super(key: key);

  @override
  _SelectTableScreenState createState() => _SelectTableScreenState();
}

class _SelectTableScreenState extends State<SelectTableScreen> {
  late SharedPreferences prefs;
  int numberOfOptions = 0;
  String dropdownValue = 'میز 1';
  Future<void> x() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      numberOfOptions = prefs.getInt("tableCount")!;
    });
  }

  int selectedIndex = 0;
  @override
  initState() {
    super.initState();
    x();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
    List<String> options = List.generate(
      numberOfOptions,
      (index) => 'میز ${index + 1}',
    );
    final _unfocusNode = FocusNode();
   var _orderViewModel= OrderViewModel();
    return GestureDetector(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setHeight(137)),
          child: AppBar(
            backgroundColor: widget.argument ? YellowColor : RedColor,
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
                              widget.argument ? BlackLogo : WhiteLogo,
                              height: logoHeight,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: availableHeight * 0.05),
                            Text(
                              'انتخاب میز',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    widget.argument ? BlackColor : WhiteColor,
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
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back_ios,
                            size: backIconSize,
                            color: widget.argument ? BlackColor : WhiteColor),
                      ),
                    ),
                  ],
                );
              },
            ),
            elevation: 0.0,
          ),
        ),
        body: numberOfOptions == 0
            ? loading(ScreenUtil().setSp(56))
            : SingleChildScrollView(
              child: SafeArea(
                  top: true,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                          child: Text(
                            'انتخاب میز',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: BlackColor,
                              fontWeight: FontWeight.bold,
                              fontFamily: IranSansWeb,
                              fontSize: ScreenUtil().setSp(24),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: ScreenUtil().setHeight(20)),
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                                selectedIndex =
                                    options.indexOf(dropdownValue) + 1;
                              });
                            },
                            items: options.map((String option) {
                              return DropdownMenuItem<String>(
                                value: option,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(option),
                                ),
                              );
                            }).toList(),
                            style: TextStyle(
                              color: BlackColor,
                              fontFamily: IranSansWeb,
                              fontSize: ScreenUtil().setSp(20),
                            ),
                            hint: Text(
                              'میز 1',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: ScreenUtil().setSp(20),
                              ),
                            ),
                            underline: Container(),
                            dropdownColor: WhiteColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0, ScreenUtil().setHeight(20), 0, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            prefs.setInt("table", selectedIndex);
                            var storeId = prefs.getInt('StorId');
                            if (widget.argument) {
                              await _orderViewModel.getLastOrder(storeId!, selectedIndex);
                              prefs.setInt("lastOrderId",_orderViewModel.lastOrderId );
                              var authCode=_orderViewModel.lastOrder.authCode!;
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return GestureDetector(
                                    onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
                                    child: Dialog(
                                      insetPadding: MediaQuery.of(dialogContext).viewInsets,
                                      child: SizedBox(
                                        height: 280,
                                        width: 270,
                                        child: CommentVerifyWidget(authCode: authCode),
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => setState(() {}));
                            } else {
                              Get.toNamed(MainMenuPage, arguments: storeId);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(ScreenUtil().setWidth(145),
                                ScreenUtil().setHeight(45)),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor:
                                widget.argument ? YellowColor : RedColor,
                          ),
                          child: Text(
                            'تایید',
                            style: TextStyle(
                              color: widget.argument ? BlackColor : WhiteColor,
                              fontFamily: IranSansWeb,
                              fontSize: ScreenUtil().setSp(20),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0, ScreenUtil().setHeight(56), 0, 0),
                          child: Image.asset(
                            FastfeedLogo,
                            height: ScreenUtil().setHeight(200),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
      ),
    );
  }
}
