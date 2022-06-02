import 'package:bookingvaccine/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:page_transition/page_transition.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    final List<String> genderItems = [
      'Male',
      'Female',
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

    Widget firstName() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
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
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    }

    Widget lastName() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
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
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    }

    Widget date() {
      return Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 18,
          right: 18,
        ),
        height: 48,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 7,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text('Tanggal Lahir',
            style: greyTextStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            )),
      );
    }

    Widget gender() {
      return Container(
        margin: const EdgeInsets.only(
          top: 18,
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
            contentPadding: EdgeInsets.zero,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            //Add more decoration as you want here
            //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
          ),
          isExpanded: true,
          hint: Text(
            'Select Your Gender',
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
          buttonHeight: 48,
          buttonPadding: const EdgeInsets.only(left: 10, right: 10),
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
              return 'Please select gender.';
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

    Widget email() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
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
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    }

    Widget password() {
      return Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Form(
            child: TextFormField(
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Colors.grey),
              decoration: InputDecoration(
                hintText: 'Password',
                hintStyle: greyTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                suffixIcon: GestureDetector(
                  child: const Icon(
                    Icons.visibility,
                    color: Colors.grey,
                  ),
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
            ),
          ));
    }

    Widget nik() {
      return Container(
          margin: const EdgeInsets.only(
            top: 16,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.grey),
                  decoration: InputDecoration(
                    hintText: 'NIK',
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
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ));
    }

    Widget telpNumber() {
      return Container(
          margin: const EdgeInsets.only(
            top: 12,
          ),
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: Form(
            child: Column(
              children: [
                TextFormField(
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
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) => BorderSide(width: 1.0, color: greyColor),
                      ),
                      value: false,
                      onChanged: (bool? newValue) {},
                      focusColor: greyColor,
                    ),
                    Text(
                      'Saya telah menyetujui kebijakan privasi yang berlaku',
                      style: secondTextStyle.copyWith(
                        fontSize: 10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    }

    Widget regiter() {
      return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.only(
          left: 51,
          right: 51,
        ),
        child: GestureDetector(
          child: Container(
            width: 273,
            height: 35,
            decoration: BoxDecoration(
              color: primaryColor2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                'Daftar Sekarang',
                style: whiteTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      );
    }

    Widget cancel() {
      return GestureDetector(
        onTap: () {
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (!_isKeyboard) logo(),
                if (!_isKeyboard) title(),
                if (!_isKeyboard) description(),
                firstName(),
                lastName(),
                date(),
                gender(),
                email(),
                password(),
                nik(),
                telpNumber(),
                regiter(),
                cancel(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
