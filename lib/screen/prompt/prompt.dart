import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme.dart';

class Prompt {
  promptSucces(BuildContext paramContext, String paramTitle) {
    showDialog(
        context: paramContext,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Container(
              height: 183,
              width: 337,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/succes.svg',
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  Text(
                    paramTitle,
                    textAlign: TextAlign.center,
                    style: secondTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
            ),
          );
        });

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pop(paramContext);
      },
    );
  }

  void promptConfirm(BuildContext paramContext, String paramTitle) {
    showDialog(
        context: paramContext,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsPadding: EdgeInsets.zero,
            buttonPadding: EdgeInsets.zero,
            actions: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(paramContext);
                        },
                        child: Container(
                          height: 53,
                          color: const Color(0xffF7F7F7),
                          child: Center(
                            child: Text(
                              'Kembali',
                              style: secondTextStyle.copyWith(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          Navigator.pop(paramContext);
                          promptSucces(
                            paramContext,
                            paramTitle,
                          );
                        },
                        child: Container(
                          height: 53,
                          color: primaryColor2,
                          child: Center(
                            child: Text(
                              'Konfirmasi',
                              style: secondTextStyle.copyWith(fontSize: 14),
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
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Apakah anda yakin?',
                    textAlign: TextAlign.center,
                    style: secondTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Data yang diubah tidak akan tersimpan.',
                    textAlign: TextAlign.center,
                    style: secondTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
