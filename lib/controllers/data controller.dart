import 'package:cafe/database/sqldb.dart';
import 'package:cafe/models/supplier%20model.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  SQLDB sqldb = SQLDB();
  Map<String, String> admin = {
    'name': 'mohammed',
    'username': 'mo231',
    'password': '123456'
  };
  RxBool isAdmin = true.obs;

  List<Map<String, String>> users = [
    {'name': 'mostafa', 'username': 'd55', 'password': '68548'},
    {'name': 'ahmed', 'username': 'a734', 'password': '235484'},
    {'name': 'mohammed', 'username': 'm578', 'password': '237352'},
    {'name': 'ali', 'username': 'a87', 'password': '314575'},
    {'name': 'amr', 'username': 'a55', 'password': '89622'},
    {'name': 'yasser', 'username': 'y77', 'password': '1248250'},
  ];
  RxList suppliers = [].obs;
  RxList products = [].obs;
  RxList order = [].obs;
  RxList feedback = [].obs;

  getUsers(String tableName) async {
    List list = await sqldb.queryData(tableName);
    tableName == 'feedback'
        ? feedback.assignAll(list)
        : tableName == 'suppliers'
            ? suppliers.assignAll(list)
            : tableName == 'order'
                ? order.assignAll(list)
                : products.assignAll(list);
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
