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
      '[{\"número\":\"001401\",\"assunto_fatura\":\"Trabalhos de Design\",\"cliente\":\"Carlson Limited\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pago\",\"preço\":\"\$887\",\"criado_em\":\"15 Dez 2017\"},{\"número\":\"001402\",\"assunto_fatura\":\"Wireframes UX\",\"cliente\":\"Adobe\",\"país\":\"Reino Unido\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Pendente\",\"preço\":\"\$1200\",\"criado_em\":\"12 Abr 2017\"},{\"número\":\"001403\",\"assunto_fatura\":\"Novo Dashboard\",\"cliente\":\"Bluewolf\",\"país\":\"Alemanha\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pendente\",\"preço\":\"\$534\",\"criado_em\":\"23 Out 2017\"},{\"número\":\"001404\",\"assunto_fatura\":\"Landing Page\",\"cliente\":\"Salesforce\",\"país\":\"Brasil\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Vence em 2 semanas\",\"preço\":\"\$1500\",\"criado_em\":\"2 Set 2017\"},{\"número\":\"001405\",\"assunto_fatura\":\"Templates de Marketing\",\"cliente\":\"Printic\",\"país\":\"Polônia\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pago Hoje\",\"preço\":\"\$648\",\"criado_em\":\"29 Jan 2018\"},{\"número\":\"001406\",\"assunto_fatura\":\"Apresentação de Vendas\",\"cliente\":\"Tabdaq\",\"país\":\"Brasil\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Vence em 3 semanas\",\"preço\":\"\$300\",\"criado_em\":\"4 Fev 2018\"},{\"número\":\"001407\",\"assunto_fatura\":\"Logo e Impressão\",\"cliente\":\"Apple\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pago Hoje\",\"preço\":\"\$2500\",\"criado_em\":\"22 Mar 2018\"},{\"número\":\"001408\",\"assunto_fatura\":\"Ícones\",\"cliente\":\"Tookapic\",\"país\":\"Polônia\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Pago Hoje\",\"preço\":\"\$940\",\"criado_em\":\"13 Mai 2018\"},{\"número\":\"001409\",\"assunto_fatura\":\"Campanha Digital\",\"cliente\":\"Amazon\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pendente\",\"preço\":\"\$1750\",\"criado_em\":\"20 Abr 2018\"},{\"número\":\"001410\",\"assunto_fatura\":\"Consultoria SEO\",\"cliente\":\"HubSpot\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Pago\",\"preço\":\"\$1200\",\"criado_em\":\"18 Jan 2018\"},{\"número\":\"001411\",\"assunto_fatura\":\"Redesign de Website\",\"cliente\":\"IBM\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Vence em 1 semana\",\"preço\":\"\$890\",\"criado_em\":\"12 Dez 2017\"},{\"número\":\"001412\",\"assunto_fatura\":\"E-commerce\",\"cliente\":\"Mercado Livre\",\"país\":\"Brasil\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Pendente\",\"preço\":\"\$2100\",\"criado_em\":\"3 Nov 2017\"},{\"número\":\"001413\",\"assunto_fatura\":\"App Mobile\",\"cliente\":\"Spotify\",\"país\":\"Suécia\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pago Hoje\",\"preço\":\"\$1800\",\"criado_em\":\"28 Fev 2018\"},{\"número\":\"001414\",\"assunto_fatura\":\"Gestão de Redes Sociais\",\"cliente\":\"Meta\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://www.gov.br/planalto/pt-br/conheca-a-presidencia/acervo/simbolos-nacionais/bandeira/bandeiragrande.jpg\",\"status\":\"Pendente\",\"preço\":\"\$1500\",\"criado_em\":\"19 Out 2017\"},{\"número\":\"001415\",\"assunto_fatura\":\"Análise de Dados\",\"cliente\":\"Google\",\"país\":\"Estados Unidos\",\"bandeira\":\"https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Flag_of_the_United_States.svg/640px-Flag_of_the_United_States.svg.png\",\"status\":\"Pago\",\"preço\":\"\$2300\",\"criado_em\":\"15 Mar 2018\"}]');
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
