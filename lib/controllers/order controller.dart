import 'package:cafe/patterns/memento.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  final order = Order();
  final careTaker = CareTaker();
  bool cash = false;
  bool takeAway = false;
  int index = 1;
}