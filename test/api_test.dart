import 'package:api_task/logic/api_integration.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

main() {
  userFlowTest();
}

void userFlowTest() {
  group("api flow test", () {
    test("fetch user test", () async {
      http.Response response =
          await http.get("https://jsonplaceholder.typicode.com/users");
      expect(response, isNotNull);
    });

    test("detailed user test", () async {
      final response =
          await http.get('https://jsonplaceholder.typicode.com/users/${1}');
      expect(response, isNotNull);
    });
  });
}
