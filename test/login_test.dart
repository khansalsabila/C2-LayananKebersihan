import 'package:login_app/controller/user_controller.dart';
import 'package:login_app/ui/login_page.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockLoginPageController extends Mock implements UserController {}

void main() {
  group('LoginPageController Tests', () {
    test('Login Success', () async {
      final controller = MockLoginPageController();
      when(controller.login('test@example.com', 'password'))
          .thenAnswer((_) async {});

      controller.login('test@example.com', 'password');

      verify(controller.login('test@example.com', 'password')).called(1);
    });


  });
}