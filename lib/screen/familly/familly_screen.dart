import 'dart:async';

import 'package:bookingvaccine/screen/familly/familly_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:provider/provider.dart';

class FamillyScreen extends StatefulWidget {
  const FamillyScreen({Key? key}) : super(key: key);

  @override
  State<FamillyScreen> createState() => _FamillyScreenState();
}

class _FamillyScreenState extends State<FamillyScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<FamillyViewModel>(context, listen: false);
      await _viewModel.getDataFamillyByUserId(8);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  'assets/arrow_left.svg',
                  width: 16.23,
                  height: 15.81,
                ),
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.only(top: 15),
              ),
            ),
            elevation: 0,
            backgroundColor: whiteColor,
          ),
        ),
        body: Consumer<FamillyViewModel>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
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
                        'Tambahkan Anggota Keluarga',
                        style: primaryTextStyle2.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Tambahkan anggota keluarga untuk mempermudah pendaftaran vaksinasi keluarga anda.',
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                        ),
                      ),
                      if (value.dataFamillyByUserId.isEmpty) ...{
                        const SizedBox(
                          height: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            value.changeClickAdd(true);
                            Navigator.pushNamed(context, '/add-familly');
                            Timer(
                              const Duration(milliseconds: 200),
                              () {
                                value.changeClickAdd(false);
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 18,
                              right: 18,
                              top: 12,
                            ),
                            height: 42,
                            decoration: BoxDecoration(
                              color: value.clickAdd == true
                                  ? primaryColor2_1
                                  : primaryColor2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Tambahkan',
                                style: secondTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Anda hanya bisa menambahkan sampai 8 anggota keluarga',
                          style: primaryTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      }
                    ],
                  ),
                ),
                Column(
                  children: [
                    LimitedBox(
                      maxHeight: 450,
                      child: ListView.builder(
                        itemCount: value.dataFamillyByUserId.length,
                        itemBuilder: (context, index) {
                          int countFamilly = index + 1;

                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  left: 19,
                                  right: 19,
                                  top: 16,
                                ),
                                child: ExpansionWidget(
                                  initiallyExpanded: false,
                                  titleBuilder: (double animationValue, _,
                                      bool isExpaned, toogleFunction) {
                                    if (value.isExpaned == true &&
                                        value.indexForm == countFamilly) {
                                      return InkWell(
                                        onTap: () {
                                          toogleFunction(animated: true);
                                          value.changeisExpaned(
                                              true, countFamilly);
                                        },
                                        child: Container(
                                          height: 40,
                                          padding: const EdgeInsets.only(
                                            left: 20.75,
                                            right: 20.75,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
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
                                                  ),
                                                  const SizedBox(
                                                    width: 10.75,
                                                  ),
                                                  Text(
                                                    'Keluarga $countFamilly',
                                                    style:
                                                        whiteTextStyle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                'assets/up.svg',
                                                width: 9.31,
                                                height: 5.49,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }

                                    return InkWell(
                                      onTap: () {
                                        toogleFunction(animated: true);
                                        value.changeisExpaned(
                                            false, countFamilly);
                                      },
                                      child: Container(
                                        height: 40,
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
                                                  'Keluarga $countFamilly',
                                                  style: primaryTextStyle2
                                                      .copyWith(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SvgPicture.asset(
                                              'assets/plus_blue.svg',
                                              width: 11.67,
                                              height: 11.67,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  content: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: primaryColor2,
                                          width: 2,
                                        ),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        )),
                                    padding: const EdgeInsets.all(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'NIK',
                                          style: primaryTextStyle2.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          value.dataFamillyByUserId[index].nik,
                                          style: secondTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Nama Lengkap',
                                          style: primaryTextStyle2.copyWith(
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          value.dataFamillyByUserId[index]
                                              .fullName,
                                          style: secondTextStyle.copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                                      await value.deletDataFamillyById(
                                                                          value
                                                                              .dataFamillyByUserId[index]
                                                                              .idFamily,
                                                                          index);

                                                                      Navigator.pop(
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
                                                                'Apakah anda yakin?',
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
                                                              const SizedBox(
                                                                height: 20,
                                                              ),
                                                              Text(
                                                                'Data yang diubah tidak akan tersimpan.',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style:
                                                                    secondTextStyle
                                                                        .copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    });
                                              },
                                              child: Container(
                                                height: 42,
                                                width: 138,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Hapus',
                                                    style:
                                                        redTextStyle.copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                value.changeClickChange(true);
                                                Navigator.pushNamed(
                                                    context, '/edit-familly');

                                                value.getDataFamillyById(value
                                                    .dataFamillyByUserId[index]
                                                    .idFamily);
                                                Timer(
                                                  const Duration(
                                                      milliseconds: 200),
                                                  () {
                                                    value.changeClickChange(
                                                        false);
                                                  },
                                                );
                                              },
                                              child: Container(
                                                height: 42,
                                                width: 138,
                                                decoration: BoxDecoration(
                                                  color:
                                                      value.clickChange == true
                                                          ? primaryColor2_1
                                                          : primaryColor2,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    'Ubah',
                                                    style: secondTextStyle
                                                        .copyWith(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              if (countFamilly ==
                                      value.dataFamillyByUserId.length &&
                                  value.dataFamillyByUserId.length < 8) ...{
                                GestureDetector(
                                  onTap: () {
                                    value.changeClickAdd(true);
                                    Navigator.pushNamed(
                                        context, '/add-familly');
                                    Timer(
                                      const Duration(milliseconds: 200),
                                      () {
                                        value.changeClickAdd(false);
                                      },
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      left: 18,
                                      right: 18,
                                      top: 12,
                                    ),
                                    height: 42,
                                    decoration: BoxDecoration(
                                      color: value.clickAdd == true
                                          ? primaryColor2_1
                                          : primaryColor2,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Tambahkan',
                                        style: secondTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Anda hanya bisa menambahkan sampai 8 anggota keluarga',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              }
                            ],
                          );
                        },
                      ),
                    ),
                    if (value.dataFamillyByUserId.length >= 8) ...{
                      Container(
                        margin: const EdgeInsets.only(
                          left: 18,
                          right: 18,
                          top: 12,
                        ),
                        height: 42,
                        decoration: BoxDecoration(
                          color: const Color(0xffD9D9D9),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Tambahkan',
                            style: secondTextStyle.copyWith(
                                fontSize: 12, color: const Color(0xff8E8B8B)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Anda hanya bisa menambahkan sampai 8 anggota keluarga',
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    }
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
