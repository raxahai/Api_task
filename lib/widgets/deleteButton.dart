import 'package:api_task/logic/api_integration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteButton extends StatelessWidget {
  final ApiController controller = Get.find();
  final int id;
  DeleteButton({this.id});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      onPressed: () {
        // print(id);
        controller.deleteUser(id);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      constraints: (BoxConstraints(minWidth: 20)),
    );
  }
}
