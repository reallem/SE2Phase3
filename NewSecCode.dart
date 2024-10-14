
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  // Example usage
  saveAndRetrieve("admin", "password123", "AccountNumber123456");
}

// Simple authentication
bool authenticate(String username, String password) {
  return username == "admin" && password == "password123";
}

// Encryption and Decryption using a simple key and IV
final key = encrypt.Key.fromUtf8('16characterslong');
final iv = encrypt.IV.fromUtf8('16characterslong');

// Encrypt data
String encryptData(String data) {
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  return encrypter.encrypt(data, iv: iv).base64;
}

// Decrypt data
String decryptData(String encryptedData) {
  final encrypter = encrypt.Encrypter(encrypt.AES(key));
  return encrypter.decrypt64(encryptedData, iv: iv);
}

// Save and retrieve data with authentication
void saveAndRetrieve(String username, String password, String data) {
  if (authenticate(username, password)) {
    // Encrypt and then decrypt the data
    final encrypted = encryptData(data);
    print('Encrypted: $encrypted');
    print('Decrypted: ${decryptData(encrypted)}');
  } else {
    print('Authentication failed');
  }
}
