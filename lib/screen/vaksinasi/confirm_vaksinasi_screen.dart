import 'dart:async';

import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ConfirmVaksinasiScreen extends StatelessWidget {
  const ConfirmVaksinasiScreen({Key? key}) : super(key: key);

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
                          'Konfimasi Jadwal Vaksinasi',
                          style: secondTextStyle.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          'Perhatikan setiap detail informasi fasilitas kesehatan yang akan dipilih. Pastikan segala informasi pribadi juga tepat untuk pendaftaran vaksinasi.',
                          style: primaryTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(
                          left: 19,
                          right: 19,
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                            bottom: 10,
                          ),
                          padding: const EdgeInsets.only(
                            bottom: 15,
                          ),
                          decoration: BoxDecoration(
                            color: whiteColor,
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
                              Container(
                                height: 250,
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          'https://picsum.photos/200/300?grayscale'),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  top: 19.5,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      value
                                          .detailDataSession
                                          .healthFacilitiesDaoMapped
                                          .healthFacilitiesName,
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
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
                                                .detailDataSession
                                                .healthFacilitiesDaoMapped
                                                .addressHealthFacilities,
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'No. Telp',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle2.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                value
                                                    .detailDataSession
                                                    .healthFacilitiesDaoMapped
                                                    .phoneFacilities,
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
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
                                          'assets/type_of_vaksin.svg',
                                          width: 13,
                                          height: 13,
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jenis Vaksin dan Stok :',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle2.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${value.detailDataSession.vaccineMapped.vaccineName} - ${value.detailDataSession.stock} Buah',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
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
                                          'assets/type_of_vaksin.svg',
                                          width: 13,
                                          height: 13,
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Jenis Vaksin dan Stok :',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle2.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${value.detailDataSession.vaccineMapped.vaccineName} - ${value.detailDataSession.stock} Buah',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
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
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Tersedia pada Sesi : ',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle2.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              Text(
                                                '${value.detailDataSession.startTime} - Selesai',
                                                overflow: TextOverflow.ellipsis,
                                                style:
                                                    primaryTextStyle.copyWith(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    if (value.famillyName == null) ...{
                                      Container(
                                        height: 40,
                                        width: 280,
                                        padding: const EdgeInsets.only(
                                          left: 20.75,
                                          right: 20.75,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                            width: 1,
                                            color: primaryColor2,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/familly_blue.svg',
                                                  width: 16.5,
                                                  height: 10.5,
                                                ),
                                                const SizedBox(
                                                  width: 10.75,
                                                ),
                                                Text(
                                                  'Keluarga ',
                                                  style: primaryTextStyle2
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return Consumer<
                                                              VaksinasiViewModel>(
                                                          builder: (context,
                                                              paramValueModel,
                                                              child) {
                                                        return AlertDialog(
                                                          actionsPadding:
                                                              EdgeInsets.zero,
                                                          buttonPadding:
                                                              EdgeInsets.zero,
                                                          content: Container(
                                                            height: 200,
                                                            width: 337,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                              top: 10,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      height:
                                                                          34,
                                                                      width: double
                                                                          .infinity,
                                                                      padding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        vertical:
                                                                            8,
                                                                        horizontal:
                                                                            10,
                                                                      ),
                                                                      color:
                                                                          const Color(
                                                                        0xffF7F7F7,
                                                                      ),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Daftar Keluarga :',
                                                                            style:
                                                                                secondTextStyle.copyWith(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              'assets/cancel_x.svg',
                                                                              width: 20,
                                                                              height: 20,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          100,
                                                                      child: ListView
                                                                          .builder(
                                                                        itemCount: paramValueModel
                                                                            .allDataFamillyByUserId
                                                                            .length,
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        itemBuilder:
                                                                            (context,
                                                                                index) {
                                                                          return Row(
                                                                            children: [
                                                                              Container(
                                                                                margin: const EdgeInsets.only(
                                                                                  left: 5,
                                                                                  top: 10,
                                                                                  right: 10,
                                                                                  bottom: 10,
                                                                                ),
                                                                                height: 10,
                                                                                width: 10,
                                                                                child: Checkbox(
                                                                                  shape: RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                  ),
                                                                                  side: MaterialStateBorderSide.resolveWith(
                                                                                    (states) => BorderSide(width: 1.0, color: greyColor),
                                                                                  ),
                                                                                  onChanged: (paramValue) {
                                                                                    paramValueModel.changeClickBox(paramValue!, index, paramValueModel.allDataFamillyByUserId[index].idFamily, paramValueModel.allDataFamillyByUserId[index].fullName);
                                                                                  },
                                                                                  value: paramValueModel.isChecked[index],
                                                                                  focusColor: greyColor,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                paramValueModel.allDataFamillyByUserId[index].fullName,
                                                                                style: primaryTextStyle.copyWith(
                                                                                  fontSize: 12,
                                                                                ),
                                                                              )
                                                                            ],
                                                                          );
                                                                        },
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    paramValueModel
                                                                        .changeFamillyName(
                                                                            paramValueModel.famillyNameC);
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    height: 42,
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: paramValueModel.clickAdd ==
                                                                              false
                                                                          ? primaryColor2
                                                                          : primaryColor2,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Tambahkan',
                                                                        style: secondTextStyle
                                                                            .copyWith(
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                    });
                                              },
                                              child: SvgPicture.asset(
                                                'assets/plus_blue.svg',
                                                width: 11.67,
                                                height: 11.67,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    },
                                    if (value.famillyName != null) ...{
                                      Container(
                                        height: 40,
                                        width: 285,
                                        padding: const EdgeInsets.only(
                                          left: 20.75,
                                          right: 20.75,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(5),
                                          ),
                                          color: primaryColor2,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/familly.svg',
                                                  width: 16.5,
                                                  height: 10.5,
                                                  color: secondColor,
                                                ),
                                                const SizedBox(
                                                  width: 10.75,
                                                ),
                                                Text(
                                                  'Keluarga ',
                                                  style:
                                                      secondTextStyle.copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: SvgPicture.asset(
                                                'assets/plus.svg',
                                                width: 9.31,
                                                height: 10,
                                                color: secondColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 285,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: primaryColor2,
                                              width: 2,
                                            ),
                                            borderRadius:
                                                const BorderRadius.only(
                                              bottomLeft: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        padding: const EdgeInsets.only(
                                            top: 20, bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        actionsPadding:
                                                            EdgeInsets.zero,
                                                        buttonPadding:
                                                            EdgeInsets.zero,
                                                        actions: [
                                                          Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          53,
                                                                      color: const Color(
                                                                          0xffF7F7F7),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Kembali',
                                                                          style:
                                                                              secondTextStyle.copyWith(
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap:
                                                                        () async {
                                                                      value.deleteFamilly(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          53,
                                                                      color:
                                                                          primaryColor2,
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Konfirmasi',
                                                                          style:
                                                                              secondTextStyle.copyWith(fontSize: 14),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ])
                                                        ],
                                                        content: Container(
                                                          height: 185,
                                                          width: 337,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Batal Tambah Anggota Keluarga?',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    secondTextStyle
                                                                        .copyWith(
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40,
                                                color: const Color(0xffF7F7F7),
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      value.famillyName ?? '',
                                                      style: secondTextStyle
                                                          .copyWith(
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                    SvgPicture.asset(
                                                      'assets/minus.svg',
                                                      width: 3,
                                                      height: 2,
                                                      color: secondColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    },
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    Text(
                                      'Tata Cara Pendaftaran',
                                      style: primaryTextStyle2.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Datang ke tempat vaksin sesuai jadwal yang ditentukan',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '2.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Konfirmasi telah booking dengan menunjukan bukti booking pada aplikasi',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '3.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Mengisi kertas form yang berisi data diri.',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '4.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Menunggu antrian',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Sebelum datang ke Puskesmas',
                                      style: primaryTextStyle2.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Tidur yang cukup',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '2.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Makan sebelum berangkat',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '3.',
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 9.41,
                                        ),
                                        Flexible(
                                          child: Text(
                                            'Bawa Berkas pendukung (KTP & Kartu Keluarga)',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              value.changeClickBookingNow(true);
                              value.bookingNow(
                                  value.idFamilly.toString(),
                                  value.detailDataSession.idSession.toString(),
                                  8.toString(),
                                  context);

                              Timer(const Duration(milliseconds: 200), () {
                                value.changeClickBookingNow(false);
                              });
                            },
                            child: Container(
                              height: 51,
                              width: 300,
                              decoration: BoxDecoration(
                                color: value.clickBookingNow == false
                                    ? primaryColor2
                                    : primaryColor2_1,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Booking Sekarang',
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
                ],
              );
            },
          )),
    );
  }
}
