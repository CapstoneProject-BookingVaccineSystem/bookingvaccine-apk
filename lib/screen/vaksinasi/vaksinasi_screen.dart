import 'dart:async';

import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class VaksinasiScreen extends StatelessWidget {
  const VaksinasiScreen({Key? key}) : super(key: key);

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
                          value.changeClickContent(false, 0);
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
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
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
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 25.67,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 10,
                                  ),
                                  width: double.infinity,
                                  child: Text(
                                    'Rajabasa, Lampung',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        int countIndex = index + 1;
                        return GestureDetector(
                          onTap: () {
                            value.changeClickContent(true, countIndex);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 19,
                              right: 19,
                              top: 15,
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
                                    'Puskesmas Raja Basa Indah',
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
                                          'Jl. Pramuka No. 1 Rajabasa, Lampung, Indonesia',
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
                                          '0891234567890',
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
                                          '08.00 - Selesai',
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
                                            text: 'Sinovac - 100 Buah',
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
                                value.changeClickContent(false, 0);
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
                                    style: primaryTextStyle2.copyWith(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                value.changeClickChoose(true);
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
                                    style: whiteTextStyle.copyWith(
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
