import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:dolarhoy/src/models/dollar_model.dart';
import 'package:dolarhoy/src/models/dollar_ambito_model.dart';

class RatesProvider {
  // String _url = 'api-dolar-argentina.herokuapp.com';

  // List<String> _endpoints = [
  //   '/api/dolaroficial',
  //   '/api/dolarblue',
  // ];

  String _url = 'mercados.ambito.com';

  List<String> _endpoints = [
    '//dolar/oficial/variacion',
    '//dolar/informal/variacion',
  ];

  Future<Dollar> getData(int index) async {
    final url = Uri.https(_url, _endpoints[index]);

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    final dollar = new Dollar.fromJson(decodedData);

    // print(dollar.buy);
    // print(dollar.sell);
    // print(dollar.date);
    // print(dollar.variation);
    // print(dollar.classVariation);

    return dollar;
  }
}
