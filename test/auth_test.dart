import 'package:test/test.dart';
import 'NewSecCode.dart'; // استيراد الملف مباشرةً من نفس المجلد

void main() {
  test('Test authenticate with correct credentials', () {
    expect(authenticate('admin', 'password123'), isTrue);
  });

  test('Test authenticate with incorrect credentials', () {
    expect(authenticate('user', 'password123'), isFalse);
  });

  test('Test authenticate with wrong password', () {
    expect(authenticate('admin', 'wrongpassword'), isFalse);
  });

  test('Test encryptData and decryptData', () {
    String originalData = 'Sensitive Data';
    String encryptedData = encryptData(originalData);
    String decryptedData = decryptData(encryptedData);
    expect(decryptedData, equals(originalData));
  });
}
