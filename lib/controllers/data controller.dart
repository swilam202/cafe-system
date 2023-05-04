import 'package:cafe/database/sqldb.dart';
import 'package:cafe/models/supplier%20model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  SQLDB sqldb = SQLDB();
  RxList users = [].obs;
  RxList suppliers = [].obs;

  getUsers(String tableName) async {
    List list = await sqldb.queryData(tableName);
    tableName == 'users' ? users.assignAll(list) : suppliers.assignAll(list);
    print('++++++++++++++++++++++++${users.value}');
  }

  updateUser(String tableName, Map<String, Object> map, int id) async {
    await sqldb.updateData(tableName, map, id);
    getUsers(tableName);
  }

  addUser(String tableName, Map<String, Object> map) async {
    await sqldb!.insertData(tableName, map);
    getUsers(tableName);
  }

  deleteUser(String tableName, int id) async {
    await sqldb.deleteData(tableName, id);
    getUsers(tableName);
  }
}
