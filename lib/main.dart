import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/controller/home_page_controller.dart';
import 'my_app.dart';

void main() {
  runApp(MyApp());
}

class CardItem extends StatelessWidget {
  final int index;

  const CardItem({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(

        title: Text(Get.find<HomePageController>().dataList[index]),

        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'تایید',
              child: Row(
                children: [
                  Icon(Icons.check),
                  SizedBox(width: 8),
                  Text('تایید'),
                ],
              ),
            ),
            const PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8),
                  Text('ویرایش'),
                ],
              ),
              value: 'ویرایش',
            ),
            PopupMenuItem(
              child: Row(
                children: [
                  Icon(Icons.delete),
                  SizedBox(width: 8),
                  Text('حذف'),
                ],
              ),
              value: 'حذف',
            ),
          ],
          onSelected: (String value) {
            if (value == 'تایید') {
              Get.snackbar(
                'پیام',
                'اطلاعات با موفقیت ثبت شد',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
            } else if (value == 'ویرایش') {
            } else if (value == 'حذف') {
              Get.find<HomePageController>().removeData(index);
              Get.snackbar(
                'پیام',
                'اطلاعات با موفقیت حذف شد',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
