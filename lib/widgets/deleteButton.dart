import 'package:api_task/logic/api_integration.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
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
        deleteUser(id);
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100))),
      constraints: (BoxConstraints(minWidth: 20)),
    );
  }
}
