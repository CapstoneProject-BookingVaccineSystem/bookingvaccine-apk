import 'dart:async';

import 'package:bookingvaccine/component/loading_screen.dart';
import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/screen/invoice/invoice_view_model.dart';
import 'package:bookingvaccine/screen/vaksinasi/vaksinasi_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class InvoiceScreen extends StatefulWidget {
  InvoiceScreen({Key? key, required idBooking}) : super(key: key);

  int? idBooking;
  String tes = 'tes';

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<InvoiceViewModel>(context, listen: false);
      int id = ModalRoute.of(context)!.settings.arguments as int;
      await _viewModel.getBookingById(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final valueVaksinasi = context.watch<VaksinasiViewModel>();
    return SafeArea(
        child: Scaffold(
      body: Container(
          padding: const EdgeInsets.only(
            left: 38,
            right: 38,
            bottom: 55,
            top: 66,
          ),
          child: Consumer<InvoiceViewModel>(
            builder: (context, value, child) {
              if (value.state == StatusState.loding) {
                return const LoadingScreen();
              }

              return ListView(
                children: [
                  Align(
                    child: Text(
                      'Jadwal Booking Vaksinasi',
                      style: primaryTextStyle2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                      'Telah Berhasil DIbuat!',
                      style: primaryTextStyle2.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    child: Text(
                      'Screenshoot bukti faktur ini dan tunjukkan pada pihak',
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                      'atau staff terkait di fasilitas kesehatan tersebut.',
                      style: primaryTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 35, bottom: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        width: 1,
                        color: primaryColor2,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 3,
                          offset:
                              const Offset(0, 1), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Align(
                          child: Text(
                            'ID Booking',
                            style: secondTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          child: Text(
                            value.dataDetailBookingById.idBooking.toString(),
                            style: secondTextStyle.copyWith(
                              fontSize: 48,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          child: Text(
                            'Kunjungan Pada',
                            style: secondTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Align(
                          child: Text(
                            DateFormat('d MMM, yyyy').format(value
                                .dataDetailBookingById.sessionMapped.startDate),
                            style: secondTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Align(
                          child: Text(
                            '${value.dataDetailBookingById.sessionMapped.startTime} - Selesai',
                            style: secondTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          child: Text(
                            'Untuk',
                            style: secondTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Align(
                          child: Text(
                            value.dataDetailBookingById.sessionMapped
                                .vaccineMapped.vaccineName,
                            style: secondTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Align(
                          child: Text(
                            'di',
                            style: secondTextStyle.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Align(
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              value
                                  .dataDetailBookingById
                                  .sessionMapped
                                  .healthFacilitiesDaoMapped
                                  .healthFacilitiesName,
                              style: secondTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 30,
                            right: 30,
                          ),
                          child: Text(
                            value
                                .dataDetailBookingById
                                .sessionMapped
                                .healthFacilitiesDaoMapped
                                .addressHealthFacilities,
                            style: primaryTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Detail Pasien',
                    style: secondTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Nama',
                        style: secondTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${value.dataDetailBookingById.userMapped.firstName} ${value.dataDetailBookingById.userMapped.lastName}',
                          style: secondTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Lahir',
                        style: secondTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          value.dataDetailBookingById.userMapped.birthDate
                              .toString()
                              .substring(0, 10),
                          style: secondTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NIK',
                        style: secondTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          value.dataDetailBookingById.userMapped.username,
                          style: secondTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Datanglah tepat waktu untuk menjaga ketertiban bersama.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      value.changeClickBackToHome(true);
                      valueVaksinasi.changeClickContent(false, 0, 0);
                      valueVaksinasi.changeClickKelurahan(false);
                      Navigator.pushReplacementNamed(context, '/home');
                      Timer(
                        const Duration(milliseconds: 200),
                        () {
                          value.changeClickBackToHome(false);
                        },
                      );
                    },
                    child: Container(
                      height: 51,
                      decoration: BoxDecoration(
                        color: value.clickBackToHome == false
                            ? primaryColor2
                            : primaryColor2_1,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'Kembali ke Halaman Utama',
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )),
    ));
  }
}
