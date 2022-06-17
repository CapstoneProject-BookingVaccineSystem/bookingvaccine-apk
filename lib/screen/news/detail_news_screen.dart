import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

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
        body: Container(
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
                  'Satgas Covid-19: Pemerintah Masih Terapkan PPKM',
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
                  'Satgas Covid-19: Pemerintah Masih Terapkan PPKM',
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
                  image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/200/300'),
                      fit: BoxFit.fill),
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Meski kasus tergolong melandai terhitung 4 minggu pasca lebaran, pemerintah masih terus melakukan pemantauan terhadap kasus Covid-19. Koordinator Tim Ahli dan Juru Bicara Pemerintah untuk Penanganan Covid-19, Wiku Adisasmito menegaskan, pemerintah Indonesia menyatakan tetap melakukan pengendalian melalui penerapan pembatasan kegiatan masyarakat (PPKM), hingga status pandemi benar-benar dinyatakan berakhir oleh badan kesehatan dunia (WHO). "Untuk sementara waktu Indonesia masih akan tetap menerapkan PPKM. Pada prinsipnya PPKM adalah bentuk pengendalian yang dianjurkan WHO, dengan beberapa penyesuaian untuk menentukan pembukaan aktivitas masyarakat, sesuai situasi dan kondisi yang ada di lapangan secara riil," kata Wiku dalam Update Penanganan Pandemi Covid-19, Kamis (2/6). Wiku menekankan, walau pengendalian dan kesiapsiagaan terus dilakukan, namun ancaman penularan Covid-19 yang belum sepenuhnya hilang. Meski demikian, masyarakat dapat melakukan aktivitas dengan penerapan protokol kesehatan.',
                  style: secondTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
