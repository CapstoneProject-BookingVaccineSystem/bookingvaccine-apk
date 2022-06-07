import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:ndialog/ndialog.dart';

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
                          value.changeClickContent(false, 0);
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
                                      'Puskesmas Raja Basa Indah',
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
                                            'Jl. Pramuka No. 1 Rajabasa, Lampung, Indonesia',
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
                                                'Sinovac - 100 Buah',
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
                                                '08.00 WIB - Selesai',
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
                                    Container(
                                      height: 40,
                                      width: 280,
                                      padding: const EdgeInsets.only(
                                        left: 20.75,
                                        right: 20.75,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
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
                                                style:
                                                    primaryTextStyle2.copyWith(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          GestureDetector(
                                            onTap: () async {
                                              NAlertDialog(
                                                content: Container(
                                                  height: 200,
                                                  width: 337,
                                                  margin: const EdgeInsets.only(
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
                                                            height: 34,
                                                            width:
                                                                double.infinity,
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              vertical: 8,
                                                              horizontal: 10,
                                                            ),
                                                            color: const Color(
                                                              0xffF7F7F7,
                                                            ),
                                                            child: Text(
                                                              'Daftar Keluarga :',
                                                              style:
                                                                  secondTextStyle
                                                                      .copyWith(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                            ),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 5,
                                                                  top: 10,
                                                                  right: 10,
                                                                  bottom: 10,
                                                                ),
                                                                height: 10,
                                                                width: 10,
                                                                child: Checkbox(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2.0),
                                                                  ),
                                                                  side: MaterialStateBorderSide
                                                                      .resolveWith(
                                                                    (states) => BorderSide(
                                                                        width:
                                                                            1.0,
                                                                        color:
                                                                            greyColor),
                                                                  ),
                                                                  onChanged:
                                                                      (value) {},
                                                                  value: false,
                                                                  focusColor:
                                                                      greyColor,
                                                                ),
                                                              ),
                                                              Text(
                                                                'Indy Ratna Pratiwi',
                                                                style:
                                                                    primaryTextStyle
                                                                        .copyWith(
                                                                  fontSize: 12,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 42,
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: primaryColor2,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Tambahkan',
                                                            style:
                                                                whiteTextStyle
                                                                    .copyWith(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                blur: 2,
                                              ).show(context,
                                                  transitionType:
                                                      DialogTransitionType
                                                          .Bubble);
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
                            onTap: () {},
                            child: Container(
                              height: 51,
                              width: 300,
                              decoration: BoxDecoration(
                                color: value.clickChoose == false
                                    ? primaryColor2
                                    : primaryColor2_1,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Booking Sekarang',
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
                ],
              );
            },
          )),
    );
  }
}
