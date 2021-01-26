import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final int userId;
  final String name;
  final String phone;
  final String email;
  final String street;
  final String suite;
  final String city;
  final String website;

  User(
      {this.userId,
      this.name,
      this.phone,
      this.email,
      this.street,
      this.suite,
      this.city,
      this.website});

  factory User.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return User(
          userId: json['id'],
          name: json['name'],
          phone: json['phone'],
          email: json['email'],
          street: json['address']['street'],
          suite: json['address']['suite'],
          city: json['address']['city'],
          website: json['website']);
    }
    return null;
  }
}

class ApiController extends GetxController {
  Future<List<User>> fetchUser() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List responseJSON = json.decode(response.body);
      return responseJSON.map((m) => new User.fromJson(m)).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load User');
    }
  }

  Future<User> detailedUser(int id) async {
    final response = await http
        .get('https://jsonplaceholder.typicode.com/users/' + id.toString());

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load User');
    }
  }

  Future<User> createUser(String name, String email, String phone,
      String street, String suite, String city, String website) async {
    final http.Response response = await http.post(
      'https://jsonplaceholder.typicode.com/users/',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'email': email,
        'phone': phone,
        'address': {
          'street': street,
          'suite': suite,
          'city': city,
        },
        'website': website,
      }),
    );

    if (response.statusCode == 201) {
      print("data sent");
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

  Future<User> deleteUser(int id) async {
    final http.Response response = await http.delete(
      'https://jsonplaceholder.typicode.com/users/' + id.toString(),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
      print("Deleted");
      return User.fromJson(jsonDecode(response.body));
      // return
    } else {
      throw Exception("cant delete user");
    }
  }

  Future<User> updateUser(int id, String name, String email, String phone,
      String street, String suite, String city, String website) async {
    final http.Response response = await http.put(
        'https://jsonplaceholder.typicode.com/users/' + id.toString(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': name,
          'email': email,
          'phone': phone,
          'address': {
            'street': street,
            'suite': suite,
            'city': city,
          },
          'website': website,
        }));

    if (response.statusCode == 200) {
      print("UPDATED");
      print(response.body);
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("User not Updated");
    }
  }
}
