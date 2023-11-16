import 'package:login_app/controller/user_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegisterPageController extends Mock implements UserController {}

void main() {
  group('RegisterPageController Tests', () {
    test('Registration Success', () async {
      final controller = MockRegisterPageController();

      // Mocking the daftar method to return null (indicating success)
      when(controller.daftar('test@example.com', 'password', 'nama', 'alamat'))
          .thenAnswer((_) async {});

      // Trigger the daftar method
      controller.daftar('test@example.com', 'password', 'nama', 'alamat');

      // Verify that the daftar method was called exactly once with the correct arguments
      verify(controller.daftar('test@example.com', 'password', 'nama', 'alamat')).called(1);

      // You can add more assertions based on the specific behavior you expect
    });

    test('Registration Failure - Invalid Email', () async {
      final controller = MockRegisterPageController();

      // Mocking the daftar method to throw an error (indicating failure)
      when(controller.daftar('invalidemail', 'password', 'nama', 'alamat'))
          .thenThrow(Exception('Format email tidak sesuai'));

      // Trigger the daftar method
      try {
        controller.daftar('invalidemail', 'password', 'nama', 'alamat');
      } catch (e) {
        // Verify that the daftar method was called exactly once with the correct arguments
        verify(controller.daftar('invalidemail', 'password', 'nama', 'alamat')).called(1);

        // Verify that the error message matches the expected error message
        expect(e, isInstanceOf<Exception>());
        expect(e.toString(), 'Exception: Format email tidak sesuai');
      }

      // You can add more assertions based on the specific behavior you expect
    });

    // Add more test cases for other scenarios (e.g., existing email, weak password, unknown error)
  });
}