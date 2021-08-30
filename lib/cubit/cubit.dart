import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import 'package:sameha/cubit/cubit_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  Database? database;
  late List<Map> patients;
  DateTime currentDate = DateTime.now();

  void createDatabase() {
    openDatabase('todo.db', version: 1,
        onCreate: (Database database, int version) {
      print('database created');
      // When creating the database, create the table
      database
          .execute(
              'CREATE TABLE patients (id INTEGER PRIMARY KEY, name TEXT,age TEXT,phone TEXT,fileNumber TEXT,visitDate TEXT,diagnosis TEXT)')
          .then((value) {
        print('table created');
      }).catchError((error) {
        print('Error when Creating table ${error.toString()}');
      });
    }, onOpen: (database) {
      // open the database
      getDataFromDatabase(database).then((value) {
        patients = value;
        emit(AppGetDatabaseState());
      });
      print('database opened');
    }).then((value) {
      database = value;
      print('created $database successfully!');
      emit(AppCreateDatabaseState());
      getDataFromDatabase(database).then((value) {
        patients = value;
        emit(AppGetDatabaseState());
      });
    });
  }

  void insertDatabase(
      {required String name,
      required String age,
      required String phone,
      required String fileNumber,
      required String visitDate,
      required String diagnosis}) async {
    // Insert some records in a transaction
    await database!.transaction((txn) async {
      return txn
          .rawInsert(
              'INSERT INTO patients(name, age, phone, fileNumber, visitDate, diagnosis) VALUES("$name","$age","$phone","$fileNumber","$visitDate","$diagnosis")')
          .then((value) {
        print('$value inserted successfully!');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database).then((value) {
          patients = value;
          emit(AppGetDatabaseState());
        });
      }).catchError((error) {
        print("Error when inserted ${error.toString()}");
      });
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM patients');
  }

  void updateDatabase(
      {required int id,
      required String name,
      required String age,
      required String phone,
      required String fileNumber,
      required String visitDate,
      required String diagnosis}) async {
    // Update some record
    database!.rawUpdate(
        'UPDATE patients SET name = ?, value = ?,age = ?,phone = ?,fileNumber = ?,visitDate = ?,diagnosis = ? WHERE id = ?',
        [
          '$name',
          '$age',
          '$phone',
          '$fileNumber',
          '$visitDate',
          '$diagnosis',
          id
        ]).then((value) {
      emit(AppUpdateDatabaseState());
    });
  }

  void deleteDatabase({required int id}) {
    // Delete a record
    database!
        .rawDelete('DELETE FROM patients WHERE id = ?', [id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  void changeCurrentDate(DateTime pickedDate) {
    currentDate = pickedDate;
    emit(AppChangeCurrentDataState());
    getDataFromDatabase(database).then((value) {
      patients = value;
      emit(AppGetDatabaseState());
    });
  }
}
