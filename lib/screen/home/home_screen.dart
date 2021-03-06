import 'dart:async';
import 'dart:io';
import 'package:bookingvaccine/component/loading_screen.dart';
import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/screen/home/home_view_model.dart';
import 'package:bookingvaccine/screen/news/news_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profil/profil_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<HomeViewModel>(context, listen: false);
      await _viewModel.getDataHome();
      await Jiffy.locale("id");
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget exclusiveTitle() {
      return Container(
        padding: const EdgeInsets.only(
          left: 18,
          top: 20,
          right: 18,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Eksklusif hanya untuk Anda!',
              style: primaryTextStyle2.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Ketahui berbagai fakta menarik tentang vaksin Covid-19 ',
              style: primaryTextStyle.copyWith(
                fontSize: 10,
              ),
            )
          ],
        ),
      );
    }

    Widget exclusiveContent() {
      return Container(
        padding: const EdgeInsets.only(
          left: 18,
          top: 20,
          right: 18,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 145,
              width: 340,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/symptom.png')),
                              color: Colors.grey,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // color: Colors.black,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF45C2D6),
                          const Color(0xFF45C2D6),
                          const Color(0xFF45C2D6).withOpacity(0.0),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Berbagai Macam Vaksin Covid - 19 yang Digunakan di Indonesia',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/type_of_vaccine'),
                          child: Container(
                            width: 114,
                            height: 32,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Baca Selengkapnya',
                                    style: secondTextStyle2.copyWith(
                                      fontSize: 8,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7.63,
                                  ),
                                  SvgPicture.asset(
                                    'assets/arrow_right.svg',
                                    width: 2.74,
                                    height: 4.65,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 19,
            ),
            SizedBox(
              height: 145,
              width: 340,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/vaksinasi.png')),
                              color: Colors.brown,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    // color: Colors.black,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF45C2D6),
                          const Color(0xFF45C2D6),
                          const Color(0xFF45C2D6).withOpacity(0.0),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            'Cara Pencegahan Virus Covid - 19 dan Gejala yang Wajib Diketahui',
                            style: whiteTextStyle.copyWith(
                              fontSize: 12,
                            ),
                            maxLines: 4,
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/prevention'),
                          child: Container(
                            width: 114,
                            height: 32,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Baca Selengkapnya',
                                    style: secondTextStyle2.copyWith(
                                      fontSize: 8,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 7.63,
                                  ),
                                  SvgPicture.asset(
                                    'assets/arrow_right.svg',
                                    width: 2.74,
                                    height: 4.65,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget newsTitle(HomeViewModel paramValue) {
      return Container(
        padding: const EdgeInsets.only(
          left: 18,
          top: 21.5,
          right: 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Berita Terbaru',
              style: primaryTextStyle2.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GestureDetector(
              onTap: () {
                paramValue.changeClickButtonMore(true);
                Navigator.pushNamed(context, '/list-news');
                Timer(const Duration(milliseconds: 200), () {
                  paramValue.changeClickButtonMore(false);
                });
              },
              child: Container(
                width: 100,
                height: 27,
                decoration: BoxDecoration(
                  color: paramValue.clickButtonMore == true
                      ? primaryColor2_1
                      : primaryColor2,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    'Lebih Banyak',
                    style: whiteTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget newsContent(HomeViewModel paramValue) {
      return Container(
        height: 238,
        margin: const EdgeInsets.only(
          left: 18,
          top: 11.5,
          bottom: 21,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paramValue.dataNews.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
                var _newModel =
                    Provider.of<NewsViewModel>(context, listen: false);

                _newModel.getDetailDataNewsById(
                    paramValue.dataNews[index].idNewsVaccine);

                Navigator.pushNamed(context, '/detail-news');
              },
              child: Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                height: 245,
                width: 208,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: primaryColor2,
                      width: 1,
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                            image: NetworkImage(
                                paramValue.dataNews[index].image ?? ''),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            paramValue.dataNews[index].titleNewsVaccine,
                            style: secondTextStyle2.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/date.svg',
                                width: 6.67,
                                height: 7.33,
                              ),
                              const SizedBox(
                                width: 2.67,
                              ),
                              Text(
                                '${Jiffy(
                                  "2021-5-25",
                                ).MMMMEEEEd} ${Jiffy(
                                  "2021-5-25",
                                ).year} / ${paramValue.dataNews[index].createdAt.toString().substring(11, 16)}',
                                style: secondTextStyle.copyWith(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: const Icon(
                    Icons.menu_rounded,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  padding: const EdgeInsets.only(top: 15),
                ),
              ),
              elevation: 0,
              backgroundColor: backgroundColor1,
              actions: [
                GestureDetector(
                  onTap: () async {
                    var _viewModel =
                        Provider.of<ProfilViewModel>(context, listen: false);
                    await _viewModel.getDataUser();
                    Navigator.pushNamed(context, '/profile');
                  },
                  child:
                      Consumer<HomeViewModel>(builder: (context, value, child) {
                    return Container(
                      margin: const EdgeInsets.only(
                        top: 15,
                        right: 17,
                      ),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: greyColor,
                        image: DecorationImage(
                          image: value.imageProfil != ''
                              ? FileImage(File(value.imageProfil))
                              : const AssetImage(
                                  'assets/default_profil.png',
                                ) as ImageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
          drawer: Drawer(
            child: Container(
              padding: const EdgeInsets.only(
                left: 18,
                top: 26,
                right: 18,
                bottom: 26,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Logo',
                            style: primaryTextStyle2.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/logout.svg',
                              width: 13.73,
                              height: 13.73,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 44.25,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          left: 22.1,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor2_1,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/home.svg',
                              width: 13.8,
                              height: 12.49,
                              color: secondColor,
                            ),
                            const SizedBox(
                              width: 17.1,
                            ),
                            Text(
                              'Beranda',
                              style: secondTextStyle.copyWith(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var _viewModel = Provider.of<ProfilViewModel>(context,
                              listen: false);
                          await _viewModel.getDataUser();
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Container(
                          height: 44.25,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/profil.svg',
                                width: 15,
                                height: 15,
                                color: secondColor,
                              ),
                              const SizedBox(
                                width: 17.1,
                              ),
                              Text(
                                'Profil',
                                style: secondTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/familly');
                        },
                        child: Container(
                          height: 44.25,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 20.5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/familly.svg',
                                width: 16.5,
                                height: 10.5,
                                color: secondColor,
                              ),
                              const SizedBox(
                                width: 15.1,
                              ),
                              Text(
                                'Anggota keluarga',
                                style: secondTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/vaksinasni');
                        },
                        child: Container(
                          height: 44.25,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 21.5,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/date_vaksinasi.svg',
                                width: 13.5,
                                height: 15,
                                color: secondColor,
                              ),
                              const SizedBox(
                                width: 16.1,
                              ),
                              Text(
                                'Jadwal Vaksinasi',
                                style: secondTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/list-invoice');
                        },
                        child: Container(
                          height: 44.25,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            left: 20,
                          ),
                          decoration: BoxDecoration(
                            color: primaryColor2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/history.svg',
                                width: 15.22,
                                height: 13.5,
                                color: secondColor,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Riwayat Booking',
                                style: secondTextStyle.copyWith(
                                    fontSize: 12, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      await prefs.setInt(
                        'idUser',
                        0,
                      );
                      Navigator.pushReplacementNamed(context, '/signIn');
                    },
                    child: Container(
                      height: 44.25,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 21.5,
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/logout.svg',
                            width: 13.5,
                            height: 15,
                            color: secondColor,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            'Keluar Akun',
                            style: secondTextStyle.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Consumer<HomeViewModel>(
            builder: (context, value, child) {
              if (value.state == StatusState.loding) {
                return const Center(
                  child: LoadingScreen(),
                );
              }
              return ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          left: 18,
                        ),
                        decoration: BoxDecoration(
                          color: backgroundColor1,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Halo ${value.fullName}',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              'Selamat Datang Kembali!',
                              style: whiteTextStyle.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Mari, daftar jadwal vaksinasi dengan mudah bersama kami.',
                              style: whiteTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/location.svg',
                                      width: 15,
                                      height: 15,
                                    ),
                                    // ignore: prefer_const_constructors
                                    SizedBox(
                                      width: 7.5,
                                    ),
                                    Text(
                                      'Lampung, Indonesia',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(75),
                                          topRight: Radius.circular(12),
                                          bottomLeft: Radius.circular(45),
                                        ),
                                        color: const Color(0xFFFFFFFF)
                                            .withOpacity(0.3),
                                      ),
                                      width: 85,
                                      height: 85,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 380,
                        padding: const EdgeInsets.only(top: 167),
                        child: Center(
                          child: Container(
                            width: 340,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 23, vertical: 28),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(10),
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
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 26,
                                    ),
                                    Text(
                                      'Yuk Vaksin!',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      'Tidak Sakit,',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Tinggal Daftar,',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'Datang, Duduk',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      'dan Disuntik.',
                                      style: secondTextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        value
                                            .changeClickButtonRegisterNow(true);
                                        Navigator.pushNamed(
                                            context, '/vaksinasni');
                                        Timer(const Duration(milliseconds: 200),
                                            () {
                                          value.changeClickButtonRegisterNow(
                                              false);
                                        });
                                      },
                                      child: Container(
                                        height: 25,
                                        width: 121,
                                        decoration: BoxDecoration(
                                          color: value.clickButtonRegisterNow ==
                                                  true
                                              ? primaryColor2_1
                                              : primaryColor2,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Daftar Sekarang!',
                                              style: secondTextStyle.copyWith(
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 9.63,
                                            ),
                                            SvgPicture.asset(
                                              'assets/arrow_right.svg',
                                              height: 4.65,
                                              color: secondColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: SvgPicture.asset(
                                    'assets/yuk_vaksin.svg',
                                    width: double.infinity,
                                    height: 126,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  exclusiveTitle(),
                  exclusiveContent(),
                  newsTitle(value),
                  newsContent(value),
                ],
              );
            },
          )),
    );
  }
}
