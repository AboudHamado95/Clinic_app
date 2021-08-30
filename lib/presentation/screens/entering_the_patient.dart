import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:sameha/constants/my_colors.dart';
import 'package:sameha/constants/strings.dart';
import 'package:sameha/cubit/cubit.dart';
import 'package:sameha/cubit/cubit_state.dart';
// import 'package:sameha/databases/database.dart';
import 'package:sameha/components/custom_big_text_form_field.dart';
import 'dart:ui' as ui;

import 'package:sameha/components/custom_painter.dart';
import 'package:sameha/components/custom_text.dart';
import 'package:sameha/components/custom_text_form_field.dart';
import 'package:sameha/components/icons/icons.dart';

class EnteringThePateint extends StatefulWidget {
  @override
  _EnteringThePateintState createState() => _EnteringThePateintState();
}

class _EnteringThePateintState extends State<EnteringThePateint> {
  TextEditingController textCtrl = new TextEditingController();

  TextEditingController ageCtrl = new TextEditingController();

  TextEditingController phoneCtrl = new TextEditingController();

  TextEditingController numberBoardCtrl = new TextEditingController();

  TextEditingController stateCtrl = new TextEditingController();

  var formKey = GlobalKey<FormState>();

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            title: CustomText(
              name: 'الرجوع إلى القائمة الرئيسية:',
              color: MyColors.pinkColor,
              fontSize: 20.0,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  CustomText(
                    name: 'هل أنت متأكد بالرجوع؟',
                    color: MyColors.pinkColor,
                    fontSize: 18.0,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: CustomText(
                  name: 'موافق',
                  color: MyColors.redColor,
                  fontSize: 16.0,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, homeScreen);
                },
              ),
              TextButton(
                child: CustomText(
                  name: 'إلغاء',
                  color: MyColors.blackColor,
                  fontSize: 16.0,
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, patientInterface);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaHeight = MediaQuery.of(context).size.height;
    final mediaWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) {
            print('state is insert');
          }
        },
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          Future<void> _selectDate(BuildContext context) async {
            final DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: appCubit.currentDate,
                firstDate: DateTime(2015),
                lastDate: DateTime(2050));
            if (pickedDate != null && pickedDate != appCubit.currentDate)
              appCubit.changeCurrentDate(pickedDate);
          }

          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: mediaHeight,
                    width: mediaWidth,
                    color: MyColors.pinkColor,
                  ),
                  Positioned(
                    top: mediaHeight / 15.9,
                    right: 0.0,
                    left: 0.0,
                    child: Container(
                      child: Image.asset(
                        'assets/images/pic.png',
                        height: mediaHeight / 4.5,
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: mediaWidth * 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                      ),
                      height: mediaHeight / 5,
                      width: mediaWidth,
                    ),
                  ),
                  Positioned(
                    bottom: mediaWidth / 20.0,
                    child: CustomPaint(
                      size: Size(mediaWidth, mediaHeight / 1.035),
                      painter: RPSCustomPainter(),
                    ),
                  ),
                  Positioned(
                    bottom: mediaHeight / 50.0,
                    left: mediaWidth / 10.0,
                    right: mediaWidth / 10.0,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          appCubit.insertDatabase(
                              name: textCtrl.text,
                              age: ageCtrl.text,
                              phone: phoneCtrl.text,
                              fileNumber: numberBoardCtrl.text,
                              visitDate: DateFormat("yyyy-MM-dd")
                                  .format(appCubit.currentDate)
                                  .toString(),
                              diagnosis: stateCtrl.text);
                          textCtrl.clear();
                          ageCtrl.clear();
                          phoneCtrl.clear();
                          numberBoardCtrl.clear();
                          stateCtrl.clear();
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      height: mediaHeight / 14.0,
                      color: Colors.white,
                      child: Center(
                        child: Text(
                          'حفظ',
                          style: TextStyle(fontSize: 24.0),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: mediaHeight / 3,
                    left: mediaWidth / 10.0,
                    right: mediaWidth / 10.0,
                    child: Directionality(
                      textDirection: ui.TextDirection.rtl,
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        name: 'إدخال وتعديل المريض',
                                        fontSize: 20.0,
                                        color: MyColors.pinkColor,
                                      ),
                                      CustomText(
                                        name: 'تفاصيل البطاقة',
                                        fontSize: 16.0,
                                        color: MyColors.pinkColor,
                                      ),
                                    ],
                                  ),
                                  CircleAvatar(
                                    child:
                                        Image.asset('assets/images/icon2.png'),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MaterialButton(
                                    color: MyColors.pinkColor,
                                    onPressed: () => _selectDate(context),
                                    child: Text('تاريخ الزيارة الأولى '),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                  Text(DateFormat("yyyy-MM-dd")
                                      .format(appCubit.currentDate)),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10.0,
                                ),
                                width: double.infinity,
                                height: mediaHeight / 300.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: Colors.grey[300],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextFormField(
                                    label: 'الاسم',
                                    number: 2.5,
                                    textCtrl: textCtrl,
                                  ),
                                  CustomTextFormField(
                                    label: 'العمر',
                                    number: 3.5,
                                    textCtrl: ageCtrl,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextFormField(
                                    label: 'الهاتف',
                                    number: 2.5,
                                    textCtrl: phoneCtrl,
                                  ),
                                  CustomTextFormField(
                                    label: 'رقم الإضبارة',
                                    number: 3.5,
                                    textCtrl: numberBoardCtrl,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              CustomText(
                                name: 'التشخيص',
                                color: MyColors.pinkColor,
                                fontSize: 16.0,
                              ),
                              bigTextFormField(stateCtrl),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 40.0,
                      left: 24.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                            onTap: showMyDialog,
                            child: arrowBack(32.0, Colors.white54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
