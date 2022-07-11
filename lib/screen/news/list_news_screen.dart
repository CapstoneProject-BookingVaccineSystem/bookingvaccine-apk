import 'package:bookingvaccine/component/loading_screen.dart';
import 'package:bookingvaccine/constant/state.dart';
import 'package:bookingvaccine/screen/news/news_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ListNewsScreen extends StatefulWidget {
  const ListNewsScreen({Key? key}) : super(key: key);

  @override
  State<ListNewsScreen> createState() => _ListNewsScreenState();
}

class _ListNewsScreenState extends State<ListNewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async {
      var _viewModel = Provider.of<NewsViewModel>(context, listen: false);
      await _viewModel.getAllDataNews();
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
                    'Berita Terbaru',
                    style: primaryTextStyle2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Baca berita terbaru terkait Covid-19.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            Consumer<NewsViewModel>(builder: (context, value, child) {
              if (value.state == StatusState.loding) {
                return const LoadingScreen();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: value.allDataNews.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 95,
                      margin: const EdgeInsets.only(
                        left: 17,
                        top: 18,
                        right: 18,
                      ),
                      color: Colors.white,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await value.getDetailDataNewsById(
                                  value.allDataNews[index].idNewsVaccine);

                              Navigator.of(context).pushNamed('/detail-news');
                            },
                            child: Container(
                              height: 95,
                              width: 95,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        value.allDataNews[index].image ?? ''),
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                      value.allDataNews[index].titleNewsVaccine,
                                      style: primaryTextStyle2.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.visible),
                                ),
                                const SizedBox(
                                  height: 5.67,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/date.svg',
                                      width: 13.33,
                                      height: 14.67,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 5.33,
                                    ),
                                    Text(
                                      DateFormat(
                                        'EEEE, d MMM, yyyy',
                                      ).format(
                                          value.allDataNews[index].createdAt),
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 5.67,
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/clock.svg',
                                      width: 13.33,
                                      height: 14.67,
                                      color: primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 5.33,
                                    ),
                                    Text(
                                      value.allDataNews[index].createdAt
                                          .toString()
                                          .substring(11, 16),
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
