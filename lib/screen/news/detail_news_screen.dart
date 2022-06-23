import 'package:bookingvaccine/screen/news/news_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DetailNewsScreen extends StatelessWidget {
  const DetailNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor2,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            leading: Builder(
              builder: (context) => IconButton(
                icon: SvgPicture.asset(
                  'assets/arrow_left.svg',
                  width: 16.23,
                  height: 15.81,
                  color: whiteColor,
                ),
                onPressed: () => Navigator.pop(context),
                padding: const EdgeInsets.only(top: 15),
              ),
            ),
            elevation: 0,
            backgroundColor: primaryColor2,
          ),
        ),
        body: Consumer<NewsViewModel>(builder: (context, value, child) {
          return Container(
            padding: const EdgeInsets.only(
              left: 18,
              top: 50,
              right: 18,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    value.detailDataNews.titleNewsVaccine,
                    style: primaryTextStyle2.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '${DateFormat(
                      'EEEE, d MMM, yyyy',
                    ).format(value.detailDataNews.createdAt)} / ${value.detailDataNews.createdAt.toString().substring(11, 16)}',
                    style: secondTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 173,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            NetworkImage(value.detailDataNews.imageNewsVaccine),
                        fit: BoxFit.fill),
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    value.detailDataNews.contentNewsVaccine,
                    style: secondTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
