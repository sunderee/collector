import 'dart:math';

final _secure = Random.secure();

String generateNonce() {
  final characterCodes = List<int>.generate(16, (_) {
    switch (_secure.nextInt(3)) {
      case 0:
        return _secure.nextInt(10) + 48;
      case 1:
        return _secure.nextInt(26) + 65;
      case 2:
        return _secure.nextInt(26) + 97;
      default:
        return _secure.nextInt(10) + 48;
    }
  });
  return String.fromCharCodes(characterCodes);
}
