import 'package:cafe/database/sqldb.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  SQLDB sqldb = SQLDB();
  List users = [
    {
      'name': 'mahmoud',
      'user': 'hoda',
      'password': 'dhfoiaue',
      'permissions': 2
    },
    {
      'name': 'mahmoud',
      'user': 'hoda',
      'password': 'dhfoiaue',
      'permissions': 2
    },
    {
      'name': 'mahmoud',
      'user': 'hoda',
      'password': 'dhfoiaue',
      'permissions': 2
    },
  ].obs;

  getUsers(String tableName) async {
    List list = await sqldb.queryData(tableName);
    users.assignAll(list);
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
