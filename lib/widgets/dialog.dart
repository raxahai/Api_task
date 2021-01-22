import 'package:flutter/material.dart';
import '../logic/api_integration.dart';

class PopUpDialog extends StatelessWidget {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController suite = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController website = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  suffixIcon: Icon(Icons.face),
                ),
                controller: name,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "email",
                  suffixIcon: Icon(Icons.email),
                ),
                controller: email,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "phone",
                  suffixIcon: Icon(Icons.call),
                ),
                controller: phone,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "street",
                  suffixIcon: Icon(Icons.location_on),
                ),
                controller: street,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "suite",
                ),
                controller: suite,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "City",
                  suffixIcon: Icon(Icons.location_city),
                ),
                controller: city,
              ),
            ),
            SizedBox(
              width: 250,
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Website",
                  suffixIcon: Icon(Icons.language),
                ),
                controller: website,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RawMaterialButton(
              fillColor: Colors.green[400],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "Save",
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                createUser(name.text, email.text, phone.text, street.text,
                    suite.text, city.text, website.text);
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
