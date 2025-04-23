import 'dart:typed_data';

import 'package:nesigner_adapter/nesigner.dart';
import 'package:nostr_sdk/event.dart';

class NesignerWeb implements Nesigner {
  @override
  void close() {}

  @override
  Future<String?> decrypt(pubkey, ciphertext) {
    throw UnimplementedError();
  }

  @override
  Future<String?> encrypt(pubkey, plaintext) {
    throw UnimplementedError();
  }

  @override
  Future<String?> getPublicKey() {
    throw UnimplementedError();
  }

  @override
  Future<Map?> getRelays() {
    throw UnimplementedError();
  }

  @override
  Future<String?> nip44Decrypt(pubkey, ciphertext) {
    throw UnimplementedError();
  }

  @override
  Future<String?> nip44Encrypt(pubkey, plaintext) {
    throw UnimplementedError();
  }

  @override
  Future<Event?> signEvent(Event event) {
    throw UnimplementedError();
  }

  @override
  Future<bool> start() {
    throw UnimplementedError();
  }

  @override
  Future<int?> updateKey(Uint8List aesKey, String key) {
    throw UnimplementedError();
  }
}

Nesigner getNesignerInstance(String aesKey, {String? pubkey}) =>
    throw UnsupportedError('Unsupported Platform');

bool nesignerExist() => throw UnsupportedError('Unsupported Platform');

void nesignerSetMacOSArchIsArm(bool isArm) =>
    throw UnsupportedError('Unsupported Platform');
