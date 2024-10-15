import 'package:test/test.dart';
import '../NewSecCode.dart'; // استبدل بمسار الملف الأصلي الخاص بك

void main() {
  group('Authentication Tests', () {
    test('Authentication success with valid credentials', () {
      expect(authenticate('admin', 'password123'), isTrue);
    });

    test('Authentication fails with invalid username', () {
      expect(authenticate('user', 'password123'), isFalse);
    });

    test('Authentication fails with invalid password', () {
      expect(authenticate('admin', 'wrongpassword'), isFalse);
    });
  });

  group('Encryption Tests', () {
    test('Encrypt and decrypt data correctly', () {
      String originalData = "AccountNumber123456";
      String encryptedData = encryptData(originalData);
      String decryptedData = decryptData(encryptedData);
      
      expect(decryptedData, equals(originalData));
    });

    test('Encrypt data is not equal to original data', () {
      String originalData = "AccountNumber123456";
      String encryptedData = encryptData(originalData);
      
      expect(encryptedData, isNot(equals(originalData)));
    });
  });
}

