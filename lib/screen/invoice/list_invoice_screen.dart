import 'dart:async';

import 'package:bookingvaccine/screen/invoice/invoice_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ListInvoiceScreen extends StatefulWidget {
  const ListInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<ListInvoiceScreen> createState() => _ListInvoiceScreenState();
}

class _ListInvoiceScreenState extends State<ListInvoiceScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<InvoiceViewModel>(context, listen: false);
      await _viewModel.getAllDataBookingByUserId();
      await Jiffy.locale("id");
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Riwayat Booking',
                    style: primaryTextStyle2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Telusuri riwayat booking vaksinasi anda dan keluarga.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Consumer<InvoiceViewModel>(
              builder: (context, value, child) {
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: value.allDataBooking.length,
                  itemBuilder: (context, index) {
                    int countIndex = index + 1;
                    return GestureDetector(
                      onTap: () {
                        value.changeClickCardListBooking(countIndex);
                        Navigator.pushNamed(context, '/Invoice',
                            arguments: value.allDataBooking[index].idBooking);
                        Timer(
                          const Duration(milliseconds: 200),
                          () {
                            value.changeClickCardListBooking(0);
                          },
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                          left: 18,
                          top: 14,
                          right: 18,
                        ),
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 11,
                          right: 20,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: value.clickCardListBooking == countIndex
                                ? primaryColor2
                                : whiteColor,
                          ),
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ID Booking',
                              style: secondTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              value.allDataBooking[index].idBooking.toString(),
                              style: secondTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/street.svg',
                                  width: 13,
                                  height: 13,
                                  color: primaryColor2,
                                ),
                                const SizedBox(
                                  width: 9.41,
                                ),
                                Flexible(
                                  child: Text(
                                    value
                                        .allDataBooking[index]
                                        .sessionMapped
                                        .healthFacilitiesDaoMapped
                                        .addressHealthFacilities,
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10.81,
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/clock.svg',
                                  width: 13,
                                  height: 13,
                                  color: primaryColor2,
                                ),
                                const SizedBox(
                                  width: 9.41,
                                ),
                                Flexible(
                                  child: Text(
                                    '${Jiffy(value.allDataBooking[index].sessionMapped.startDate, "MM, dd yyyy").yMMMMd}, ${value.allDataBooking[index].sessionMapped.startTime}',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
