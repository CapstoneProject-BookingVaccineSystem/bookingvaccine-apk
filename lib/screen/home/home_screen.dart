import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Container(
                margin: const EdgeInsets.only(
                  top: 15,
                  right: 17,
                ),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: greyColor,
                  image: const DecorationImage(
                    image:
                        NetworkImage('https://picsum.photos/200/300?random=2'),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          ),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
            child: Column(
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
                        'Halo, John Doe!',
                        style: whiteTextStyle.copyWith(
                          fontSize: 16,
                        ),
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
                                  color:
                                      const Color(0xFFFFFFFF).withOpacity(0.3),
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
                  height: 360,
                  padding: const EdgeInsets.only(top: 167),
                  child: Center(
                    child: Container(
                      width: 340,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 23, vertical: 28),
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
                                ' Datang, Duduk',
                                style: secondTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                ' dan Disuntik.',
                                style: secondTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                              ),
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
            )
          ],
        )),
      ),
    );
  }
}
