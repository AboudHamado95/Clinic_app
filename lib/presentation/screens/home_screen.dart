import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sameha/constants/strings.dart';
import 'package:sameha/cubit/cubit.dart';
import 'package:sameha/cubit/cubit_state.dart';
import 'package:sameha/components/custom_button.dart';
import 'package:sameha/components/icons/icons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double mediaHeight = MediaQuery.of(context).size.height;
    final double mediaWidth = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppCreateDatabaseState) {
            print('state is $state');
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/BK.png',
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: mediaHeight / 2.5,
                  right: mediaWidth / 10,
                  child: Column(
                    children: [
                      CustomButton(
                        name: 'إضافة',
                        icon: addIcon,
                        mediaW: mediaWidth,
                        mediaH: mediaHeight,
                        page: enteringThePateint,
                      ),
                      SizedBox(
                        height: mediaHeight / 20,
                      ),
                      CustomButton(
                        name: 'استعراض',
                        icon: listAltIcon,
                        mediaW: mediaWidth,
                        mediaH: mediaHeight,
                        page: patientInterface,
                      ),
                    ],
                  ),
                ),
                // CustomPaint(
                //   size: Size(mediaW, mediaH),
                //   painter: RPSCustomPainter(),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
