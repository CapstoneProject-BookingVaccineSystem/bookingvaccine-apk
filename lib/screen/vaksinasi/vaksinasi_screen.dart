import 'dart:async';

import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class VaksinasiScreen extends StatefulWidget {
  const VaksinasiScreen({Key? key}) : super(key: key);

  @override
  State<VaksinasiScreen> createState() => _VaksinasiScreenState();
}

class _VaksinasiScreenState extends State<VaksinasiScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<VaksinasiViewModel>(context, listen: false);
      await _viewModel.getAllDataArea();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(75),
              child: Consumer<VaksinasiViewModel>(
                builder: (context, value, child) {
                  return AppBar(
                    leading: Builder(
                      builder: (context) => IconButton(
                        icon: SvgPicture.asset(
                          'assets/arrow_left.svg',
                          width: 16.23,
                          height: 15.81,
                        ),
                        onPressed: () {
                          value.changeClickContent(false, 0, 0);
                          value.changeClickKelurahan(false);
                          Navigator.pop(context);
                        },
                        padding: const EdgeInsets.only(top: 15),
                      ),
                    ),
                    elevation: 0,
                    backgroundColor: whiteColor,
                  );
                },
              )),
          body: Consumer<VaksinasiViewModel>(
            builder: (context, value, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 19,
                      right: 19,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Jadwal Vaksinasi ',
                          style: primaryTextStyle2.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Dengan mudah, aman dan terpercaya',
                          style: primaryTextStyle.copyWith(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Masukkan Kelurahan terdekat Anda',
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          readOnly: true,
                          onTap: () {
                            value.changeClickKelurahan(true);
                          },
                          style: const TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            suffixIcon: SvgPicture.asset(
                              'assets/downward.svg',
                              width: 13.75,
                              height: 9.38,
                              fit: BoxFit.scaleDown,
                            ),
                            hintText: 'Masukkan Nama Kelurahan, Kota/Kabupaten',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding:
                                const EdgeInsets.fromLTRB(20, 10, 10, 0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 2.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        if (value.clickKelurahan == true) ...{
                          const SizedBox(
                            height: 10,
                          ),
                          DelayedDisplay(
                            delay: const Duration(microseconds: 250),
                            slidingCurve: Curves.easeInOut,
                            slidingBeginOffset: const Offset(0.0, -0.3),
                            child: Container(
                              height: 105,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 80,
                                    child: ListView.builder(
                                      itemCount: value.dataArea.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            value.getDataSessionByAreaId(
                                                value.dataArea[index].idArea);
                                          },
                                          child: Container(
                                            height: 25.67,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 5,
                                              horizontal: 10,
                                            ),
                                            width: double.infinity,
                                            child: Text(
                                              value.dataArea[index].areaName,
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        },
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.dataSessionByAreaId.length,
                      itemBuilder: (context, index) {
                        int countIndex = index + 1;
                        return GestureDetector(
                          onTap: () {
                            value.changeClickContent(true, countIndex,
                                value.dataSessionByAreaId[index].idSession);
                          },
                          child: DelayedDisplay(
                            delay: const Duration(microseconds: 250),
                            slidingCurve: Curves.easeInOut,
                            slidingBeginOffset: const Offset(0.0, -0.3),
                            child: Container(
                              padding: const EdgeInsets.only(
                                left: 19,
                                right: 19,
                                top: 4,
                              ),
                              child: Container(
                                height: 156,
                                width: double.infinity,
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 19.5,
                                ),
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(
                                    color: value.indexContent == countIndex
                                        ? primaryColor2
                                        : Colors.white,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      value
                                          .dataSessionByAreaId[index]
                                          .healthFacilitiesDaoMapped
                                          .healthFacilitiesName,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 9.48,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/street.svg',
                                          width: 13,
                                          height: 13,
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            value
                                                .dataSessionByAreaId[index]
                                                .healthFacilitiesDaoMapped
                                                .addressHealthFacilities,
                                            overflow: TextOverflow.ellipsis,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/telphone.svg',
                                          width: 13,
                                          height: 13,
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            value
                                                .dataSessionByAreaId[index]
                                                .healthFacilitiesDaoMapped
                                                .phoneFacilities,
                                            overflow: TextOverflow.ellipsis,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/clock.svg',
                                          width: 13,
                                          height: 13,
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            '${value.dataSessionByAreaId[index].startTime.substring(0, 5)} - Selesai',
                                            overflow: TextOverflow.ellipsis,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 9,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'Stok Vaksin : ',
                                        style: primaryTextStyle2.copyWith(
                                            fontSize: 10),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:
                                                  '${value.dataSessionByAreaId[index].vaccineMapped.vaccineName} - ${value.dataSessionByAreaId[index].stock} Buah',
                                              style: primaryTextStyle.copyWith(
                                                fontSize: 10,
                                              )),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (value.clickContent == true) ...{
                    DelayedDisplay(
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 1), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                value.changeClickContent(false, 0, 0);
                              },
                              child: Container(
                                height: 51,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Batal',
                                    style: secondTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                value.changeClickChoose(true);
                                await value
                                    .getDetailDataSessionById(value.idContent);
                                Navigator.pushNamed(
                                    context, '/vaksinasi-confirm');

                                Timer(
                                  const Duration(milliseconds: 200),
                                  () {
                                    value.changeClickChoose(false);
                                  },
                                );
                              },
                              child: Container(
                                height: 51,
                                width: 163,
                                decoration: BoxDecoration(
                                  color: value.clickChoose == false
                                      ? primaryColor2
                                      : primaryColor2_1,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    'Pilih',
                                    style: secondTextStyle.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  }
                ],
              );
            },
          )),
    );
  }
}
