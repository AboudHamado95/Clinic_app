// import 'package:flutter/material.dart';
// import 'dart:ui' as ui;

// Future<void> showMyDialog(context) async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return Directionality(
//           textDirection: ui.TextDirection.rtl,
//           child: AlertDialog(
//             title: Text('الرجوع إلى القائمة الرئيسية:'),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   Text('هل أنت متأكد بالرجوع؟'),
//                 ],
//               ),
//             ),
//             actions: <Widget>[
//               TextButton(
//                 child: Text('موافق'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//               TextButton(
//                 child: Text('إلغاء'),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }