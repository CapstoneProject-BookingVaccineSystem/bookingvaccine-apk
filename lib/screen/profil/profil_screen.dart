import 'dart:io';

import 'package:bookingvaccine/component/loading_screen.dart';
import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/screen/home/home_view_model.dart';
import 'package:bookingvaccine/screen/profil/profil_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<ProfilViewModel>(context, listen: false);
      await _viewModel.getDataUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfilViewModel>(builder: (context, paramValue, child) {
      return WillPopScope(
        onWillPop: () async {
          return paramValue.getDataHome(context);
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: const Color(0xffD9D9D9),
            body: ListView(
              children: [
                Container(
                  height: 403,
                  decoration: BoxDecoration(
                    color: primaryColor2,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              SvgPicture.asset(
                                'assets/ellipse1.svg',
                              ),
                              GestureDetector(
                                onTap: () async {
                                  var _viewModel = Provider.of<HomeViewModel>(
                                      context,
                                      listen: false);
                                  await _viewModel.getDataHome();
                                  Navigator.pop(context);
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 20, top: 30),
                                  child: SvgPicture.asset(
                                    'assets/arrow_left.svg',
                                    width: 16.23,
                                    height: 15.81,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: SvgPicture.asset(
                              'assets/ellipse2.svg',
                            ),
                          ),
                          Align(
                            child: Container(
                              height: 126,
                              width: 126,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(60),
                                image: DecorationImage(
                                  image: paramValue.imageProfil != ''
                                      ? FileImage(File(paramValue.imageProfil))
                                      : const AssetImage(
                                              'assets/default_profil.png')
                                          as ImageProvider,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Align(
                        child: Text(
                          '${paramValue.user.firstName} ${paramValue.user.lastName}',
                          style: whiteTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Align(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/edit-profile');
                          },
                          child: Container(
                            height: 32,
                            width: 126,
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text(
                                'Edit Profil',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 12,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  color: whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama Depan',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.firstName,
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Nama Belakang',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.lastName,
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tanggal Lahir',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.birthDate
                                  .toString()
                                  .substring(0, 10),
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Jenis Kelamin',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.gender,
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 97),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  color: whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Informasi Akun',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/edit-informasi');
                            },
                            child: Container(
                              height: 22,
                              width: 115,
                              decoration: BoxDecoration(
                                color: primaryColor2,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'Edit  Informasi',
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
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.email,
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '********',
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'NIK',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.username,
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'No. Telp',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              paramValue.user.noPhone,
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
