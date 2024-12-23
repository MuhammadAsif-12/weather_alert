import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_home_screen/constant/common/colors.dart';
import 'package:weather_home_screen/constant/common/marquee_text.dart';
import 'package:weather_home_screen/features/home_page/domain/entities/location_entity.dart';
import 'package:weather_home_screen/constant/common/texts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_home_screen/config/asset_utility.dart';


class MainCard extends StatefulWidget {
  EntityLocation? locationObj;
  Function onNeedLocationEnabled;
  bool isLocationEnabled;

  MainCard(
      {super.key,
      required this.locationObj,
      required this.isLocationEnabled,
      required this.onNeedLocationEnabled});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return RepaintBoundary(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.isLocationEnabled
                          ? SvgPicture.asset(
                              getAsset(name: "ic_enable_loc.svg"),
                              height: 17,
                              width: 17)
                          : InkResponse(
                              onTap: () async {
                                widget.onNeedLocationEnabled.call();
                              },
                              splashColor: Colors.grey.shade300,
                              highlightShape: BoxShape.circle,
                              radius: 14.0,
                              child: Container(
                                width: 30,
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        getAsset(name: "ic_disable_loc.svg"),
                                        height: 17,
                                        width: 17),
                                  ],
                                ),
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          height: 20,
                          width: screenWidth * 0.53,
                          child: MarqueeText(
                            color: darkGrey,
                            text: widget.locationObj?.locAddress ?? "",
                            thresholdWidth: screenWidth * 0.53,
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // just for aligning it to main card
                      SvgPicture.asset(getAsset(name: "ic_enable_loc.svg"),
                          color: Colors.white, height: 17, width: 17),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: PrimaryText(
                          text: widget.locationObj?.locationTitle ?? "",
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.normal,
                          size: 14,
                          textColor: textColorB4,
                        ),
                      ),
                    ],
                  ),
            
                  SizedBox(
                    height: 2,
                    child: Divider(
                      height: 1,
                      color: separatorColor,
                    ),
                  ),
                ]),
          )),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
