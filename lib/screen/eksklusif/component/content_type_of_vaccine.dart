import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../theme.dart';
import '../ekslusif_view_model.dart';

class Content extends StatelessWidget {
  const Content({
    Key? key,
    required this.vaccineName,
    required this.description,
    required this.rekomendasi,
    required this.jadwalOne,
    required this.jadwalTwo,
    required this.content,
  }) : super(key: key);

  final String vaccineName,
      description,
      rekomendasi,
      jadwalOne,
      jadwalTwo,
      content;

  @override
  Widget build(BuildContext context) {
    return Consumer<EkslusifViewModel>(builder: (context, value, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: ExpansionWidget(
            initiallyExpanded: false,
            titleBuilder:
                (double animationValue, _, bool isExpaned, toogleFunction) {
              return InkWell(
                onTap: () {
                  toogleFunction(animated: true);
                  if (content == 'contentOne') {
                    if (value.contenOne == true) {
                      value.changeContenOne(false);
                    } else {
                      value.changeContenOne(true);
                    }
                  }

                  if (content == 'contenTwo') {
                    if (value.contenTwo == true) {
                      value.changeContenTwo(false);
                    } else {
                      value.changeContenTwo(true);
                    }
                  }

                  if (content == 'contenThree') {
                    if (value.contenThree == true) {
                      value.changeContenThree(false);
                    } else {
                      value.changeContenThree(true);
                    }
                  }

                  if (content == 'contenFour') {
                    if (value.contenFour == true) {
                      value.changeContenFour(false);
                    } else {
                      value.changeContenFour(true);
                    }
                  }

                  if (content == 'contenFive') {
                    if (value.contenFive == true) {
                      value.changeContenFive(false);
                    } else {
                      value.changeContenFive(true);
                    }
                  }
                },
                child: Container(
                  height: 40,
                  padding: const EdgeInsets.only(
                    left: 20.75,
                    right: 20.75,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: (content == 'contentOne')
                        ? (value.contenOne == false)
                            ? BorderRadius.circular(5)
                            : BorderRadius.circular(0)
                        : (content == 'contenTwo')
                            ? value.contenTwo == false
                                ? BorderRadius.circular(5)
                                : BorderRadius.circular(0)
                            : (content == 'contenThree')
                                ? value.contenThree == false
                                    ? BorderRadius.circular(5)
                                    : BorderRadius.circular(0)
                                : (content == 'contenTwo')
                                    ? value.contenTwo == false
                                        ? BorderRadius.circular(5)
                                        : BorderRadius.circular(0)
                                    : (content == 'contenFour')
                                        ? value.contenFour == false
                                            ? BorderRadius.circular(5)
                                            : BorderRadius.circular(0)
                                        : (content == 'contenFive')
                                            ? value.contenFive == false
                                                ? BorderRadius.circular(5)
                                                : BorderRadius.circular(0)
                                            : BorderRadius.circular(5),
                    color: primaryColor2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/type_of_vaksin.svg',
                            width: 16.5,
                            height: 10.5,
                            color: secondColor,
                          ),
                          const SizedBox(
                            width: 10.75,
                          ),
                          Text(
                            vaccineName,
                            style: secondTextStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/up_secondry.svg',
                        width: 9.31,
                        height: 5.49,
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
                children: [
                  Text(
                    description,
                    style: secondTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 19.75,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/familly.svg',
                          width: 15,
                          height: 15,
                          color: secondColor,
                        ),
                        const SizedBox(
                          width: 10.75,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Direkomendasikan untuk usia',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                rekomendasi,
                                style: secondTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 19.75,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/clock.svg',
                          width: 15,
                          height: 15,
                          color: secondColor,
                        ),
                        const SizedBox(
                          width: 10.75,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jadwal yang direkomendasikan',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    const Text(
                                      '•',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        jadwalOne,
                                        style: secondTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: [
                                    const Text(
                                      '•',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        jadwalTwo,
                                        style: secondTextStyle.copyWith(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
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
                  )
                ],
              ),
            )),
      );
    });
  }
}
