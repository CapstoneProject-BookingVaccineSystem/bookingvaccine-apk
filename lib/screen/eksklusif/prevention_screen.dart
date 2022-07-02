import 'package:bookingvaccine/screen/eksklusif/component/conten_prevention.dart';
import 'package:bookingvaccine/screen/eksklusif/component/disease_symptoms.dart';
import 'package:bookingvaccine/screen/eksklusif/ekslusif_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PreventionScreen extends StatelessWidget {
  const PreventionScreen({Key? key}) : super(key: key);

  get colors => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<EkslusifViewModel>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  height: 230,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Color(0xff7BD9E8), Colors.white]),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(
                          'assets/arrow_left.svg',
                          width: 16.23,
                          height: 15.81,
                          color: secondColor,
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cara Pencegahan ',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Virus Covid-19 dan',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Gejala Penyakitnya',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/illustration.svg',
                            width: 110,
                            height: 110,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Container(
                    height: 421,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xff829CCC),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cara Pencegahan',
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ContentPrevention(
                          imageAsset: 'assets/people_use_mask.png',
                          description:
                              'Memakai Masker di Luar danDalam Ruangan',
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ContentPrevention(
                          imageAsset: 'assets/syringe.png',
                          description: 'Lakukan Vaksinasi',
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ContentPrevention(
                          imageAsset: 'assets/people_see.png',
                          description: 'Jaga Jarak Aman dan Batasi Mobilitas',
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        ContentPrevention(
                          imageAsset: 'assets/washing_hands.png',
                          description: 'Cuci Tangan secara Rutin',
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 27, vertical: 30),
                  child: Container(
                    height: 421,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: const Color(0xff829CCC),
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Gejala Penyakit',
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DiseaseSymptoms(
                              imageAsset: 'assets/people_cought.png',
                              description: 'Batuk',
                            ),
                            DiseaseSymptoms(
                              imageAsset: 'assets/people_fever.png',
                              description: 'Demam',
                            ),
                            DiseaseSymptoms(
                              imageAsset: 'assets/people_fatigue.png',
                              description: 'Kelelahan',
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 11,
                        ),
                        Text(
                          'Beberapa gejala tambahan :',
                          style: secondTextStyle.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Kehilangan Rasa/Bau ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Sakit Kepala ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Diare ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14.5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Kesulitan Bernapas ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Sakit Tenggorokan ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14.5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Iritasi Mata ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Nyeri Dada ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Kesulitan Bergerak ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 14.5,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Ruam pada Kulit ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff829CCC),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                ' Perubahan Warna pada Jari ',
                                style: whiteTextStyle.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 27, right: 27, bottom: 30),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7.5,
                      vertical: 18,
                    ),
                    height: 96,
                    decoration: BoxDecoration(
                      color: primaryColor2,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset('assets/telp.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          '119',
                          style: secondTextStyle.copyWith(fontSize: 30),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            'Jika anda, keluarga, dan orang disekitar anda membutuhkan bantuan penanganan Covid-19, segera hubungi kontak darurat tersebut.',
                            style: secondTextStyle.copyWith(fontSize: 10),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
