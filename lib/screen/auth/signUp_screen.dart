import 'dart:async';

import 'package:bookingvaccine/model/register_model.dart';
import 'package:bookingvaccine/screen/auth/auth_view_model.dart';
import 'package:bookingvaccine/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    final List<String> genderItems = [
      'Laki-Laki',
      'Perempuan',
    ];
    String? selectedValue;

    bool value = false;

    Widget logo() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/logo.svg',
            width: 66.62,
            height: 81,
          ),
          const SizedBox(
            width: 21.66,
          ),
          Text(
            'Logo',
            style: secondTextStyle.copyWith(
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 17),
        child: Center(
          child: Text(
            'Silahkan Buat Akun Anda',
            style: primaryTextStyle2.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    Widget description() {
      return Container(
          margin: const EdgeInsets.only(
            top: 10,
          ),
          padding: const EdgeInsets.only(
            left: 68.5,
            right: 68.5,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Isi setiap bagian yang telah disediakan.',
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Perhatikan informasi dan pastikan data yang telah dimasukkan itu benar.',
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ));
    }

    Widget firstName(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: TextFormField(
            keyboardType: TextInputType.text,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
            ],
            controller: paramValue.firstNameC,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              hintText: 'Nama Depan',
              hintStyle: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            validator: (value) {
              if (value == '') {
                return 'Nama depan tidak boleh kosong';
              }
              return null;
            },
          ));
    }

    Widget lastName(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: TextFormField(
            controller: paramValue.lastNameC,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.deny(RegExp(r'[0-9]')),
            ],
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              hintText: 'Nama Belakang',
              hintStyle: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            validator: (value) {
              if (value == '') {
                return 'Nama belakang tidak boleh kosong';
              }
              return null;
            },
          ));
    }

    Widget date(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: TextFormField(
            controller: paramValue.dateC,
            onTap: () async {
              DateTime? date = (await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now()));
              if (date != null) {
                String dateFormat = DateFormat('yyyy-MM-dd').format(date);
                paramValue.changeDate(dateFormat);
              } else {
                paramValue.changeDate('');
              }
            },
            readOnly: true,
            textInputAction: TextInputAction.next,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              hintText:
                  paramValue.date == '' ? 'Tanggal lahir' : paramValue.date,
              hintStyle: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            validator: (value) {
              if (value == '') {
                return 'Tanggal lahir tidak boleh kosong';
              }
              int validate =
                  DateTime.now().year - int.parse(value!.substring(0, 4));

              if (validate < 18) {
                return 'Umur belum cukup';
              }

              return null;
            },
          ));
    }

    Widget gender(SignUpViewModel paramValue) {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
        ),
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
        ),
        child: DropdownButtonFormField2(
          decoration: InputDecoration(
            //Add isDense true and zero Padding.
            //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
            isDense: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.grey, width: 1.0),
            ),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          hint: Text(
            'Pilih Jenis Kelamin',
            style: greyTextStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: greyColor,
          ),
          iconSize: 25,
          buttonHeight: 40,
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item,
                        style: greyTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        )),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Jenis kelamin tidak boleh kosong';
            }
          },
          onChanged: (value) {
            //Do something when changing the item if you want.
          },
          onSaved: (value) {
            selectedValue = value.toString();
          },
        ),
      );
    }

    Widget email(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: paramValue.emailC,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Email tidak boleh kosong';
                  }
                  final bool _isValid = EmailValidator.validate(
                    value.toString(),
                  );

                  if (_isValid == false) {
                    return 'Format harus berupa email';
                  }
                  return null;
                },
              ),
            ],
          ));
    }

    Widget password(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: TextFormField(
            controller: paramValue.passwordC,
            textInputAction: TextInputAction.done,
            obscureText: paramValue.isHidden,
            style: const TextStyle(color: Colors.grey),
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: greyTextStyle.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
              suffixIcon: GestureDetector(
                  onTap: () {
                    paramValue.changeIsHidden(paramValue.isHidden);
                  },
                  child: paramValue.isHidden == true
                      ? const Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        )),
              contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: const BorderSide(color: Colors.grey, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            validator: (value) {
              if (value == '') {
                return 'Password tidak boleh kosong';
              }
              bool result = paramValue.validatePassword(value!);

              if (result == false) {
                return 'Harus ada menggunakan huruf capital dan nomor';
              }
              return null;
            },
          ));
    }

    Widget nik(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: paramValue.nikC,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  LengthLimitingTextInputFormatter(16),
                ],
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  hintText: 'NIK',
                  errorText: paramValue.errorText,
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (text) {
                  paramValue.setStateErrorText(paramValue.nikC.text);
                },
                validator: (value) {
                  if (value == '') {
                    return 'NIK tidak boleh kosong';
                  }

                  return null;
                },
              ),
            ],
          ));
    }

    Widget telpNumber(SignUpViewModel paramValue) {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Column(
            children: [
              TextFormField(
                controller: paramValue.numberC,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  hintText: 'No. Telp',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                  contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == '') {
                    return 'Nomor telpon tidak boleh kosong';
                  }
                  return null;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(
                          width: 1.0,
                          color: paramValue.statusCheckbox == true
                              ? greyColor
                              : Colors.red),
                    ),
                    value: paramValue.agree,
                    onChanged: (bool? newValue) {
                      paramValue.changeAgree(newValue!);
                      paramValue.changestatusCheckbox(newValue);
                    },
                    focusColor: greyColor,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Saya telah menyetujui ',
                      style: secondTextStyle.copyWith(
                        fontSize: 10,
                        overflow: TextOverflow.visible,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'kebijakan privasi',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // callMyFunction();
                            },
                          style: secondTextStyle.copyWith(
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2,
                          ),
                        ),
                        TextSpan(
                          text: ' yang berlaku',
                          style: secondTextStyle.copyWith(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ));
    }

    Widget regiter(SignUpViewModel paramValue) {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(
          left: 51,
          right: 51,
        ),
        child: GestureDetector(
          onTap: () async {
            paramValue.changeClickRegister(false);
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              if (paramValue.agree == true) {
                await paramValue.registerUser(
                    RegisterModel(
                        username: paramValue.nikC.text,
                        password: paramValue.passwordC.text,
                        firstName: paramValue.firstNameC.text,
                        lastName: paramValue.lastNameC.text,
                        birthDate: DateTime.parse(paramValue.date),
                        gender: selectedValue!,
                        email: paramValue.emailC.text,
                        noPhone: paramValue.numberC.text),
                    context);
              }
              if (paramValue.agree == false) {
                paramValue.changestatusCheckbox(paramValue.agree);
              }
            }
            Timer(const Duration(milliseconds: 200), () {
              paramValue.changeClickRegister(true);
            });
            paramValue.changestatusCheckbox(paramValue.agree);
          },
          child: Container(
            width: 339,
            height: 42,
            decoration: BoxDecoration(
              color: paramValue.clickRegister == true
                  ? primaryColor2
                  : primaryColor2_1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Daftar Sekarang',
                style: secondTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget cancel(SignUpViewModel paramValue) {
      return GestureDetector(
        onTap: () {
          paramValue.changestatusCheckbox(true);
          Navigator.pop(context);
        },
        child: Container(
            margin: const EdgeInsets.only(
              top: 8,
              bottom: 43,
            ),
            child: Text(
              'Batal',
              style: secondTextStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            )),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: SafeArea(
        child: Container(
            height: double.infinity,
            margin: EdgeInsets.only(
              bottom: !_isKeyboard ? 50 : 0,
            ),
            padding: EdgeInsets.only(
              top: !_isKeyboard ? 70 : 50,
            ),
            decoration: BoxDecoration(
              color: backgroundColor2,
            ),
            child: Consumer<SignUpViewModel>(
              builder: (context, value, child) {
                return Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (!_isKeyboard) logo(),
                        if (!_isKeyboard) title(),
                        if (!_isKeyboard) description(),
                        firstName(value),
                        lastName(value),
                        date(value),
                        gender(value),
                        email(value),
                        password(value),
                        nik(value),
                        telpNumber(value),
                        regiter(value),
                        cancel(value),
                      ],
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}
