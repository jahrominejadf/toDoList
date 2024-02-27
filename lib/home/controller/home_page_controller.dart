import 'package:get/get.dart';
 class HomePageController extends GetxController{
  final dataList = <String>[].obs;

  void addData(String data) {
  dataList.add(data);
  }

  void removeData(int index) {
  dataList.removeAt(index);
  }
  }

