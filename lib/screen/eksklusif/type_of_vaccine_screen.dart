import 'package:bookingvaccine/screen/eksklusif/ekslusif_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'component/content_type_of_vaccine.dart';

class TypeOfVaccineScreen extends StatelessWidget {
  const TypeOfVaccineScreen({Key? key}) : super(key: key);

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
                                'Berbagai Macam',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Jenis Vaksin',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Covid-19 yang ada',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'di Indonesia',
                                style: secondTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/character_2.svg',
                            width: 152,
                            height: 222,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 11,
                ),
                const Content(
                  vaccineName: 'Sinovac',
                  description:
                      'COVID-19 Vaccine (Vero Cell) Inactivated, CoronaVac® adalah sebuah vaksin inaktivasi terhadap COVID-19 yang menstimulasi sistem kekebalan tubuh tanpa risiko menyebabkan penyakit. Vaksin ini mengandung ajuvan (aluminium hidroksida), untuk memperkuat respons sistem kekebalan.',
                  rekomendasi: '18 hingga 59 tahun (menurut EUL WHO)',
                  jadwalOne: 'Dosis 1  : tanggal pemberian awal',
                  jadwalTwo:
                      'Dosis 2 : 14 hingga 28 hari setelah dosis pertama.',
                  content: 'contentOne',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Content(
                  vaccineName: 'Aztrazeneca',
                  description:
                      'Vaksin ChAdOx1-S/nCoV-19 adalah vaksin vektor adenovirus non-replikasi untuk COVID-19. BPOM memberikan izin penggunaan darurat untuk AstraZeneca usai melakukan evaluasi bersama Komite Nasional Penilai Obat dan pihak lainnya. Vaksin Covid-19 yang dikembangkan oleh AstraZeneca dan University of Oxford ini memiliki efikasi sebesar 62,1 persen.',
                  rekomendasi:
                      '18 tahun dan lebih, termasuk usia 65 tahun dan lebih',
                  jadwalOne: 'Dosis 1  : tanggal pemberian awal',
                  jadwalTwo:
                      'Dosis 2 : 8 hingga 12 minggu setelah dosis pertama.',
                  content: 'contenTwo',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Content(
                  vaccineName: 'Sinopharm',
                  description:
                      'SARS-CoV-2 Vaccine (Vero Cell) adalah sebuah vaksin inaktivasi terhadap COVID-19 yang menstimulasi sistem kekebalan tubuh tanpa risiko menyebabkan penyakit. Vaksin ini mengandung ajuvan (aluminium hidroksida), untuk memperkuat respons sistem kekebalan.',
                  rekomendasi:
                      '18 tahun dan lebih, termasuk usia 65 tahun dan lebih',
                  jadwalOne: 'Dosis 1  : tanggal pemberian awal',
                  jadwalTwo:
                      'Dosis 2 : 14 hingga 28 hari setelah dosis pertama.',
                  content: 'contenThree',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Content(
                  vaccineName: 'Moderna',
                  description:
                      'Vaksin COVID-19 Moderna adalah sebuah vaksin berbasis RNA duta (messenger RNA/mRNA) untuk COVID-19. Hasil uji klinis menyatakan vaksin Moderna aman untuk kelompok populasi masyarakat dengan komorbid atau penyakit penyerta.  Komorbid yang dimaksud yakni penyakit paru kronis, jantung, obesitas berat, diabetes, penyakit lever hati, dan HIV.',
                  rekomendasi: '18 tahun dan lebih',
                  jadwalOne: 'Dosis 1  : tanggal pemberian awal. ',
                  jadwalTwo: 'Dosis 2 : 28 hari setelah dosis pertama.',
                  content: 'contenFour',
                ),
                const SizedBox(
                  height: 10,
                ),
                const Content(
                  vaccineName: 'Pfizer',
                  description:
                      'COMIRNATY® adalah sebuah vaksin berbasis RNA duta (messenger RNA/mRNA) untuk COVID-19. Data uji klinik fase III menunjukkan efikasi vaksin yang dikembangkan oleh Pfizer Inc. dan BioNTech ini sebesar 100 persen pada usia remaja 12-15 tahun, kemudian menurun menjadi 95,5 persen pada usia 16 tahun ke atas.',
                  rekomendasi: '16 tahun dan lebih',
                  jadwalOne: 'Dosis 1  : tanggal pemberian awal. ',
                  jadwalTwo:
                      'Dosis 2 : 21 hingga 28 hari setelah dosis pertama.',
                  content: 'contenFive',
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
