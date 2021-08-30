import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:ui' as ui;

import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:sameha/constants/my_colors.dart';
import 'package:sameha/cubit/cubit.dart';
import 'package:sameha/cubit/cubit_state.dart';
import 'package:sameha/components/custom_search_form_field.dart';
import 'package:sameha/components/custom_text.dart';
import 'package:sameha/components/icons/icons.dart';

class PatientInterface extends StatefulWidget {
  const PatientInterface({Key? key}) : super(key: key);

  @override
  _PatientInterfaceState createState() => _PatientInterfaceState();
}

class _PatientInterfaceState extends State<PatientInterface> {
  @override
  Widget build(BuildContext context) {
    final mediaH = MediaQuery.of(context).size.height;
    final mediaW = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          List<Map> listPatients = appCubit.patients;

          return Scaffold(
            body: Directionality(
              textDirection: ui.TextDirection.rtl,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Container(
                      height: mediaH,
                      width: mediaW,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                    ),
                    Positioned(
                      bottom: mediaH / 15,
                      child: Container(
                        padding: EdgeInsets.all(24.0),
                        height: mediaH / 1.5,
                        width: mediaW,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white54),
                        child: new ListView.builder(
                            itemCount: listPatients.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Slidable(
                                  actionPane: SlidableDrawerActionPane(),
                                  actionExtentRatio: 0.25,
                                  actions: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        child: IconSlideAction(
                                          caption: 'حذف',
                                          color: Colors.red,
                                          icon: Icons.delete,
                                          onTap: () {
                                            appCubit.deleteDatabase(
                                                id: listPatients[index]['id']);
                                          },
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: IconSlideAction(
                                        caption: 'تحديث',
                                        color: Colors.blueGrey[400],
                                        icon: Icons.edit,
                                        onTap: () {},
                                      ),
                                    ),
                                  ],
                                  child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.grey[300],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomText(
                                                      name: listPatients[index]
                                                          ['name'],
                                                      fontSize: 16.0,
                                                      color:
                                                          MyColors.pinkColor),
                                                  CustomText(
                                                      name: listPatients[index]
                                                          ['visitDate'],
                                                      fontSize: 16.0,
                                                      color:
                                                          MyColors.pinkColor),
                                                  CustomText(
                                                      name: listPatients[index]
                                                          ['fileNumber'],
                                                      fontSize: 16.0,
                                                      color:
                                                          MyColors.pinkColor),
                                                ],
                                              ),
                                              Container(
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          MyColors.pinkColor),
                                                  height: 50.0,
                                                  width: 50.0,
                                                  child: Image.asset(
                                                    'assets/images/face.png',
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Positioned(
                      top: 40.0,
                      right: 24.0,
                      child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: arrowBack(32.0, MyColors.pinkColor)),
                    ),
                    Positioned(
                      top: mediaH / 6.5,
                      left: mediaW / 10.0,
                      right: mediaW / 10.0,
                      child: searchFormfield(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
