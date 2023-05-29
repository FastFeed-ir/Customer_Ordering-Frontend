import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants.dart';

class SelectTableScreen extends StatefulWidget {
  const SelectTableScreen({Key? key}) : super(key: key);

  @override
  _SelectTableScreenState createState() => _SelectTableScreenState();
}

class _SelectTableScreenState extends State<SelectTableScreen> {
  int numberOfOptions = 12;
  //TODO
  String dropdownValue = 'میز شماره 1';
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 800));
     List<String> options = List.generate(
      numberOfOptions,
      (index) => 'میز شماره ${index + 1}',
    );

    return GestureDetector(
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
                              'انتخاب میز',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: WhiteColor,
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
                          // TODO: Handle back button tap
                        },
                        child: Icon(Icons.arrow_back_ios, size: backIconSize,color: WhiteColor,),
                      ),
                    ),
                  ],
                );
              },
            ),
            elevation: 0.0,
          )),
        body: SafeArea(
           top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Text(
                    'انتخاب میز',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    color: BlackColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: IranSansWeb,
                    fontSize: ScreenUtil().setSp(28),
                  ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setHeight(42)),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
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
                    hint:  Text(
                      'میز شماره 1',
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
                padding:  EdgeInsetsDirectional.fromSTEB(0, ScreenUtil().setHeight(56), 0, 0),
                child: ElevatedButton(
                  onPressed: () {
                    //TODO
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(ScreenUtil().setWidth(145), ScreenUtil().setHeight(45)),
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: YellowColor,
                  ),
                  child: Text(
                    'تایید',
                    style: TextStyle(
                      color: BlackColor,
                      fontFamily: IranSansWeb,
                      fontSize: ScreenUtil().setSp(20),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding:  EdgeInsetsDirectional.fromSTEB(0, ScreenUtil().setHeight(56), 0, 0),
                  child: Image.asset(
                    FastfeedLogo,
                    height: ScreenUtil().setHeight(240),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
