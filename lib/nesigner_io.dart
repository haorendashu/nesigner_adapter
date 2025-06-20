import 'dart:io';
import 'dart:typed_data';

import 'package:hex/hex.dart';
import 'package:nostr_sdk/event.dart';
import 'package:nostr_sdk/utils/string_util.dart';

import 'nesigner.dart';
import 'package:flutter_nesigner_sdk/flutter_nesigner_sdk.dart';

class NesignerIO implements Nesigner {
  EspSigner? _espSigner;

  EspService? _espService;

  String? _aesKey;

  String? _pubkey;

  NesignerIO(String aesKey, {String? pubkey}) {
    _aesKey = aesKey;
    _pubkey = pubkey;
  }

  // EspService? getEspService() {
  //   return _espService;
  // }
  @override
  Future<int?> updateKey(Uint8List aesKey, String key) async {
    if (_espService != null) {
      return _espService!.updateKey(aesKey, key);
    }

    return null;
  }

  @override
  Future<bool> start() async {
    List<SerialPort>? nesignerPorts;
    if (Platform.isAndroid) {
      nesignerPorts = await AndroidSerialPort.getNesignerPorts();
    } else if (!Platform.isIOS) {
      nesignerPorts = BaseSerialPort.getNesignerPorts();
    }
    if (nesignerPorts == null || nesignerPorts.isEmpty) {
      print("No nesigner ports found.");
      print(nesignerPorts);
      return false;
    }

    SerialPort serialPort = nesignerPorts.first;
    _espService = EspService(serialPort);

    _espService!.startListening();
    await _espService!.start();
    var aesKeyBin = HEX.decode(_aesKey!);
    _espSigner = EspSigner(Uint8List.fromList(aesKeyBin), _espService!);
    return _espService!.transport.isOpen;
  }

  @override
  Future<String?> decrypt(pubkey, ciphertext) async {
    if (_espSigner != null) {
      return await _espSigner!.decrypt(pubkey, ciphertext);
    }

    return null;
  }

  @override
  Future<String?> encrypt(pubkey, plaintext) async {
    if (_espSigner != null) {
      return await _espSigner!.encrypt(pubkey, plaintext);
    }

    return null;
  }

  @override
  Future<String?> getPublicKey() async {
    if (_pubkey != null) {
      return _pubkey;
    }

    if (_espSigner != null) {
      _pubkey = await _espSigner!.getPublicKey();
    }

    return _pubkey;
  }

  @override
  Future<Map?> getRelays() async {
    return {};
  }

  @override
  Future<String?> nip44Decrypt(pubkey, ciphertext) async {
    if (_espSigner != null) {
      return await _espSigner!.nip44Decrypt(pubkey, ciphertext);
    }

    return null;
  }

  @override
  Future<String?> nip44Encrypt(pubkey, plaintext) async {
    if (_espSigner != null) {
      return await _espSigner!.nip44Encrypt(pubkey, plaintext);
    }

    return null;
  }

  @override
  Future<Event?> signEvent(Event event) async {
    if (_espSigner != null) {
      var eventMap = await _espSigner!.signEvent(event.toJson());
      if (eventMap != null) {
        var event = Event.fromJson(eventMap);
        return event;
      }
    }

    return null;
  }

  @override
  void close() {
    if (_espService != null) {
      _espService!.stop();
    }
  }
}

Nesigner getNesignerInstance(String aesKey, {String? pubkey}) {
  return NesignerIO(aesKey, pubkey: pubkey);
}

// void nesignerSetMacOSArchIsArm(bool isArm) {
//   UsbTransport.setMacOSArchIsArm(isArm);
// }

Future<bool> nesignerExist() async {
  List<SerialPort>? nesignerPorts;
  if (Platform.isAndroid) {
    nesignerPorts = await AndroidSerialPort.getNesignerPorts();
  } else if (!Platform.isIOS) {
    nesignerPorts = BaseSerialPort.getNesignerPorts();
  }
  if (nesignerPorts == null || nesignerPorts.isEmpty) {
    return false;
  }

  return true;
  // return UsbTransport.existNesigner();
}
