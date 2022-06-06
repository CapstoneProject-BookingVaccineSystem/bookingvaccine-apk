import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:expansion_widget/expansion_widget.dart';

class FamillyScreen extends StatelessWidget {
  FamillyScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
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
        body: ListView(
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
                    'Tambahkan Anggota Keluarga',
                    style: primaryTextStyle2.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    'Tambahkan anggota keluarga untuk mempermudah pendaftaran vaksinasi keluarga anda.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Form(
                key: _formKey,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    int countFamilly = index + 1;
                    return Container(
                      margin: const EdgeInsets.only(
                        left: 19,
                        right: 19,
                        top: 16,
                      ),
                      child: ExpansionWidget(
                        initiallyExpanded: false,
                        titleBuilder: (double animationValue, _, bool isExpaned,
                            toogleFunction) {
                          return InkWell(
                            onTap: () => toogleFunction(animated: true),
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.only(
                                left: 20.75,
                                right: 20.75,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor2,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        'assets/familly.svg',
                                        width: 16.5,
                                        height: 10.5,
                                      ),
                                      const SizedBox(
                                        width: 10.75,
                                      ),
                                      Text(
                                        'Keluarga $countFamilly',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                    'assets/plus.svg',
                                    width: 11.67,
                                    height: 11.67,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NIK',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]')),
                                  LengthLimitingTextInputFormatter(16),
                                ],
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(color: Colors.grey),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Nik tidak boleh kosong';
                                  }

                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Nama Lengkap',
                                style: primaryTextStyle2.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                textInputAction: TextInputAction.next,
                                style: const TextStyle(color: Colors.grey),
                                decoration: InputDecoration(
                                  hintStyle: greyTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == '') {
                                    return 'Nama belakang tidak boleh kosong';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                  }
                                },
                                child: Container(
                                  height: 42,
                                  decoration: BoxDecoration(
                                    color: primaryColor2,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Tambahkan',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
