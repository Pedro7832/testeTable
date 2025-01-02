import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_json')) {
        try {
          _json = jsonDecode(prefs.getString('ff_json') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  dynamic _json = jsonDecode(
      '[{\"id\":1,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Camiseta Básica\",\"price\":49.9,\"quantity\":100},{\"id\":2,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Calça Jeans\",\"price\":129.9,\"quantity\":50},{\"id\":3,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Tênis Esportivo\",\"price\":299.9,\"quantity\":30},{\"id\":4,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Jaqueta de Couro\",\"price\":399.9,\"quantity\":20},{\"id\":5,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Relógio de Pulso\",\"price\":199.9,\"quantity\":75},{\"id\":6,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Boné Estiloso\",\"price\":59.9,\"quantity\":150},{\"id\":7,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Mochila Casual\",\"price\":249.9,\"quantity\":40},{\"id\":8,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Óculos de Sol\",\"price\":99.9,\"quantity\":85},{\"id\":9,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Chinelo Confortável\",\"price\":39.9,\"quantity\":200},{\"id\":10,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Casaco de Lã\",\"price\":349.9,\"quantity\":25},{\"id\":11,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Cinto de Couro\",\"price\":89.9,\"quantity\":120},{\"id\":12,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Blusa de Frio\",\"price\":199.9,\"quantity\":60},{\"id\":13,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Sandália Leve\",\"price\":79.9,\"quantity\":90},{\"id\":14,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Luvas de Inverno\",\"price\":49.9,\"quantity\":110},{\"id\":15,\"image_url\":\"https://plus.unsplash.com/premium_photo-1667621220861-5f297728dd39?q=80&w=3387&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D\",\"product_name\":\"Cachecol Estiloso\",\"price\":69.9,\"quantity\":80}]');
  dynamic get json => _json;
  set json(dynamic value) {
    _json = value;
    prefs.setString('ff_json', jsonEncode(value));
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
